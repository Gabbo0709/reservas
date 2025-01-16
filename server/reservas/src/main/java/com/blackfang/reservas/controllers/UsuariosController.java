package com.blackfang.reservas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class UsuariosController {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @CrossOrigin(origins = "*")
    @GetMapping("/usuarios")
    public List<Map<String, Object>> obtenerUsuarios(
            @RequestParam(value = "sede", defaultValue = "1") int sede,
            @RequestParam(value = "usuarioActual") Integer usuarioActual
            ) {
        String query = "";
        return jdbcTemplate.queryForList(query);
    }
}
