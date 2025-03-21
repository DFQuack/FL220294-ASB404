-- Ejercicio 1 --
SELECT c.first_name, c.last_name, f.title, r.return_date
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id;

-- Ejercicio 2 (no funciona porque 'payment' no tiene datos) --
SELECT c.first_name, c.last_name, f.title, r.return_date, p.amount
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
INNER JOIN rental r ON p.rental_id = r.rental_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
ORDER BY p.amount DESC;

-- Ejercicio 3 (no se colocó 'payment') --
SELECT c.first_name, c.last_name, f.title AS Título_Peli, cat.name AS Categoría, l.name AS Idioma, r.return_date
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN `language` l ON f.language_id = l.language_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category cat ON fc.category_id = cat.category_id;