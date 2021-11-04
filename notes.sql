SELECT *
FROM film_actor;

-- Inner Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- Left Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id
FROM film_actor
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name IS NULL AND last_name IS NULL;

SELECT *
FROM address;

-- Join that will produce info about a customer
-- From the country of Angola
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

--Right join to find out the amoount of staff member
SELECT COUNT(staff_id), store.store_id
FROM staff
RIGHT JOIN store
ON staff.store_id = store.store_id
GROUP BY store.store_id

SELECT *
FROM film_actor

SELECT film.title film.release_year
FROM film_actor
FULL JOIN film
ON film.film_id = film_actor.film_id
GROUP BY film.title

--Subqueries
-- Find a -- Find a customer_id that has a amount greater
-- Than 175 in total payments
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

--Find all customer data
SELECT *
FROM customer;

-- Subquery to find the 6 customers that have
-- A total amount of payments greater than 175

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC

);

--Find all films with the language English
SELECT*
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name <> 'English'
);

--What film has the most actors? film_actor + film_id
SELECT film_id
FROM film






