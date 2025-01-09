package com.ecg.app.services;

import com.ecg.app.beans.UsuarioBean;
import com.ecg.app.dto.AulaDTO;
import com.ecg.app.dto.ModuloDTO;
import com.ecg.app.models.Aula;
import com.ecg.app.repositories.AulaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AulaService {
    private final AulaRepository repository;
    private final UsuarioBean bean;
    @Autowired
    public AulaService(AulaRepository repository, UsuarioBean bean) {
        this.repository = repository;
        this.bean = bean;
    }

    public List<AulaDTO> findAll(){
        List<AulaDTO> dtos = repository.pesquisar(bean.getUser());
        return dtos;
    }

    public List<ModuloDTO> getAllModulosByAula(Integer aulaId) throws Exception {
        Aula aula = repository.findById(aulaId).orElseThrow(Exception::new);
        return repository.getAllModulosByAula(aula, bean.getUser());
    }

    public AulaDTO carregar(Integer id) throws Exception {
        Aula aula = repository.findById(id).orElseThrow(Exception::new);
        return new AulaDTO(aula.getDescricao(), aula.getId(), null, null);
    }
}
