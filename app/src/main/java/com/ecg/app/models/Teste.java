package com.ecg.app.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "teste_usuario")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Teste {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;
    @ManyToOne
    @JoinColumn(name = "modulo_id")
    private Modulo modulo;
    @Column(name = "em_andamento")
    private boolean emAndamento;
    @Column(name = "data_hora")
    private LocalDateTime dataHora;
    private Integer acertadas;
    @Transient
    private Set<TesteQuestao> exercicios;

    public void init(){
        acertadas = 0;
    }
}
