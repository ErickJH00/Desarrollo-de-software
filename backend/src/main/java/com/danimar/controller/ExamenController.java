package com.danimar.controller;

import com.danimar.dto.ExamenDTO;
import com.danimar.model.Examen;
import com.danimar.repository.ExamenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Expone el catálogo de exámenes (todos o filtrados por categoría).
 */
@RestController
@RequestMapping("/api/examenes")
public class ExamenController {

    @Autowired
    private ExamenRepository repository;

    @GetMapping
    public List<ExamenDTO> getAll() {
        return repository.findAll().stream().map(this::toDto).collect(Collectors.toList());
    }

    @GetMapping("/categoria/{idCat}")
    public List<ExamenDTO> getByCategoria(@PathVariable Long idCat) {
        return repository.findByCategoriaId(idCat).stream().map(this::toDto).collect(Collectors.toList());
    }

    private ExamenDTO toDto(Examen e) {
        Long idCat = (e.getCategoria() != null) ? e.getCategoria().getId() : null;
        return new ExamenDTO(e.getId(), e.getNombre(), e.getCodigo(), idCat, e.getCosto());
    }
}
