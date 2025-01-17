USE db_recursos;

CREATE VIEW GetHistorialEmpleado AS
	SELECT	CONCAT(e.nom_empleado, ' ', e.ap_empleado, ' ', e.am_empleado) AS nombre,
			se.id_sede,
			e.rfc,
			a.nom_area,
			s.motivo,
			s.fecha_solicitud,
			sh.f_inicio,
			sh.f_fin,
			s.estado,
			s.year_solicitud,
			s.month_solicitud
	FROM
		Solicitud s
	JOIN
		Solicitud_Horario sh
	ON
		(s.year_solicitud, s.month_solicitud, s.id_solicitud) =
		(sh.year_solicitud, sh.month_solicitud, sh.id_solicitud)
	JOIN
		Empleado e
	ON
		e.rfc = s.rfc
	JOIN
		Areas a
	ON
		a.id_area = e.id_area
	JOIN
		Sede se
	ON
		se.id_sede = a.id_sede;

CREATE VIEW GetRecursoSede AS
	SELECT  s.id_sede,
			r.nombre_recurso,
			r.id_recurso,
			r.cantidad_disponible,
			r.tipo,
			r.detalles,
			r.servicio
	FROM
		Sede s
	JOIN
		Recurso r
	ON
		r.id_sede = s.id_sede;

CREATE VIEW GetEmpleados AS
	SELECT	e.rfc,
			CONCAT(e.nom_empleado, ' ', e.ap_empleado, ' ', e.am_empleado) AS nombre,
			e.email,
			e.tel_empleado,
			a.nom_area,
			s.id_sede,
			a.id_area
	FROM
		Empleado e
	JOIN
		Areas a
	ON
		e.id_area = a.id_area
	JOIN
		Sede s
	ON	
		s.id_sede = a.id_sede;
        
CREATE VIEW GetSolicitudesDetalle AS
	SELECT	s.year_solicitud,
			s.month_solicitud,
            s.id_solicitud,
            s.estado,
            s.fecha_solicitud,
            s.motivo,
            sh.f_inicio,
            sh.f_fin,
            sr.id_recurso,
            r.nombre_recurso,
            se.id_sede
	FROM
		Solicitud s
	JOIN
		Solicitud_Horario sh
	ON
		(s.year_solicitud, s.month_solicitud, s.id_solicitud) =
        (sh.year_solicitud, sh.month_solicitud, sh.id_solicitud)
	JOIN
		Solicitud_Recurso sr
	ON
		(s.year_solicitud, s.month_solicitud, s.id_solicitud) =
        (sr.year_solicitud, sr.month_solicitud, sr.id_solicitud)
	JOIN
		Recurso r
	ON
		r.id_recurso = sr.id_recurso
	JOIN
		Sede se
	ON
		se.id_sede = r.id_sede;
		