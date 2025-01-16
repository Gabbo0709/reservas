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
@CrossOrigin(origins = "*")
public class HistorialController {
    @Autowired
    private JdbcTemplate jdbcTemplate;


    @GetMapping("/historial")
    public List<Map<String, Object>> historial(
            @RequestParam(value="tipo", defaultValue = "1") int tipo,
            @RequestParam(value="rfc") String rfc,
            @RequestParam(value="sede") Integer sede
    )
    {
        if (tipo == 2 && rfc != null) {
            return historialEmpleado(rfc);
        }
        String query = "SELECT * FROM GetHistorialEmpleado WHERE id=" + sede;
        return jdbcTemplate.queryForList(query);
    }

    public List<Map<String, Object>> historialEmpleado(String rfc) {
        String query = "SELECT * FROM GetHistorialEmpleado WHERE rfc=" + rfc;
        return jdbcTemplate.queryForList(query);
    }

    @GetMapping("/historial/estado")
    public List<Map<String, Object>> historialEstado(
            @RequestParam(value="estado") String estado,
            @RequestParam(value="tipo", defaultValue = "1") int tipo,
            @RequestParam(value="rfc") String rfc,
            @RequestParam(value="sede") Integer sede
    )
    {
        if (tipo == 2 && rfc != null) {
            return historialEmpleado(rfc, estado);
        }
        String query = "SELECT * FROM GetHistorialEmpleado WHERE id_sede=" + sede + " AND estado = " + estado;
        return jdbcTemplate.queryForList(query);
    }

    public List<Map<String, Object>> historialEmpleado(String rfc, String estado) {
        String query = "SELECT * FROM GetHistorialEmpleado WHERE rfc=" + rfc + " AND estado=" + estado;
        return jdbcTemplate.queryForList(query);
    }

    @GetMapping("/historial/fecha")
    public List<Map<String, Object>> historialFecha(
            @RequestParam(value="fecha") String fecha,
            @RequestParam(value="tipo", defaultValue = "1") int tipo,
            @RequestParam(value="rfc") String rfc,
            @RequestParam(value="sede") Integer sede
    )
    {
        if (tipo == 2 && rfc != null) {
            return historialEmpleadoFecha(rfc, fecha);
        }
        String query = "SELECT * FROM GetHistorialEmpleado WHERE id_sede=" + sede + " AND fecha_solicitud = " + fecha;;
        return jdbcTemplate.queryForList(query);
    }
    public List<Map<String, Object>> historialEmpleadoFecha(String rfc, String fecha) {
        String query = "SELECT * FROM GetHistorialEmpleado WHERE rfc=" + rfc + " AND fecha_solicitud=" + fecha;
        return jdbcTemplate.queryForList(query);
    }
}
