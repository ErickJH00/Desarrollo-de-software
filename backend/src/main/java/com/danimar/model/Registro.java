package com.danimar.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tdregistro", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"fecha_aten", "numero_diario"})
})
public class Registro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_reg")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_pac", nullable = false)
    private Paciente paciente;

    @Column(name = "fecha_aten", nullable = false)
    private LocalDate fechaAtencion;

    @Column(name = "numero_diario", nullable = false)
    private Integer numeroDiario;

    @Column(name = "observaciones", columnDefinition = "TEXT")
    private String observaciones;
}
