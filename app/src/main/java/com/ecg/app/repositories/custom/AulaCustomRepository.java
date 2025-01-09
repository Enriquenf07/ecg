package com.ecg.app.repositories.custom;

import com.ecg.app.dto.AulaDTO;
import com.ecg.app.dto.ModuloDTO;
import com.ecg.app.models.Aula;
import com.ecg.app.models.Usuario;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AulaCustomRepository{
    List<AulaDTO> pesquisar(Usuario usuario);
    List<ModuloDTO> getAllModulosByAula(Aula aula, Usuario usuario);
}
