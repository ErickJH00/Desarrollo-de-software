package com.danimar.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tmcampos")
public class Campo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cam")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_exa", nullable = false)
    private Examen examen;

    @Column(name = "nombre_cam", nullable = false, length = 100)
    private String nombre;

    @Column(name = "unidad", length = 50)
    private String unidad;

    @Column(name = "referencia", length = 150)
    private String referencia;
}
