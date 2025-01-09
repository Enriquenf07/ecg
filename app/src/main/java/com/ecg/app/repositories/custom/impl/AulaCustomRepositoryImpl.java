package com.ecg.app.repositories.custom.impl;

import com.ecg.app.dto.AulaDTO;
import com.ecg.app.dto.ModuloDTO;
import com.ecg.app.models.Aula;
import com.ecg.app.models.Usuario;
import com.ecg.app.repositories.custom.AulaCustomRepository;
import com.ecg.app.repositories.custom.ModuloRepositoryCustom;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


public class AulaCustomRepositoryImpl implements AulaCustomRepository {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<AulaDTO> pesquisar(Usuario usuario) {
        String sql = "SELECT \n" +
                "  a.descricao, \n" +
                "  a.id, \n" +
                "  COUNT(m.id) as modulosTotais,\n" +
                "  SUM(CASE WHEN mu.concluido = TRUE THEN 1 ELSE 0 END) as modulosConcluidos\n" +
                "FROM modulo_usuario mu \n" +
                "JOIN modulo m ON m.id = mu.modulo \n" +
                "JOIN aula a ON a.id = m.aula\n" +
                "WHERE mu.usuario = :usuario\n" +
                "GROUP BY a.id, a.descricao ";

        List<Object[]> resultList =  entityManager.createNativeQuery(sql)
                .setParameter("usuario", usuario.getId())
                .getResultList();

        return resultList.stream().map(item -> {
            String descricao = (String) item[0];
            Integer id = (Integer) item[1];
            Long modulosTotais = (Long) item[2];
            Long modulosConcluidos = (Long) item[3];
            return new AulaDTO(descricao, id, modulosTotais, modulosConcluidos);
        }).collect(Collectors.toList());
    }

    @Override
    public List<ModuloDTO> getAllModulosByAula(Aula aula, Usuario usuario) {
        String sql =
                "SELECT modulo.nome, modulo.id, modulo_usuario.concluido " +
                        "FROM modulo_usuario JOIN modulo ON modulo.id = modulo_usuario.modulo " +
                        "WHERE modulo.aula = :aula AND modulo_usuario.usuario = :usuario";

        List<Object[]> resultList =  entityManager.createNativeQuery(sql)
                .setParameter("aula", aula.getId())
                .setParameter("usuario", usuario.getId())
                .getResultList();

        return resultList.stream().map(item -> {
            String descricao = (String) item[0];
            Integer id = (Integer) item[1];
            Boolean concluido = (Boolean) item[2];
            return new ModuloDTO(descricao, id, concluido);
        }).collect(Collectors.toList());
    }
}