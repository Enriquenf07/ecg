package com.ecg.app.dto;

import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Set;

@Data
public class TesteDTO {
    private Integer id;
    private LocalDateTime dataHora;
    private Set<TesteQuestao> exercicios;
    private Integer acertadas;

    public TesteDTO(Teste teste){
        this.id = teste.getId();
        this.dataHora = teste.getDataHora();
        this.exercicios = teste.getExercicios();
        this.acertadas = teste.getAcertadas();
    }
}
