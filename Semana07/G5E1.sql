CREATE DATABASE Gestion_Peliculas_FL220294;
USE Gestion_Peliculas_FL220294;

CREATE TABLE Estudio (
	IdEstudio char(2) PRIMARY KEY,
    NombreEstudio varchar(50),
    Pais varchar(50),
    Ciudad varchar(50),
    DireccionEstudio varchar(100)
);

CREATE TABLE Pelicula (
	IdPelicula char(3) PRIMARY KEY,
    TituloPeli varchar(50),
    DireccionPeli varchar(50),
	
	IdEstudio char(3),
	FOREIGN KEY (IdEstudio) REFERENCES Estudio (IdEstudio)
);

CREATE TABLE Actor (
	IdActor char(4) PRIMARY KEY,
    PrimerNombre varchar(50),
    PrimerApellido varchar(50),
    FechaNacimiento date,
    Telefono char(9),
    Email varchar(50)
);

CREATE TABLE PelisActores (
	IdPelicula char(3),
	IdActor char(4),
	PRIMARY KEY (IdPelicula, IdActor),
	FOREIGN KEY (IdPelicula) REFERENCES Pelicula (IdPelicula),
	FOREIGN KEY (IdActor) REFERENCES Actor (IdActor)
);

INSERT INTO Estudio
VALUES ('01', 'Estudio ABC', 'España', 'Madrid', 'Calle ABC'),
('02', 'XYZ Studios', 'Canadá', 'Quebec', '10 Street'),
('03', 'Elipsis', 'Pais', 'Ciudad', 'Ubicación');

INSERT INTO Pelicula
VALUES ('001', 'Peli ABC', 'Juan P', '01'),
('002', 'ZZZ Movie', 'John Movie', '02'),
('003', 'Silencio', 'Yo', '03');

INSERT INTO Actor
VALUES ('DEFL', 'Daniel', 'Flores', '2004-06-16', '7777-7777','abc@ejemplo.com'),
('ABCD', 'AAA', 'CCC', '1999-09-09', '9999-9999', '999@gmail.com'),
('WXYZ', 'Walter', 'Zepeda', '1985-12-12', '1212-1212', 'zzzzzzzzz@yahoo.com');

INSERT INTO PelisActores
VALUES ('001', 'DEFL'),
('002', 'ABCD'),
('003', 'WXYZ');