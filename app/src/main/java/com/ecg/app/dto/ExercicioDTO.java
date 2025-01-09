package com.ecg.app.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExercicioDTO {
    private Integer numero;
    private String resposta;
    private String respostaCerta;
    private String enunciado;
    private String respostaDescricao;
    private String respostaCertaDescricao;

    public ExercicioDTO(Object[] data){
        resposta = (String) data[0];
        numero = (Integer) data[1];
        respostaCerta = (String) data[2];
        enunciado = (String) data[3];
        respostaDescricao = (String) data[4];
        respostaCertaDescricao = (String) data[5];
    }
}
