-- Ejercicio complementario
DELIMITER $$

CREATE PROCEDURE AddNewCustomer (
    IN storeId INT,
    IN firstName VARCHAR(45),
    IN lastName VARCHAR(45),
    IN email VARCHAR(50),
    IN addressId INT,
    IN active INT
)
BEGIN
	INSERT INTO customer(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
    VALUES (storeId, firstName, lastName, email, addressId, active, NOW(), NOW());
END $$

DELIMITER ;

CALL AddNewCustomer(1,'Daniel','Flores','abc@gmail.com',5,1);
SELECT * FROM customer
WHERE first_name LIKE 'Da%';

-- Análisis de resultados
-- Ejercicio 1
DELIMITER $$

CREATE PROCEDURE GetCustomerEmail (IN customerId INT, OUT correo VARCHAR(50))
BEGIN
	SELECT email INTO correo
    FROM customer
    WHERE customer_id = customerId;
END $$

DELIMITER ;

CALL GetCustomerEmail (600, @correo);
SELECT @correo;

-- Ejercicio 2
DELIMITER $$

CREATE PROCEDURE CountCustomers (OUT total INT)
BEGIN
	SELECT COUNT(customer_id)
    INTO total
    FROM customer;
END $$

DELIMITER ;

CALL CountCustomers (@total);
SELECT @total;

-- Ejercicio 3
DELIMITER $$

CREATE PROCEDURE UpdateCustomerEmail (IN customerId INT, IN newEmail VARCHAR(50))
BEGIN
	UPDATE customer
    SET email = newEmail
    WHERE customer_id = customerId;
END $$

DELIMITER ;

CALL UpdateCustomerEmail (600, 'xyz@yahoo.com');
SELECT * FROM customer
WHERE customer_id = 600;