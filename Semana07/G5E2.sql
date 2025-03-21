CREATE DATABASE Tienda_FL220294;
USE Tienda_FL220294;

CREATE TABLE Clientes (
	DUICliente char(4) PRIMARY KEY,
	NombreCliente varchar(50),
	Direccion varchar(100)
);

CREATE TABLE Productos (
	IdProducto char(3) PRIMARY KEY,
	NombreProducto varchar(25),
	Descripcion varchar(100),
	Precio decimal(8, 2)
);

CREATE TABLE Ventas (
	DUICliente char(4),
	IdProducto char(3),
	Valor decimal(8, 2),
	Fecha date,
	
	PRIMARY KEY (DUICliente, IdProducto),
	CONSTRAINT FKClienteVenta FOREIGN KEY (DUICliente) REFERENCES Clientes (DUICliente),
	CONSTRAINT FKProductoVenta FOREIGN KEY (IdProducto) REFERENCES Productos (IdProducto)
);

INSERT INTO Clientes
VALUES ('1234', 'Pedro', 'Dirección'),
('5678', 'Mariana', 'Casa');

INSERT INTO Productos
VALUES ('555', 'Salsa', 'De tomate', 5.99),
('035', 'Soda', 'Sabor uva', 0.85);

INSERT INTO Ventas
VALUES ('1234', '555', 5.99, '2025-02-04'),
('5678', '035', 0.85, '2025-03-11');