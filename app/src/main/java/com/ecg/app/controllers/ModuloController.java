package com.ecg.app.controllers;

import com.ecg.app.forms.TesteForm;
import com.ecg.app.services.ModuloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpResponse;

@RestController
public class ModuloController {
    private final ModuloService service;

    @Autowired
    public ModuloController(ModuloService service) {
        this.service = service;
    }

    @GetMapping(path = "/modulo/{id}")
    public ResponseEntity<Object> carregar(@PathVariable(name = "id") Integer id){
        try{
            return ResponseEntity.ok(service.carregar(id));
        }catch (Exception e){
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping(path = "/modulo/{id}/iniciar-teste")
    public ResponseEntity<Object> iniciarTeste(@PathVariable(name = "id") Integer id){
        return ResponseEntity.ok(service.iniciarTeste(id));
    }

    @PostMapping(path = "/modulo/{id}/encerrar-teste")
    public ResponseEntity<Object> encerrarTeste(@PathVariable(name = "id") Integer id){

        return ResponseEntity.ok(service.encerrarTeste(id));
    }

    @PostMapping(path = "/modulo/{id}/teste/{questao}/{resposta}")
    public ResponseEntity<Object> responder(
            @PathVariable(name = "id") Integer id,
            @PathVariable(name = "questao") Integer questao,
            @PathVariable(name= "resposta") String resposta
    ){
        service.responder(id, questao, resposta);
        return ResponseEntity.ok().build();
    }

    @GetMapping(path = "/modulo/{id}/resultado")
    public ResponseEntity<Object> resultado(@PathVariable(name = "id") Integer id,
                                            @RequestBody(required = false) Pageable pageable){
        return ResponseEntity.ok(service.getUltimoResultado(id, pageable));
    }

    @GetMapping(path = "/modulo/{id}/resultado/{teste}")
    public ResponseEntity<Object> resultado(@PathVariable(name="teste") Integer teste){
        try{
            return ResponseEntity.ok(service.carregarTeste(teste));
        }catch (Exception e){
            return ResponseEntity.badRequest().build();
        }
    }
}
