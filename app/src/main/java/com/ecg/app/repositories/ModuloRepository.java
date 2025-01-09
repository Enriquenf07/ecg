package com.ecg.app.repositories;

import com.ecg.app.dto.TesteDTO;
import com.ecg.app.models.Modulo;
import com.ecg.app.models.Teste;
import com.ecg.app.repositories.custom.ModuloRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ModuloRepository extends JpaRepository<Modulo, Integer>, ModuloRepositoryCustom {
    @Query(value = "SELECT t.id, t.data_hora, t.acertadas, t.hora_encerramento FROM teste_usuario t " +
            "WHERE t.modulo_id = :modulo AND t.usuario_id = :usuario", nativeQuery = true)
    Page<Object[]> getResultados(@Param("modulo") Integer modulo, @Param("usuario") Integer usuario, Pageable pageable);
}
