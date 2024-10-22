package com.ecg.app.teste;

import com.ecg.app.bean.UsuarioBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "/")
public class TesteController {

    private final UsuarioBean bean;

    @Autowired
    public TesteController(UsuarioBean bean) {
        this.bean = bean;
    }

    @GetMapping(path = "teste")
    public ResponseEntity<Object> teste() {
        return ResponseEntity.status(HttpStatus.OK).body(bean.getUsuario());
    }

}
