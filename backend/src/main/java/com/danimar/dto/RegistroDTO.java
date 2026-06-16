package com.danimar.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

// Resumen de una orden (registro) para los listados.
public record RegistroDTO(Long id, String cedula, String paciente,
                          LocalDate fecha, Integer numeroDiario, BigDecimal costoTotal) {
}
