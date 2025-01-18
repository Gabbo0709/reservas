package com.blackfang.reservas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * This controller manages CRUD operations for resources in the system.
 * It provides endpoints to retrieve, add, modify, and logically delete resources.
 */
@RestController
@CrossOrigin(origins = "*")
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
            @RequestBody Map<String, Object> recurso
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
            @RequestBody Map<String, Object> recurso
            ) {
        String query = "UPDATE Recurso SET cantidad_disponible = ?, tipo = ?, detalles = ?, servicio = ? WHERE id_recurso = ?";
        List<Object> parameters = new LinkedList<>();
        for (String fieldName : new String[]{"cantidad_disponible", "tipo", "detalles", "servicio"}) {
            parameters.add(recurso.get(fieldName));
        }
        return jdbcTemplate.update(query, parameters.toArray()) > 0;
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

    // Busqueda de recursos
    @GetMapping("/recursos/buscarFechas")
    public List<Map<String, Object>> buscarFechas(@RequestParam(value = "fecha_inicio") Date fecha_inicio,
                                                  @RequestParam(value = "fecha_fin") Date fecha_fin,
                                                  @RequestParam(value = "sede", defaultValue = "1") Integer sede) {
        String query = formatoQuery(fecha_inicio.toString(), fecha_fin.toString(), sede.toString());
        return jdbcTemplate.queryForList(query);
    }
    @GetMapping("/recursos/buscarNombre")
    public List<Map<String, Object>> buscarNombre(@RequestParam(value = "fecha_inicio") Date fecha_inicio,
                                                  @RequestParam(value = "fecha_fin") Date fecha_fin,
                                                  @RequestParam(value = "sede", defaultValue = "1") Integer sede,
                                                  @RequestParam(value = "nombre") String nombre) {
        String query = formatoQuery(fecha_inicio.toString(), fecha_fin.toString(), sede.toString());
        query += " AND r.nombre_recurso LIKE '%" + nombre + "%'";
        return jdbcTemplate.queryForList(query);
    }

    @GetMapping("/recursos/buscarTipo")
    public List<Map<String, Object>> buscarTipo(@RequestParam(value = "fecha-inicio") Date fecha_inicio,
                                                @RequestParam(value = "fecha_fin") Date fecha_fin,
                                                @RequestParam(value = "sede", defaultValue = "1") Integer sede,
                                                @RequestParam(value = "tipo") Integer tipo) {
        String query = formatoQuery(fecha_inicio.toString(), fecha_fin.toString(), sede.toString());
        query += " AND r.tipo = '" + tipo + "'";
        return jdbcTemplate.queryForList(query);
    }
    public String formatoQuery(String fecha_inicio, String fecha_fin, String sede) {
        return "SELECT * FROM GetRecursosDisponibles r " +
                "WHERE NOT EXISTS (" +
                    "SELECT 1 FROM Solicitud_Recurso sr " +
                    "JOIN Solicitud s " +
                    "ON (sr.year_solicitud, sr.month_solicitud, sr.id_solicitud) = (s.year_solicitud, s.month_solicitud, s.id_solicitud) " +
                    "JOIN Solicitud_Horario sh " +
                    "ON (sr.year_solicitud, sr.month_solicitud, sr.id_solicitud) = (sh.year_solicitud, sh.month_solicitud, sh.id_solicitud) " +
                    "WHERE sr.id_recurso = r.id_recurso AND s.estado = 'ACEPTADA' AND ('" +
                    fecha_inicio + "' BETWEEN sh.f_inicio AND sh.f_fin ) OR ('" +
                    fecha_fin + "' BETWEEN sh.f_inicio AND sh.f_fin)) HAVING id_sede = " + sede;

    }
}
