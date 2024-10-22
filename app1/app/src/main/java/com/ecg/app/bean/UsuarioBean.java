package com.ecg.app.bean;

import com.ecg.app.usuario.Usuario;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class UsuarioBean {
    Usuario usuario;
}
