USE db_recursos;

SELECT * FROM Recurso;
SELECT * FROM GetHistorialEmpleado WHERE rfc = 'XXXXX010101XX';

SELECT r.id_recurso, r.nombre_recurso
FROM	Recurso r
WHERE r.estado = 1
AND NOT EXISTS (
	SELECT 1
	FROM Solicitud_Recurso sr
    JOIN
		Solicitud s
	ON
		(sr.year_solicitud, sr.month_solicitud, sr.id_solicitud) = (s.year_solicitud, s.month_solicitud, s.id_solicitud)
	JOIN
		Solicitud_Horario sh
	ON
		(sr.year_solicitud, sr.month_solicitud, sr.id_solicitud) = (sh.year_solicitud, sh.month_solicitud, sh.id_solicitud)
	WHERE
		sr.id_recurso = r.id_recurso
	AND 
		s.estado IN ('PENDIENTE')
	AND 
    (
		(
			('2025-01-18 10:00:00' BETWEEN sh.f_inicio AND sh.f_fin)
			OR ('2025-01-18 12:00:00' BETWEEN sh.f_inicio AND sh.f_fin)
		)
		OR
		(
			('2025-01-22 15:00:00' BETWEEN sh.f_inicio AND sh.f_fin)
			OR ('2025-01-22 17:00:00' BETWEEN sh.f_inicio AND sh.f_fin)
		)
	)
);

SELECT * FROM Recurso;
SELECT * FROM GetSolicitudesDetalle;