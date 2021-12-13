-- ex 1
--SELECT * FROM film
--SELECT district, phone, postal_code FROM address
--SELECT address || ' ' || district || ' ' postal_code FROM address

--ex 2
--SELECT first_name FROM customer WHERE first_name LIKE 'J%'
--SELECT amount FROM payment WHERE amount BETWEEN 3 and 5;
--Doesn't work!! SELECT amount, payment_date FROM payment WHERE payment_date BETWEEN '2007-03-15' AND '2007-02-20';
--SELECT film_id, title FROM film WHERE film_id IN (SELECT film_id FROM inventory)
--SELECT amount, payment_date FROM payment WHERE amount BETWEEN 4 AND 6 ORDER BY payment_date DESC
--SELECT first_name, last_name FROM customer ORDER BY first_name DESC LIMIT 5
--SELECT first_name, last_name FROM customer ORDER BY first_name ASC LIMIT 5 OFFSET 10;


-- ex 3
--INSERT INTO customer(store_id,first_name,last_name,email,address_id)
--VALUES (1,'Frank', 'Aladdin', 'fral@gmail.com', '2'),(1,'Frank', 'Aladdin', 'fral@gmail.com', '2'),(1,'Frank', 'Aladdin', 'fral@gmail.com', '2'),(1,'Frank', 'Aladdin', 'fral@gmail.com', '2'),(1,'Frank', 'Aladdin', 'fral@gmail.com', '2')RETURNING *;

--UPDATE customer
--SET first_name= 'Nardo'
--WHERE customer_id = 601
--RETURNING *;

--DELETE FROM customer
--WHERE customer_id = 604;

-- ex 4

--SELECT customer_id, SUM (amount) FROM payment GROUP BY customer_id HAVING SUM (amount)>(SELECT ROUND(AVG (amount), 2) FROM payment)

SELECT 
	payment.customer_id,
	customer.first_name,
	customer.last_name,
	staff.first_name,
	staff.last_name, 
	amount
	
FROM
	payment

	INNER JOIN customer
		ON customer.customer_id = payment.customer_id
	INNER JOIN staff
		ON staff.staff_id = payment.staff_id