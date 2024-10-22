package com.ecg.app.services;

import com.ecg.app.beans.UsuarioBean;
import com.ecg.app.dto.TesteDTO;
import com.ecg.app.forms.TesteForm;
import com.ecg.app.models.Modulo;
import com.ecg.app.models.Teste;
import com.ecg.app.models.TesteQuestao;
import com.ecg.app.repositories.ModuloRepository;
import com.ecg.app.repositories.TesteQuestaoRepository;
import com.ecg.app.repositories.TesteRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class ModuloService {
    private final UsuarioBean bean;
    private final ModuloRepository repository;
    private final TesteRepository testeRepository;
    private final TesteQuestaoRepository testeQuestaoRepository;

    @Autowired
    public ModuloService(UsuarioBean bean, ModuloRepository repository, TesteRepository testeRepository, TesteQuestaoRepository testeQuestaoRepository) {
        this.bean = bean;
        this.repository = repository;
        this.testeRepository = testeRepository;
        this.testeQuestaoRepository = testeQuestaoRepository;
    }

    @Transactional
    public TesteDTO iniciarTeste(Integer id) {
        Modulo modulo = repository.findById(id).orElseThrow();
        Teste teste = testeRepository.findByUsuarioAndModuloAndEmAndamento(bean.getUser(), modulo, true).orElse(new Teste());
        if (teste.getId() == null){
            teste.setModulo(modulo);
            teste.setUsuario(bean.getUser());
            teste.setDataHora(LocalDateTime.now());
            teste.setEmAndamento(true);
            testeRepository.save(teste);
            teste.setExercicios(new HashSet<>(testeQuestaoRepository.saveAll(testeRepository.getNewExercicios(teste))));
            return new TesteDTO(teste);
        }
        teste.setExercicios(testeRepository.findExercicios(teste));
        return new TesteDTO(teste);
    }

    public TesteDTO encerrarTeste(Integer id) {
        Modulo modulo = repository.findById(id).orElseThrow();
        Teste teste = testeRepository.findByUsuarioAndModuloAndEmAndamento(bean.getUser(), modulo, true).orElse(new Teste());
        teste.init();
        teste.setEmAndamento(false);
        teste.setExercicios(testeRepository.findExercicios(teste));
        testeRepository.save(teste);
        testeQuestaoRepository.saveAll(teste.getExercicios());
        teste.getExercicios().forEach(item -> {
            if(item.getRespostaCerta().equals(item.getResposta())){
                teste.setAcertadas(teste.getAcertadas() + 1);
            }
        });
        return new TesteDTO(teste);
    }

    public void responder(Integer id, Integer questaoId, String resposta) {
        Modulo modulo = repository.findById(id).orElseThrow();
        Teste teste = testeRepository.findByUsuarioAndModuloAndEmAndamento(bean.getUser(), modulo, true)
                .orElseThrow();
        TesteQuestao questao = testeQuestaoRepository.findByTesteIdAndNumero(teste.getId(), questaoId)
                .orElseThrow();
        questao.setResposta(resposta);
        testeQuestaoRepository.save(questao);
    }
}
