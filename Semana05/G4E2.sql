Create Database Hotel_FL220294;
Use Hotel_FL220294;

Create Table Hotel (
  IdHotel int auto_increment,
  Nombre varchar(100) unique,
  Direccion varchar(250),
  SitioWeb varchar(100) unique,
  constraint PK_Hotel primary key (IdHotel)
);

Create Table Huesped (
  IdHuesped int auto_increment,
  Nombre varchar(100),
  Email varchar(50) unique,
  Direccion varchar(250),
  Telefono char(8),
  constraint PK_Huesped primary key (IdHuesped)
);

Create Table Habitacion (
  IdHabitacion int auto_increment,
  IdHotel int,
  Tipo varchar(50),
  Precio decimal(10,2),
  constraint PK_Habitacion primary key (IdHabitacion),
  constraint FK_HotelHabitacion foreign key (IdHotel) references Hotel(IdHotel),
  constraint CHK_Habitacion check (Precio > 25 and (Tipo == "Doble" or Tipo == "Individual"))
);

Create Table Reservacion (
  IdReserva int auto_increment,
  IdHotel int,
  IdHuesped int,
  IdHabitacion int,
  FechaInicio date default current_date(),
  FechaFin date,
  constraint PK_Reservacion primary key (IdReserva),
  constraint FK_HotelReservacion foreign key (IdHotel) references Hotel(IdHotel),
  constraint FK_HuespedReservacion foreign key (IdHuesped) references Huesped(IdHuesped),
  constraint FK_HabitacionReservacion foreign key (IdHabitacion) references Habitacion(IdHabitacion),
  constraint CHK_Reservacion check (FechaFin > FechaInicio)
);

Select * From Reservacion;