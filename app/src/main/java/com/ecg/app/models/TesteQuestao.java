package com.ecg.app.models;

import jakarta.persistence.*;
import lombok.*;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Objects;

@Entity
@Table(name = "teste_usuario_questao")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TesteQuestao {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Transient
    private HashMap<String, Object> alternativas;
    @Transient
    private String enunciado;
    private Integer numero;
    private String resposta;
    @Transient
    private String respostaCerta;
    @Column(name = "questao_id")
    private Integer questaoId;
    @Column(name = "teste_usuario_id")
    private Integer testeId;
}
