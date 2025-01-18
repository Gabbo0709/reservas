package com.blackfang.reservas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@CrossOrigin(origins = "*")
public class EmpleadosController {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/empleado/obtenerAreas")
    public List<Map<String, Object>> areaSede(
            @RequestParam(value = "sede", defaultValue = "1") Integer sede
    ) {
        String query = "SELECT * FROM GetSelectArea WHERE id_sede = " + sede;
        return jdbcTemplate.queryForList(query);
    }

    @GetMapping("/empleado/obtenerEmpleados")
    public List<Map<String, Object>> empleadosSede(
            @RequestParam(value = "sede", defaultValue = "1") Integer sede,
            @RequestParam(value = "area") Integer area
    ) {
        String query = "SELECT * FROM GetEmpleados WHERE id_sede = " + sede;
        if(area != 0) {
            query += " AND id_area = " + area;
        }
        return jdbcTemplate.queryForList(query);
    }

    @PostMapping("/empleado/agregarEmpleado")
    public Boolean agregarEmpleado(@RequestParam("txt-rfc-emp") String rfc,
                                   @RequestParam("txt-nombre-emp") String nombre,
                                   @RequestParam("txt-ap-emp") String ap,
                                   @RequestParam("txt-am-emp") String am,
                                   @RequestParam("txt-email-emp") String mail,
                                   @RequestParam("txt-tel-emp") String tel,
                                   @RequestParam("select-area-emp") Integer id_area) {
        String query = "INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) "+
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(query,
                rfc,
                nombre,
                ap,
                am,
                mail,
                tel,
                id_area
        ) > 0;
    }
}
