package com.ecg.app.filter;

import com.ecg.app.beans.UsuarioBean;
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
    @Autowired
    public AuthenticationFilter(UsuarioBean bean) {
        this.bean = bean;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        String usrId = request.getHeader("userId");
        bean.setById(Integer.parseInt(usrId));
        filterChain.doFilter(request, response);
    }
}