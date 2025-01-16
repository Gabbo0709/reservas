USE db_recursos;

DELIMITER //

CREATE TRIGGER add_id_solicitud
BEFORE INSERT ON Solicitud
FOR EACH ROW
BEGIN
	SET NEW.id_solicitud = (
		SELECT COALESCE(MAX(id_solicitud) + 1, 1)
        FROM Solicitud
		WHERE 	(year_solicitud, month_solicitud) =
				(NEW.year_solicitud, NEW.month_solicitud)
	);
 END //   

DELIMITER ;