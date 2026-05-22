package com.danimar.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tdresultados", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"fkid_det", "fkid_cam"})
})
public class Resultado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_res")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_det", nullable = false)
    private Detalle detalle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkid_cam", nullable = false)
    private Campo campo;

    @Column(name = "valor", length = 100)
    private String valor;

    @Column(name = "fecha_reg", nullable = false)
    private LocalDateTime fechaRegistro;

    @PrePersist
    protected void onCreate() {
        if (fechaRegistro == null) {
            fechaRegistro = LocalDateTime.now();
        }
    }
}
