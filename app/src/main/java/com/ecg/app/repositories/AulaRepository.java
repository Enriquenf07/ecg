package com.ecg.app.repositories;

import com.ecg.app.models.Aula;
import com.ecg.app.repositories.custom.AulaCustomRepository;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AulaRepository extends JpaRepository<Aula, Integer>, AulaCustomRepository {

}
