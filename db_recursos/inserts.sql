USE db_recursos;

INSERT INTO Sede (calle, no_ext, no_int, colonia, delegacion, cp, nom_sede)
VALUES 
('Calle 1', '203', 8, 'Colonia chida', 'Delegacion mas chida', 05600, 'Santa Fe');

INSERT INTO Areas (ubi_area, nom_area, id_sede) VALUES
("Tercer piso", "Recursos humanos", 1),
("Primer piso", "Ventas", 1),
("Planta baja", "Sistemas", 1),
("Tercer piso", "Administracion", 1),
("Tercer piso", "Marketing", 1);

INSERT INTO Administrador (usuario, id_sede) VALUES
("Administrador_1", 1);

-- Laptop 1
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Laptop Dell XPS 15', 5, 1, 'Computo', '{"procesador": "Intel Core i7", "memoria": "16GB", "disco": "512GB SSD"}', '{"software": ["Office 365", "Antivirus"], "garantia": "1 año"}', 1);

-- Laptop 2
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Laptop MacBook Pro 14"', 3, 1, 'Computo', '{"procesador": "Apple M1 Pro", "memoria": "16GB", "disco": "1TB SSD"}', '{"software": ["macOS Monterey", "iWork"], "garantia": "1 año"}', 1);

-- Proyector
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Proyector Epson PowerLite', 2, 1, 'Computo', '{"resolucion": "1080p", "brillo": "3000 lumens", "conectividad": ["HDMI", "VGA"]}', '{"lampara": "2000 horas", "garantia": "6 meses"}', 1);

-- Sala de juntas A
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Sala de Juntas A', 1, 1, 'Espacio', '{"capacidad": "10 personas", "equipamiento": ["pantalla", "pizarra blanca", "aire acondicionado"]}', '{"wifi": true, "servicio de cafe": false}', 1);

-- Sala de juntas B
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Sala de Juntas B', 1, 1, 'Espacio', '{"capacidad": "20 personas", "equipamiento": ["proyector", "sistema de sonido", "pizarra interactiva"]}', '{"wifi": true, "servicio de catering": true}', 1);

-- Vehículo 1
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Toyota Corolla', 2, 1, 'Vehiculo', '{"modelo": "2023", "color": "Gris", "kilometraje": "10000"}', '{"seguro": "Amplio", "mantenimiento": "Incluido"}', 1);

-- Vehículo 2
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Ford Ranger', 1, 1, 'Vehiculo', '{"modelo": "2022", "color": "Blanco", "kilometraje": "25000"}', '{"seguro": "Basico", "mantenimiento": "No incluido"}', 1);

-- Impresora
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Impresora HP LaserJet', 3, 1, 'Computo', '{"tipo": "Laser", "color": true, "conectividad": ["WiFi", "Ethernet"]}', '{"cartuchos": "Incluidos", "garantia": "1 año"}', 1);

-- Monitor
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Monitor Dell 27"', 10, 1, 'Computo', '{"resolucion": "1440p", "tamanio": "27 pulgadas", "tipo": "IPS"}', '{"garantia": "2 años"}', 1);

-- Teléfono IP
INSERT INTO Recurso (nombre_recurso, cantidad_disponible, estado, tipo, detalles, servicio, id_sede) 
VALUES ('Teléfono IP Cisco', 20, 1, 'Computo', '{"modelo": "CP-7841", "funciones": ["conferencia", "buzón de voz"]}', '{"soporte": "24/7"}', 1);
INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('XXXXX010101XX', 'Juan', 'Pérez', 'Gómez', 'juan.perez@example.com', '555-123-4567', 1);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('YYYYY020202YY', 'María', 'García', 'López', 'maria.garcia@example.com', '555-987-6543', 2);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('ZZZZZ030303ZZ', 'Pedro', 'Martínez', 'Hernández', 'pedro.martinez@example.com', '555-567-8901', 3);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('AAAA040404AA', 'Ana', 'Rodríguez', 'Sánchez', 'ana.rodriguez@example.com', '555-246-8013', 1);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('BBBB050505BB', 'Luis', 'González', 'Ramírez', 'luis.gonzalez@example.com', '555-135-7924', 2);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('CCCC060606CC', 'Sofia', 'Fernández', 'Torres', 'sofia.fernandez@example.com', '555-864-2097', 3);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('DDDD070707DD', 'Miguel', 'López', 'Flores', 'miguel.lopez@example.com', '555-357-9142', 1);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('EEEE080808EE', 'Carmen', 'Hernández', 'Vázquez', 'carmen.hernandez@example.com', '555-975-3186', 2);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('FFFF090909FF', 'David', 'Sánchez', 'Jiménez', 'david.sanchez@example.com', '555-468-0253', 3);

