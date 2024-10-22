package com.ecg.app.repositories.custom.impl;

import com.ecg.app.repositories.custom.ModuloRepositoryCustom;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ModuloRepositoryCustomImpl implements ModuloRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    @Transactional
    public void iniciarTeste(Integer moduloId, Integer usuarioId) {
        String sql = "INSERT INTO teste_usuario (modulo_id, usuario_id, data_hora, em_andamento) VALUES (:moduloId, :usuarioId, :data, true)";

        Query query = entityManager.createNativeQuery(sql);

        query.setParameter("moduloId", moduloId);
        query.setParameter("usuarioId", usuarioId);
        query.setParameter("data", Timestamp.valueOf(LocalDateTime.now()));

        query.executeUpdate();
    }
}
