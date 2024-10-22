package com.ecg.app.filter;

import com.ecg.app.bean.UsuarioBean;
import com.ecg.app.usuario.Usuario;
import com.ecg.app.usuario.UsuarioRepository;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class AuthenticationFilter extends OncePerRequestFilter {

    private final UsuarioBean bean;
    private final UsuarioRepository repository;

    @Autowired
    public AuthenticationFilter(UsuarioBean bean, UsuarioRepository repository){
        this.bean = bean;
        this.repository = repository;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        String userId = request.getHeader("userId");
        Integer id = Integer.parseInt(userId);
        Usuario usuario = repository.findById(id).orElseThrow(() -> new IOException("Bad Request"));
        bean.setUsuario(usuario);
        filterChain.doFilter(request, response);
    }
}