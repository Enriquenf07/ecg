package com.ecg.app.dto;

import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TesteDTO {
    private Integer id;
    private LocalDateTime dataHora;
    private LocalDateTime horaEncerramento;
    private Set<TesteQuestao> exercicios;
    private Integer acertadas;
    private Boolean emAndamento;

    public TesteDTO(Teste teste){
        this.id = teste.getId();
        this.dataHora = teste.getDataHora();
        this.exercicios = teste.getExercicios();
        this.acertadas = teste.getAcertadas();
        this.horaEncerramento = teste.getHoraEncerramento();
    }

    public TesteDTO(Object[] object){
        this.id = (Integer) object[0];
        Timestamp time = (Timestamp) object[1];
        this.dataHora = time.toLocalDateTime();
        this.acertadas = (Integer) object[2];
        Timestamp timeEncerramento = (Timestamp) object[3];
        if(timeEncerramento != null){
            this.horaEncerramento = timeEncerramento.toLocalDateTime();
        }
    }
}
