package com.ecg.app.repositories.custom.impl;

import com.ecg.app.dto.TesteDTO;
import com.ecg.app.models.Modulo;
import com.ecg.app.models.Teste;
import com.ecg.app.models.Usuario;
import com.ecg.app.repositories.custom.ModuloRepositoryCustom;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

public class ModuloRepositoryCustomImpl implements ModuloRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void setModuloConcluido(Modulo modulo, Usuario usuario) {
        String sql = "UPDATE modulo_usuario SET concluido = true WHERE modulo = :moduloId AND usuario = :usuarioId";

        Query query = entityManager.createNativeQuery(sql);

        query.setParameter("moduloId", modulo.getId());
        query.setParameter("usuarioId", usuario.getId());

        query.executeUpdate();
    }
}
