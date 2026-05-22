package com.danimar.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tddetalle", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"fkid_reg", "fkid_exa"})
})
public class Detalle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_det")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_reg", nullable = false)
    private Registro registro;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_exa", nullable = false)
    private Examen examen;
}
