USE db_recursos;

CREATE VIEW GetHistorialEmpleado AS
	SELECT	CONCAT(e.nom_empleado, ' ', e.ap_empleado, ' ', e.am_empleado) AS nombre,
			se.id_sede,
			e.rfc,
			a.nom_area,
			s.motivo,
			s.fecha_solicitud,
			sh.f_inicio,
			sh.h_inicio,
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
		se.id_sede = a.id_sede
		