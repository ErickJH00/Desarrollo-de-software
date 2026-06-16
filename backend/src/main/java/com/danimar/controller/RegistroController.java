package com.danimar.controller;

import com.danimar.dto.*;
import com.danimar.exception.ResourceNotFoundException;
import com.danimar.model.*;
import com.danimar.repository.*;
import com.danimar.service.ReporteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Módulo de órdenes y reportes: crear una orden, listar, ver el reporte
 * (con costo total) y guardar los resultados de los exámenes.
 */
@RestController
@RequestMapping("/api/registros")
public class RegistroController {

    @Autowired private RegistroRepository registroRepo;
    @Autowired private DetalleRepository detalleRepo;
    @Autowired private ResultadoRepository resultadoRepo;
    @Autowired private ExamenRepository examenRepo;
    @Autowired private CampoRepository campoRepo;
    @Autowired private PacienteRepository pacienteRepo;
    @Autowired private ReporteService reporteService;

    /** Lista todas las órdenes con su costo total. */
    @GetMapping
    @Transactional(readOnly = true)
    public List<RegistroDTO> getAll() {
        List<RegistroDTO> lista = new ArrayList<>();
        for (Registro r : registroRepo.findAll()) {
            Paciente p = r.getPaciente();
            lista.add(new RegistroDTO(r.getId(), p.getCedula(), p.getNombreCompleto(),
                    r.getFechaAtencion(), r.getNumeroDiario(), reporteService.costoTotal(r.getId())));
        }
        return lista;
    }

    /** Crea una orden para un paciente con los exámenes seleccionados. */
    @PostMapping
    @Transactional
    public ReporteDTO crear(@RequestBody CrearRegistroRequest req) {
        Paciente paciente = pacienteRepo.findById(req.idPaciente())
                .orElseThrow(() -> new ResourceNotFoundException("Paciente no encontrado"));

        Registro reg = new Registro();
        reg.setPaciente(paciente);
        reg.setFechaAtencion(LocalDate.now());
        reg.setObservaciones(req.observaciones());

        // Número consecutivo del día (1, 2, 3... por fecha).
        LocalDate hoy = LocalDate.now();
        long delDia = registroRepo.findAll().stream()
                .filter(r -> hoy.equals(r.getFechaAtencion())).count();
        reg.setNumeroDiario((int) delDia + 1);
        reg = registroRepo.save(reg);

        // Un detalle por cada examen solicitado.
        if (req.idExamenes() != null) {
            for (Long idEx : req.idExamenes()) {
                Examen e = examenRepo.findById(idEx)
                        .orElseThrow(() -> new ResourceNotFoundException("Examen no encontrado: " + idEx));
                Detalle d = new Detalle();
                d.setRegistro(reg);
                d.setExamen(e);
                detalleRepo.save(d);
            }
        }
        return reporteService.armarReporte(reg.getId());
    }

    /** Reporte completo de una orden (sirve también para cargar resultados). */
    @GetMapping("/{id}/reporte")
    public ReporteDTO reporte(@PathVariable Long id) {
        return reporteService.armarReporte(id);
    }

    /** Guarda (o actualiza) los valores de los resultados de una orden. */
    @PostMapping("/{id}/resultados")
    @Transactional
    public ResponseEntity<?> guardarResultados(@PathVariable Long id,
                                               @RequestBody List<ResultadoItem> items) {
        for (ResultadoItem item : items) {
            if (item.valor() == null || item.valor().isBlank()) {
                continue;
            }
            Detalle d = detalleRepo.findById(item.idDetalle())
                    .orElseThrow(() -> new ResourceNotFoundException("Detalle no encontrado"));
            Campo c = campoRepo.findById(item.idCampo())
                    .orElseThrow(() -> new ResourceNotFoundException("Campo no encontrado"));

            // Si ya existe un resultado para (detalle, campo) se actualiza; si no, se crea.
            Resultado res = resultadoRepo.findByDetalleId(d.getId()).stream()
                    .filter(r -> r.getCampo().getId().equals(c.getId()))
                    .findFirst().orElseGet(Resultado::new);
            res.setDetalle(d);
            res.setCampo(c);
            res.setValor(item.valor());
            resultadoRepo.save(res);
        }
        return ResponseEntity.ok().build();
    }

    /** Elimina una orden y sus detalles/resultados. */
    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> eliminar(@PathVariable Long id) {
        Registro reg = registroRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Orden no encontrada"));
        for (Detalle d : detalleRepo.findByRegistroId(id)) {
            for (Resultado r : resultadoRepo.findByDetalleId(d.getId())) {
                resultadoRepo.delete(r);
            }
            detalleRepo.delete(d);
        }
        registroRepo.delete(reg);
        return ResponseEntity.ok().build();
    }
}
