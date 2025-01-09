package com.ecg.app.repositories.custom;

import com.ecg.app.dto.TesteDTO;
import com.ecg.app.models.Modulo;
import com.ecg.app.models.Teste;
import com.ecg.app.models.Usuario;

public interface ModuloRepositoryCustom {

    void setModuloConcluido(Modulo modulo, Usuario usuario);
}
