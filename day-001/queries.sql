
-- Q1. Where am I?
select current_user, current_database(), now();
-- Q2. What engine is this?
select version();
-- Q3. What tables exist? (Postgres catalog)
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
	AND table_type = 'BASE TABLE'
ORDER BY table_name;
-- Q4. Peek at films — 
select *
from film
limit 5;

-- Q5. Name the columns you care about (Excel: hide extra columns)
SELECT title, release_year, rating, length, rental_rate
FROM film
LIMIT 10;

-- Q6. Rename a column in the result (does not change the table)
SELECT
    title AS movie,
    length AS minutes,
    rental_rate AS price
FROM film
LIMIT 10;

-- Q7. Customers, sorted (Excel: sort A–Z)
SELECT first_name, last_name, email
FROM customer
ORDER BY last_name, first_name
LIMIT 10;

-- Q8. How big are the main tables?
SELECT COUNT(*) AS film_rows FROM film;
SELECT COUNT(*) AS customer_rows FROM customer;
SELECT COUNT(*) AS rental_rows FROM rental;
SELECT COUNT(*) AS payment_rows FROM payment;