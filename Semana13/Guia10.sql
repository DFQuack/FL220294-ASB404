-- Procedimiento
-- Ejercicio 1
CREATE TABLE film_update_log (
	log_id INT AUTO_INCREMENT PRIMARY KEY,
	film_id INT,
	update_date DATETIME
);

DELIMITER $$

CREATE TRIGGER after_film_update
AFTER UPDATE ON film
FOR EACH ROW
BEGIN
	INSERT INTO film_update_log(film_id,update_date) VALUES (OLD.film_id, NOW());
END$$

-- Ejercicio 2

CREATE TRIGGER before_film_insert
BEFORE INSERT ON film
FOR EACH ROW
BEGIN
	IF NEW.rental_rate <= 0 THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rental rate must be greater than 0';
    END IF;
END$$

--Ejercicio 3

CREATE TRIGGER after_customer_update
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
	UPDATE customer c
    SET c.last_update = NOW()
    WHERE c.customer_id = NEW.customer_id;
END$$

-- Complementario

CREATE TABLE payment_audit (
	audit_id INT AUTO_INCREMENT PRIMARY KEY,
	payment_id INT,
	customer_id INT,
	amount DECIMAL(5,2),
	audit_date DATETIME
);

DELIMITER $$

CREATE TRIGGER after_payment_insert
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
	INSERT INTO payment_audit(payment_id,customer_id,amount,audit_date)
	VALUES (NEW.payment_id,NEW.customer_id,NEW.amount,NOW());
END$$

-- Análisis

CREATE DATABASE clinica;
USE clinica;

CREATE TABLE paciente (
	id int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(20),
	correo varchar(20),
	fecha_nacimiento DATE
);

CREATE TABLE medico (
	id int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(20),
	especialidad varchar(20)
);

CREATE TABLE cita (
	id int PRIMARY KEY AUTO_INCREMENT,
	id_paciente int,
	id_medico int,
	fecha_hora DATETIME,
	estado varchar(10),
	CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id) ON DELETE CASCADE,
	CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medico(id) ON DELETE CASCADE
);

CREATE TABLE cita_audit (
	id int PRIMARY KEY AUTO_INCREMENT,
	id_cita int,
	operacion varchar(10),
	fecha DATE,
	usuario varchar(20)
);

DELIMITER $$
CREATE TRIGGER cita_after_insert
AFTER INSERT ON cita
FOR EACH ROW
BEGIN
	INSERT INTO cita_audit(id_cita,operacion,fecha,usuario)
	VALUES (NEW.id,'INSERT',NOW(),CURRENT_USER());
END$$

CREATE TRIGGER cita_after_update
AFTER UPDATE ON cita
FOR EACH ROW
BEGIN
	INSERT INTO cita_audit(id_cita,operacion,fecha,usuario)
	VALUES (NEW.id,'UPDATE',NOW(),CURRENT_USER());
END$$