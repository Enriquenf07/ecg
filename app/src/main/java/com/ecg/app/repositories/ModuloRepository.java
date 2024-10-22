package com.ecg.app.repositories;

import com.ecg.app.models.Modulo;
import com.ecg.app.repositories.custom.ModuloRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ModuloRepository extends JpaRepository<Modulo, Integer>, ModuloRepositoryCustom {

    ;
}
