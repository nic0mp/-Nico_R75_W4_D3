-- 1. List all customers who live in Texas (use JOINs)
SELECT COUNT (*)
FROM customer
RIGHT JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.first_name, customer.last_name
FROM customer
LEFT JOIN payment
ON customer.customer_id= payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT store_id,first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id,first_name,last_name;

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--OTHER SOLUTION
SELECT first_name, last_name
FROM customer
WHERE address_id IN(
	SELECT address_id
	FROM address
	WHERE city_id IN(
		SELECT city_id
		FROM city
		WHERE country_id IN(
			SELECT country_id
			FROM country
			WHERE country = 'Nepal'
		)
	)
);

-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(payment.payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY(first_name, last_name)

-- 6. How many movies of each rating are there?
SELECT rating,film_id, title
FROM film
WHERE rating = 'R';

SELECT *
FROM film_category

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT DISTINCT(customer_id)
FROM payment
WHERE customer_id IN(
    SELECT customer_id
    FROM customer
    GROUP BY customer_id
)GROUP BY payment.payment_id HAVING COUNT(amount)=1
;

-- 8. How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;