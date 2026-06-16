package com.danimar.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tmexamenes")
public class Examen {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_exa")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_cat", nullable = false)
    private Categoria categoria;

    @Column(name = "nombre_exa", nullable = false, length = 150)
    private String nombre;

    @Column(name = "codigo_exa", unique = true, length = 30)
    private String codigo;

    // Costo (precio) del examen. Se usa para calcular el costo total de una orden.
    @Column(name = "costo_exa", precision = 10, scale = 2)
    private BigDecimal costo = BigDecimal.ZERO;
}
