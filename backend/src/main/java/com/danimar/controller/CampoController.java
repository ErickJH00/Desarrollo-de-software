package com.danimar.controller;

import com.danimar.dto.CampoDTO;
import com.danimar.repository.CampoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Expone los campos (parámetros) de un examen, con su unidad y valor de referencia.
 */
@RestController
@RequestMapping("/api/campos")
public class CampoController {

    @Autowired
    private CampoRepository repository;

    @GetMapping("/examen/{idExa}")
    public List<CampoDTO> getByExamen(@PathVariable Long idExa) {
        return repository.findByExamenId(idExa).stream()
                .map(c -> new CampoDTO(c.getId(), c.getNombre(), c.getUnidad(), c.getReferencia()))
                .collect(Collectors.toList());
    }
}
