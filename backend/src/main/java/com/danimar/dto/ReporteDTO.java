package com.danimar.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

// Reporte completo de una orden: datos del paciente, exámenes con sus campos
// y valores, y el costo total. Sirve tanto para la pantalla de carga de
// resultados como para la vista/impresión del reporte.
public record ReporteDTO(
        Long idRegistro,
        String cedula,
        String paciente,
        LocalDate fecha,
        Integer numeroDiario,
        String observaciones,
        BigDecimal costoTotal,
        List<ExamenReporte> examenes) {

    public record ExamenReporte(
            Long idDetalle,
            Long idExamen,
            String nombreExamen,
            String codigo,
            BigDecimal costo,
            List<CampoReporte> campos) {
    }

    public record CampoReporte(
            Long idCampo,
            String nombre,
            String unidad,
            String referencia,
            String valor) {
    }
}
