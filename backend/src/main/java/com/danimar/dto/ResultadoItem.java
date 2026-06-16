package com.danimar.dto;

// Un valor de resultado a guardar: a qué detalle (examen de la orden) y a qué
// campo (parámetro) corresponde, y el valor obtenido.
public record ResultadoItem(Long idDetalle, Long idCampo, String valor) {
}
