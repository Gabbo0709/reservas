DROP DATABASE IF EXISTS db_recursos;
CREATE DATABASE db_recursos;
USE db_recursos;

CREATE TABLE Sede (
	id_sede					INT PRIMARY KEY AUTO_INCREMENT,
	calle					VARCHAR(64),
	no_ext					VARCHAR(16),
	no_int					INT,
	colonia					VARCHAR(64),
	delegacion			   	VARCHAR(64),
	cp						NUMERIC(5),
	nom_sede				VARCHAR(64)
);

CREATE TABLE Areas (
	id_area					INT PRIMARY KEY AUTO_INCREMENT,
	ubi_area				VARCHAR(32),
	nom_area				VARCHAR(32),
	id_sede					INT, 
	FOREIGN KEY (id_sede) REFERENCES Sede (id_sede)
);

CREATE TABLE Administrador (
	usuario					VARCHAR(32),
    id_sede					INT,
    FOREIGN KEY (id_sede) REFERENCES Sede (id_sede)
);

-- Tipo: SALA, COMPUTO, VEHICULO
-- Cada recurso tiene sus detalles dependiendo el tipo
-- Ej: sala tiene dimensiones y aforo, computo tiene marca y caracteristicas, vehiculo tiene capacidad, modelo, etc
-- Los servicios dependen del recurso, ej: sala tiene limpieza, caterin, computo tiene software especifico o liciencia y vehiculo servicio de chofer o de alimento
CREATE TABLE Recurso (
	id_recurso				INT PRIMARY KEY AUTO_INCREMENT,
    nombre_recurso			VARCHAR(128),
	cantidad_disponible		INT,
	estado					TINYINT(1),
	tipo					VARCHAR(10),
    detalles				JSON,
    servicio				JSON,
	id_sede					INT, 
	FOREIGN KEY (id_sede) REFERENCES Sede (id_sede) 
);

CREATE TABLE Empleado (
	rfc						VARCHAR (13) PRIMARY KEY,
	nom_empleado			VARCHAR (32),
	ap_empleado				VARCHAR (32),
	am_empleado				VARCHAR (32),
    email					VARCHAR (128),
	tel_empleado			VARCHAR(128),
	id_area				  	INT, 
	FOREIGN KEY (id_area) REFERENCES Areas (id_area)
);

-- La solicitud esta asociada a un empleado que la realizo, y la fecha en la que lo hizo
CREATE TABLE Solicitud (
	id_solicitud			INT,
    year_solicitud			INT NOT NULL,
    month_solicitud			INT NOT NULL,
	estado					VARCHAR (10) DEFAULT 'PENDIENTE',
	fecha_solicitud	 		DATE DEFAULT CURRENT_TIMESTAMP(),
    motivo					VARCHAR (128),
	rfc						VARCHAR (13),
    PRIMARY KEY (year_solicitud, month_solicitud, id_solicitud),
    CHECK (estado IN ('PENDIENTE', 'ACEPTADA', 'RECHAZADA', 'SIN RESPUESTA')),
	FOREIGN KEY (rfc) REFERENCES Empleado (rfc)
);

-- Los diferentes horarios que se pueden seleccionar en la solicitud, ya sea diferentes horas un mismo dia o diferentes dias
CREATE TABLE Solicitud_Horario (
	f_inicio				DATE,
	h_inicio				TIME,
	f_fin					DATE,
	h_fin					TIME,
    id_solicitud			INT,
    year_solicitud			INT NOT NULL,
    month_solicitud			INT NOT NULL,
	FOREIGN KEY (year_solicitud, month_solicitud, id_solicitud) 
		REFERENCES Solicitud (year_solicitud, month_solicitud, id_solicitud)
);

-- Se relacionan los recursos con la solicitud
CREATE TABLE Solicitud_Recurso (
	id_solicitud		INT,
    id_recurso			INT,
    year_solicitud			INT NOT NULL,
    month_solicitud			INT NOT NULL,
    FOREIGN KEY (year_solicitud, month_solicitud, id_solicitud) 
		REFERENCES Solicitud (year_solicitud, month_solicitud, id_solicitud),
    FOREIGN KEY (id_recurso) REFERENCES Recurso (id_recurso)
);

-- CREATE TABLE Plantilla_General (
-- 	id_plantilla		INT PRIMARY KEY,
-- 	id_sede				INT,
--     motivo				VARCHAR (64),
--     FOREIGN KEY	(id_sede) REFERENCES Sede (id_sede)
-- );

-- CREATE TABLE Plantilla_Recurso (
-- 	id_plantilla		INT,
--     id_recurso			INT,
--     FOREIGN KEY (id_plantilla) REFERENCES Plantilla_General (id_plantilla),
--     FOREIGN KEY (id_recurso) REFERENCES Recurso (id_recurso)
-- );

-- CREATE TABLE Plantilla_Empleado (
-- 	id_plantilla_emp	INT PRIMARY KEY,
--     rfc					VARCHAR(13),
--     motivo				VARCHAR(32),
--     FOREIGN KEY (rfc) REFERENCES Empleado (rfc)
-- );

-- CREATE TABLE Plantilla_Empleado_Recurso (
-- 	id_plantilla_emp	INT,
--     id_recurso			INT,
--     FOREIGN KEY (id_plantilla_emp) REFERENCES Plantilla_Empleado (id_plantilla_emp),
-- 	FOREIGN KEY (id_recurso) REFERENCES Recurso (id_recurso)
-- );
