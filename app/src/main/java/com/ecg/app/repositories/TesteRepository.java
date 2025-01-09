package com.ecg.app.repositories;

import com.ecg.app.dto.TesteDTO;
import com.ecg.app.models.Modulo;
import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;
import com.ecg.app.models.Usuario;
import com.ecg.app.repositories.custom.CustomTesteRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface TesteRepository extends JpaRepository<Teste, Integer>, CustomTesteRepository {

    Optional<Teste> findByUsuarioAndModuloAndEmAndamento(Usuario id, Modulo id1, boolean emAndamento);

    @Query(value="SELECT t.resposta, t.numero, \n" +
            "q.resposta as resposta_certa, \n" +
            "q.enunciado, \n" +
            "CASE \n" +
            "    WHEN t.resposta = 'a' THEN a\n" +
            "    WHEN t.resposta = 'b' THEN b\n" +
            "    WHEN t.resposta = 'c' THEN c\n" +
            "    WHEN t.resposta = 'd' THEN d\n" +
            "    WHEN t.resposta = 'e' THEN e\n" +
            "    ELSE NULL\n" +
            "  END AS resposta_descricao,\n" +
            "CASE \n" +
            "    WHEN q.resposta = 'a' THEN a\n" +
            "    WHEN q.resposta = 'b' THEN b\n" +
            "    WHEN q.resposta = 'c' THEN c\n" +
            "    WHEN q.resposta = 'd' THEN d\n" +
            "    WHEN q.resposta = 'e' THEN e\n" +
            "    ELSE NULL\n" +
            "  END AS resposta_certa_descricao\n" +
            "FROM teste_usuario_questao t left join questao q on q.id = t.questao_id  WHERE t.teste_usuario_id = :id",nativeQuery = true)
    List<Object[]> carregar(@Param("id") Integer testeId);
}
