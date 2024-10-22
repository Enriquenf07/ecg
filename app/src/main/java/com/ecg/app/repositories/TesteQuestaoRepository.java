package com.ecg.app.repositories;

import com.ecg.app.models.TesteQuestao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TesteQuestaoRepository extends JpaRepository<TesteQuestao, Integer> {
    Optional<TesteQuestao> findByTesteIdAndNumero(Integer id, Integer questao);
}
