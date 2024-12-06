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

CREATE TABLE Area (
	id_area					INT PRIMARY KEY AUTO_INCREMENT,
	ubi_area				VARCHAR(32),
	nom_area				VARCHAR(32),
	id_sede					INT, 
	FOREIGN KEY (id_sede) REFERENCES Sede (id_sede)
);

CREATE TABLE Recurso (
	id_rec					INT PRIMARY KEY AUTO_INCREMENT,
	desc_rec				VARCHAR(8),
	disponile				INT,
	estado					TINYINT(1),
	tipo					VARCHAR(10),
	id_sede					INT, 
	FOREIGN KEY (id_sede) REFERENCES Sede (id_sede) 
);

CREATE TABLE Sala (
	id_sala					INT PRIMARY KEY AUTO_INCREMENT,
	dimensiones		  		VARCHAR (20), -- ?
	aforo					INT,
	id_rec					INT,
	FOREIGN KEY (id_rec) REFERENCES Recurso (id_rec)
);

CREATE TABLE Computo (
	id_computo				INT PRIMARY KEY AUTO_INCREMENT,
	carac_computo	 		VARCHAR (20), -- ?
	marca					VARCHAR(32),
	id_rec					INT,
	FOREIGN KEY (id_rec) REFERENCES Recurso (id_rec)
);

CREATE TABLE Vehiculo (
	id_vehiculo				INT PRIMARY KEY AUTO_INCREMENT,
	capacidad			 	VARCHAR (20), -- ?
	modelo				  	VARCHAR(32),
	id_rec					INT, 
	FOREIGN KEY (id_rec) REFERENCES Recurso (id_rec)
);

CREATE TABLE Empleado (
	rfc						VARCHAR (13) PRIMARY KEY,
	nom_emp			 		VARCHAR (32),
	ap_emp				 	VARCHAR (32),
	am_emp					VARCHAR (32),
	tel_emp				 	VARCHAR(128),
	id_area				  	INT, 
	FOREIGN KEY (id_area) REFERENCES Area (id_area)
);

CREATE TABLE Solicitud (
	id_solicitud			INT PRIMARY KEY AUTO_INCREMENT,
	estado					VARCHAR(10) CHECK (estado IN ('PENDIENTE' OR 'ACEPTADA' OR 'RECHAZADA' OR 'CADUCADA')),
	fecha_solicitud	 		DATETIME DEFAULT CURRENT_TIMESTAMP(),
	rfc						VARCHAR (13), 
	FOREIGN KEY (rfc) REFERENCES Empleado (rfc)
);

CREATE TABLE Solicitud_Horario (
	f_inicio				DATE,
	h_inicio				TIME,
	f_fin					DATE,
	h_fin					TIME,
	id_solicitud			INT, 
	FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud)
);

CREATE TABLE Solicitud_Sala (
	aforo_solicitado		INT,
	proyector				TINYINT (1),
	limpieza				TINYINT (1),
	caterin					TINYINT (1),
	id_solicitud			INT, 
	id_sala					INT, 
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
	FOREIGN KEY (id_sala) REFERENCES Sala (id_sala)
);

CREATE TABLE Solicitud_Computo (
	software				VARCHAR (32),
	licencia	  			VARCHAR (32),
	id_solicitud			INT, 
	id_computo				INT,
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
	FOREIGN KEY (id_computo) REFERENCES Computo (id_computo)
);

CREATE TABLE Solicitud_Vehiculo (
	chofer	 				TINYINT (1),
	comida				   	TINYINT (1),
	id_solicitud			INT, 
	id_vehiculo				INT,
	FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud), 
	FOREIGN KEY (id_vehiculo) REFERENCES Vehiulo (id_vehiculo)
);