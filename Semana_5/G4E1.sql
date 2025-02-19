Create Database Control_Inscripciones;
Use Control_Inscripciones;

Create Table Alumnos (
  Carnet int auto_increment,
  Nombres varchar(100),
  Apellidos varchar(100),
  Direccion varchar(250),
  Correo varchar(50),
  Telefono char(8),
  FechaNac date,
  constraint PK_Alumnos primary key (Carnet)
);

Create Table Materia (
  Codigo int auto_increment,
  Nombre varchar(25),
  UV int,
  PreReq varchar(25),
  Ciclo int,
  constraint PK_Materia primary key (Codigo)
);

Create Table Inscripcion (
  Carnet int not null,
  CodigoMat int auto_increment,
  Matricula decimal(6,2),
  constraint FK_AlumnosInscripcion foreign key (Carnet) references Alumnos(Carnet),
  constraint FK_MateriaInscripcion foreign key (CodigoMat) references Materia(Codigo)
);

Select * From Alumnos;