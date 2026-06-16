package com.danimar.dto;

import java.math.BigDecimal;

// DTO ligero para exponer un examen sin arrastrar la entidad Categoria completa.
public record ExamenDTO(Long id, String nombre, String codigo, Long idCategoria, BigDecimal costo) {
}
