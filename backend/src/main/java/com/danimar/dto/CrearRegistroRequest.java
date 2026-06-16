package com.danimar.dto;

import java.util.List;

// Cuerpo de la petición para crear una orden (registro):
// el paciente, observaciones y los exámenes seleccionados.
public record CrearRegistroRequest(Long idPaciente, String observaciones, List<Long> idExamenes) {
}
