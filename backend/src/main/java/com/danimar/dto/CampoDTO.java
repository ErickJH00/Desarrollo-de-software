package com.danimar.dto;

// DTO ligero para exponer un campo (parámetro) de un examen.
public record CampoDTO(Long id, String nombre, String unidad, String referencia) {
}
