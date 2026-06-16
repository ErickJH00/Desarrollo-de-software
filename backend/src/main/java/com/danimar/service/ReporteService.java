package com.danimar.service;

import com.danimar.dto.ReporteDTO;
import com.danimar.exception.ResourceNotFoundException;
import com.danimar.model.*;
import com.danimar.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * Lógica de negocio para las órdenes: cálculo del costo total y armado del
 * reporte completo (paciente + exámenes + campos + resultados).
 */
@Service
public class ReporteService {

    @Autowired private RegistroRepository registroRepo;
    @Autowired private DetalleRepository detalleRepo;
    @Autowired private CampoRepository campoRepo;
    @Autowired private ResultadoRepository resultadoRepo;

    /** Costo total de una orden = suma del costo de los exámenes que la componen. */
    @Transactional(readOnly = true)
    public BigDecimal costoTotal(Long idRegistro) {
        BigDecimal total = BigDecimal.ZERO;
        for (Detalle d : detalleRepo.findByRegistroId(idRegistro)) {
            BigDecimal c = d.getExamen().getCosto();
            total = total.add(c != null ? c : BigDecimal.ZERO);
        }
        return total;
    }

    /** Arma el reporte completo de una orden. */
    @Transactional(readOnly = true)
    public ReporteDTO armarReporte(Long idRegistro) {
        Registro reg = registroRepo.findById(idRegistro)
                .orElseThrow(() -> new ResourceNotFoundException("Orden no encontrada"));

        BigDecimal total = BigDecimal.ZERO;
        List<ReporteDTO.ExamenReporte> examenes = new ArrayList<>();

        for (Detalle d : detalleRepo.findByRegistroId(idRegistro)) {
            Examen e = d.getExamen();
            BigDecimal costo = (e.getCosto() != null) ? e.getCosto() : BigDecimal.ZERO;
            total = total.add(costo);

            // Valores ya registrados para este detalle (por id de campo).
            Map<Long, String> valores = new HashMap<>();
            for (Resultado r : resultadoRepo.findByDetalleId(d.getId())) {
                valores.put(r.getCampo().getId(), r.getValor());
            }

            // Campos (parámetros) del examen, con su valor si existe.
            List<ReporteDTO.CampoReporte> campos = new ArrayList<>();
            for (Campo c : campoRepo.findByExamenId(e.getId())) {
                campos.add(new ReporteDTO.CampoReporte(
                        c.getId(), c.getNombre(), c.getUnidad(), c.getReferencia(),
                        valores.get(c.getId())));
            }

            examenes.add(new ReporteDTO.ExamenReporte(
                    d.getId(), e.getId(), e.getNombre(), e.getCodigo(), costo, campos));
        }

        Paciente p = reg.getPaciente();
        return new ReporteDTO(
                reg.getId(), p.getCedula(), p.getNombreCompleto(),
                reg.getFechaAtencion(), reg.getNumeroDiario(), reg.getObservaciones(),
                total, examenes);
    }
}
