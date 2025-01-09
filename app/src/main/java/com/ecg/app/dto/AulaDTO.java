package com.ecg.app.dto;

import jakarta.persistence.SqlResultSetMapping;
import jakarta.persistence.ConstructorResult;
import jakarta.persistence.ColumnResult;


public record AulaDTO(String descricao, Integer id, Long modulosTotais, Long modulosConcluidos) {
}

