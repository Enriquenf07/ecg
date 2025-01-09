package com.ecg.app.repositories.custom.impl;

import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;
import com.ecg.app.repositories.custom.CustomTesteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.Tuple;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CustomTesteRepositoryImpl implements CustomTesteRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public Set<TesteQuestao> getNewExercicios(Teste teste) {
        String sql = "SELECT * FROM questao q WHERE modulo_id = :modulo";
        Query query = entityManager.createNativeQuery(sql, Tuple.class);
        query.setParameter("modulo", teste.getModulo().getId());
        List<Tuple> lista = query.getResultList();

        Collections.shuffle(lista);
        lista = lista.stream().limit(10).collect(Collectors.toList());
        //salvar lista e retornar, mudat nome do metodo, e chamar outro para salvar os exercios, deixar esse como getNewExercicios
        List<Tuple> finalLista = lista;

        return IntStream.range(0, lista.size())
                .mapToObj(i -> {
                    HashMap<String, Object> map = new HashMap<>();
                    map.put("a", finalLista.get(i).get("a"));
                    map.put("b", finalLista.get(i).get("b"));
                    map.put("c", finalLista.get(i).get("c"));
                    map.put("d", finalLista.get(i).get("d"));
                    map.put("e", finalLista.get(i).get("e"));
                    return TesteQuestao.builder()
                            .enunciado(finalLista.get(i).get("enunciado").toString())
                            .numero(i + 1)
                            .alternativas(map)
                            .respostaCerta(finalLista.get(i).get("resposta").toString())
                            .testeId(teste.getId())
                            .questaoId(Integer.parseInt(finalLista.get(i).get("id").toString()))
                            .build();
                })
                .collect(Collectors.toSet());
    }

    public Set<TesteQuestao> findExercicios(Teste teste) {
        String sql = "SELECT t.*, q.*, t.id as tq_id, q.id as questao_id, t.resposta AS teste_resposta, q.resposta AS questao_resposta FROM teste_usuario_questao t LEFT JOIN questao q on t.questao_id = q.id" +
                " WHERE t.teste_usuario_id = :id";
        Query query = entityManager.createNativeQuery(sql, Tuple.class);
        query.setParameter("id", teste.getId());
        List<Tuple> lista = query.getResultList();
        return lista.stream().map(tuple -> {
                    HashMap<String, Object> map = new HashMap<>();
                    map.put("a", tuple.get("a"));
                    map.put("b", tuple.get("b"));
                    map.put("c", tuple.get("c"));
                    map.put("d", tuple.get("d"));
                    map.put("e", tuple.get("e"));
                    return TesteQuestao.builder()
                            .id(Integer.parseInt(tuple.get("tq_id").toString()))
                            .enunciado(tuple.get("enunciado").toString())
                            .numero(Integer.parseInt(tuple.get("numero").toString()))
                            .alternativas(map)
                            .respostaCerta(tuple.get("questao_resposta").toString())
                            .resposta(tuple.get("teste_resposta") != null
                                    ? tuple.get("teste_resposta").toString() : null)
                            .testeId(teste.getId())
                            .questaoId(Integer.parseInt(tuple.get("questao_id").toString()))
                            .build();
                })
                .collect(Collectors.toSet());
    }
}
