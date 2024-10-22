package com.ecg.app.repositories.custom;

import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;

import java.util.Set;

public interface CustomTesteRepository {
    Set<TesteQuestao> getNewExercicios(Teste teste_id);

    Set<TesteQuestao> findExercicios(Teste teste);
}
