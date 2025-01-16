package com.blackfang.reservas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * This controller manages CRUD operations for resources in the system.
 * It provides endpoints to retrieve, add, modify, and logically delete resources.
 */
@RestController
public class RecursosController {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @CrossOrigin(origins = "*")
    @GetMapping("/recursos")
    public List<Map<String, Object>> obtenerRecursos(
            @RequestParam(value = "sede", defaultValue = "1") int sede,
            @RequestParam(value = "tipo") String tipo,
            @RequestParam(value = "nombre") String nombre
            ) {
        String query = "";
        return jdbcTemplate.queryForList(query);
    }

    @CrossOrigin(origins = "*")
    @PostMapping("/recursos/agregar")
    public Boolean agregarRecurso(
            @RequestBody(required = true) Map<String, Object> recurso
            ) {
        String query = "INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(query,
                recurso.get("nombre_recurso"),
                recurso.get("cantidad_disponible"),
                recurso.get("estado"),
                recurso.get("tipo"),
                recurso.get("detalles"),
                recurso.get("servicio"),
                recurso.get("id_sede")
        ) > 0;
    }

    @CrossOrigin(origins = "*")
    @PostMapping("/recursos/modificar")
    public Boolean modificarRecurso(
            @RequestBody(required = true) Map<String, Object> recurso
            ) {
        StringBuilder setClause = new StringBuilder();
        List<Object> parameters = new ArrayList<>();
        String query = "UPDATE Recurso SET ";
        int changes = 0;
        for(String fieldName : new String[] {"nombre_recurso", "cantidad_disponible", "detalles"}) {
            changes += recurso.containsKey(fieldName) ? 1 : 0;
            appendSetClause(recurso, setClause, parameters, fieldName);
        }
        setClause.deleteCharAt(setClause.length() - 2);
        query += setClause.toString() + " WHERE id_recurso = " + recurso.get("id_recurso");
        Boolean result = false;
        if (changes == 0) {
            return result;
        }
        return jdbcTemplate.update(query, parameters.toArray()) > 0;
    }

    private void appendSetClause(Map<String, Object> recurso, StringBuilder setClause, List<Object> parameters, String fieldName) {
        if (recurso.containsKey(fieldName)) {
            setClause.append(fieldName).append(" = ?, ");
            parameters.add(recurso.get(fieldName)); // Agregamos el valor a los parámetros
        }
    }


    // No elimina solo desactiva
    @CrossOrigin(origins = "*")
    @DeleteMapping("/recursos/eliminar")
    public Boolean eliminarRecurso(
            @RequestParam(value = "id") int id
            ) {
        String query = "UPDATE Recurso SET estado = 0 WHERE id_recurso =" + id;
        return jdbcTemplate.update(query) > 0;
    }

    // No elimina solo desactiva
    @CrossOrigin(origins = "*")
    @DeleteMapping("/recursos/activar")
    public Boolean activarRecurso(
            @RequestParam(value = "id") int id
    ) {
        String query = "UPDATE Recurso SET estado = 1 WHERE id_recurso =" + id;
        return jdbcTemplate.update(query) > 0;
    }
}
