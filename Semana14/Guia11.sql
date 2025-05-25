-- Complementario --

CREATE USER 'fl220294'@'%' IDENTIFIED BY '1001';
GRANT SELECT ON sakila.* TO 'fl220294'@'%';
GRANT CREATE, CREATE VIEW ON sakila.* TO 'fl220294'@'%';
FLUSH PRIVILEGES;

DROP USER 'fl220294'@'%';
FLUSH PRIVILEGES;

-- Investigación --

CREATE DATABASE investigacion;
USE investigacion;

CREATE TABLE cliente (
	id_cliente int PRIMARY KEY AUTO_INCREMENT
);