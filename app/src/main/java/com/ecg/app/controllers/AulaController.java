package com.ecg.app.controllers;

import com.ecg.app.services.AulaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/aula")
public class AulaController {
    private final AulaService service;
    @Autowired
    public AulaController(AulaService service) {
        this.service = service;
    }

    @GetMapping("/")
    public ResponseEntity<Object> findAll(){
        try{
            return ResponseEntity.ok(service.findAll());
        }catch (Exception e){
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getAllModulosByAula(@PathVariable Integer id){
        try{
            return ResponseEntity.ok(service.getAllModulosByAula(id));
        }catch (Exception e){
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}/info")
    public ResponseEntity<Object> carregar(@PathVariable Integer id){
        try{
            return ResponseEntity.ok(service.carregar(id));
        }catch (Exception e){
            return ResponseEntity.badRequest().build();
        }
    }
}