INSERT INTO Empleado (rfc, nom_empleado, ap_empleado, am_empleado, email, tel_empleado, id_area) 
VALUES ('GGGG101010GGG', 'Laura', 'Ramírez', 'Ruiz', 'laura.ramirez@example.com', '555-789-1304', 1);

-- Solicitud 1: Juan Pérez solicita una laptop Dell XPS 15
INSERT INTO Solicitud (year_solicitud, month_solicitud, motivo, rfc) 
VALUES (YEAR(CURDATE()), MONTH(CURDATE()), 'Necesito una laptop para trabajar en un proyecto', 'XXXXX010101XX');

-- Solicitud 2: María García solicita la Sala de Juntas A
INSERT INTO Solicitud (year_solicitud, month_solicitud, motivo, rfc) 
VALUES (YEAR(CURDATE()), MONTH(CURDATE()), 'Reunión con clientes', 'YYYYY020202YY');

-- Solicitud 3: Pedro Martínez solicita un vehículo Toyota Corolla
INSERT INTO Solicitud (year_solicitud, month_solicitud, motivo, rfc) 
VALUES (YEAR(CURDATE()), MONTH(CURDATE()), 'Visita a clientes fuera de la ciudad', 'ZZZZZ030303ZZ');

-- Solicitud 4: Ana Rodríguez solicita una laptop MacBook Pro 14" y un proyector Epson PowerLite
INSERT INTO Solicitud (year_solicitud, month_solicitud, motivo, rfc) 
VALUES (YEAR(CURDATE()), MONTH(CURDATE()), 'Presentación de proyecto a la dirección', 'AAAA040404AA');

-- Solicitud 5: Luis González solicita la Sala de Juntas B
INSERT INTO Solicitud (year_solicitud, month_solicitud, motivo, rfc) 
VALUES (YEAR(CURDATE()), MONTH(CURDATE()), 'Capacitación al equipo de ventas', 'BBBB050505BB');

-- Solicitud 1: Juan Pérez solicita la laptop por 3 días
INSERT INTO Solicitud_Horario (f_inicio, f_fin, id_solicitud, year_solicitud, month_solicitud) VALUES 
('2025-01-18 09:00:00', '2025-01-21 18:00:00', 1, YEAR(CURDATE()), MONTH(CURDATE())),
('2025-01-18 10:00:00', '2025-01-18 12:00:00', 2, YEAR(CURDATE()), MONTH(CURDATE())),
('2025-01-18 08:00:00', '2025-01-19 17:00:00', 3, YEAR(CURDATE()), MONTH(CURDATE())),
('2025-01-19 14:00:00', '2025-01-20 18:00:00', 4, YEAR(CURDATE()), MONTH(CURDATE())),
('2025-01-22 09:00:00', '2025-01-22 13:00:00', 5, YEAR(CURDATE()), MONTH(CURDATE())),
('2025-01-23 09:00:00', '2025-01-23 13:00:00', 5, YEAR(CURDATE()), MONTH(CURDATE()));

-- Solicitud 1: Laptop Dell XPS 15
INSERT INTO Solicitud_Recurso (id_solicitud, id_recurso, year_solicitud, month_solicitud) 
VALUES (1, 1, YEAR(CURDATE()), MONTH(CURDATE()));

-- Solicitud 2: Sala de Juntas A
INSERT INTO Solicitud_Recurso (id_solicitud, id_recurso, year_solicitud, month_solicitud) 
VALUES (2, 4, YEAR(CURDATE()), MONTH(CURDATE()));

-- Solicitud 3: Toyota Corolla
INSERT INTO Solicitud_Recurso (id_solicitud, id_recurso, year_solicitud, month_solicitud) 
VALUES (3, 6, YEAR(CURDATE()), MONTH(CURDATE()));

-- Solicitud 4: Laptop MacBook Pro 14"
INSERT INTO Solicitud_Recurso (id_solicitud, id_recurso, year_solicitud, month_solicitud) 
VALUES (4, 2, YEAR(CURDATE()), MONTH(CURDATE()));

-- Solicitud 4: Proyector Epson PowerLite
INSERT INTO Solicitud_Recurso (id_solicitud, id_recurso, year_solicitud, month_solicitud) 
VALUES (4, 3, YEAR(CURDATE()), MONTH(CURDATE()));

-- Solicitud 5: Sala de Juntas B
INSERT INTO Solicitud_Recurso (id_solicitud, id_recurso, year_solicitud, month_solicitud) 
VALUES (5, 5, YEAR(CURDATE()), MONTH(CURDATE()));