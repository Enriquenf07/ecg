package com.ecg.app.beans;

import com.ecg.app.models.Usuario;
import com.ecg.app.repositories.UsuarioRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Data
public class UsuarioBean {
    private Usuario user;
    private final UsuarioRepository repository;

    @Autowired
    public UsuarioBean(UsuarioRepository repository) {
        this.repository = repository;
    }

    public void setById(int id) {
        this.user = repository.findById(id).orElseThrow();
    }
}
