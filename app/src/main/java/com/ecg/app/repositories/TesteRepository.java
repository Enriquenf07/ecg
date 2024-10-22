package com.ecg.app.repositories;

import com.ecg.app.models.Modulo;
import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;
import com.ecg.app.models.Usuario;
import com.ecg.app.repositories.custom.CustomTesteRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface TesteRepository extends JpaRepository<Teste, Integer>, CustomTesteRepository {

    Optional<Teste> findByUsuarioAndModuloAndEmAndamento(Usuario id, Modulo id1, boolean emAndamento);


}
