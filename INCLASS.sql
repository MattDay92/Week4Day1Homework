-- BASIC QUERY
-- Use two hyphens or ctrl+/ to write comments

--SELECT tells which column to choose 
--FROM tells which table to choose FROM

--We're getting this information from a pre-created database
--Eventually we'll be able to create our own!

-- SELECT all records from actor table
SELECT *
FROM actor;

-- To run just that one action - highlight it and then ctrl+e ctrl+e

SELECT first_name, last_name FROM actor; SELECT last_name, first_name from actor;

-- end SQL lines with a semicolon!
--indentation, line breaks, etc don't matter in SQL

SELECT *
FROM actor
WHERE first_name = 'Nick';

-- Must use single quotes!  NO DOUBLE QUOTES
-- equals sign will find exact match - looking for literally just first name Nick

SELECT *
FROM actor
WHERE first_name LIKE 'Nick';

--A percent sign acts like a WILD CARD
-- LIKE gives it the ability to use special characters like N% which looks for starting with N

SELECT *
FROM actor
WHERE first_name LIKE 'N%';

-- UNDERSCORE acts as a SINGLE wildcard

SELECT *
FROM actor
WHERE first_name LIKE 'K___';
-- Looking for a four letter first name that starts with K

SELECT *
FROM actor
WHERE first_name LIKE 'K__%n';
-- Can mix and match - looking for AT LEAST a four letter long first name starting with K that ends with n

-- COMPARING OPERATORS
-- GREATER THAN >
-- LESS THAN <
-- GREATER THAN OR EQUAL TO >=
-- LESS THAN or EQUAL TO <=
-- NOT EQUAL TO  <>


SELECT *
FROM payment;

-- Who paid for how much money over $5
SELECT customer_id, amount
FROM payment
WHERE amount > 4.99;

SELECT * FROM payment
WHERE amount <> 4.99;

-- Can ORDER the items ASC (ascending), DECS (descending), etc
-- Show DISTINCT (unique) customer ids
SELECT customer_id
FROM payment
WHERE amount > 10
ORDER BY amount DESC;

-- Who is the big spender, customer 341?
SELECT first_name, last_name, email
FROM customer
WHERE customer_id = 341;

-- This gives us the total sum
SELECT SUM(amount)
FROM payment
WHERE amount > 10.00;

-- I want the total for each customer
SELECT SUM(amount), customer_id
FROM payment
WHERE amount > 10.00
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- different SQL aggregators
-- SUM(), AVG(), COUNT(), MIN(), MAX()
-- To use an aggregator you must have a GROUP BY statement

SELECT SUM(amount)
FROM payment
WHERE customer_id > 300;

SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;
-- There were 7068 purchases made that were over $5.99
-- Just counts the rows so you can select all for COUNT
SELECT COUNT(*)
FROM payment
WHERE amount > 5.99;

SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- AS smallest... adds a column name
SELECT MIN(amount) AS smallest_amount_paid
FROM payment;

SELECT MAX(amount) AS most_amount_paid
FROM payment;


SELECT customer_id, SUM(amount)
FROM payment
WHERE customer_id > 70 AND customer_id < 80
GROUP BY customer_id
HAVING SUM(amount) > 150
ORDER BY customer_id;
-- WHERE can only work for things that come default
-- If you want to sort by an aggregate function, you must use the HAVING clause
-- HAVING must come after GROUP BY

-- BETWEEN includes the 70 and 80 - >= and <=
SELECT customer_id, SUM(amount)
FROM payment
WHERE customer_id BETWEEN 70 and 80
GROUP BY customer_id
HAVING SUM(amount) > 150
ORDER BY customer_id
LIMIT 2
OFFSET 1;

-- RULES
-- Select is ALWAYS the first line
-- HAVING must come after GROUP BY
-- FROM is always the SECOND line


-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT 2 - cuts off after 1st 2 results
-- OFFSET n - skips over the first n results



