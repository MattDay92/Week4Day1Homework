-- 1. How many actors are there with the last name ‘Wahlberg’?
        -- Answer:  2

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
        -- Answer:  4802

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;

    -- OR if you don't include 3.99 and 5.99
    -- Answer: 3238

SELECT COUNT(amount)
FROM payment
WHERE amount > 3.99 and amount < 5.99;

-- 3. What film does the store have the most of? (search in inventory)
    --Answer: There are multiple at 8 but one of them is "Crossroads Casualties"

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

SELECT title
FROM film
WHERE film_id = '193';

-- 4. How many customers have the last name ‘William’?
    --Answer: 0

SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
    --Answer: staff_id = 1

SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;

-- 6. How many different district names are there?
    --Answer:  378

SELECT COUNT(DISTINCT district)
FROM address



-- 7. What film has the most actors in it? (use film_actor table and get film_id)
    --Answer:  film_id = 508
    --         Film Title:  lambs Cincinatti

SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

SELECT title, film_id
FROM film
WHERE film_id = '508';


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
    --Answer:  2

SELECT first_name, store_id
FROM customer
WHERE first_name LIKE '%es'
ORDER BY store_id DESC;


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
    --Answer: 3

SELECT amount
FROM payment
WHERE customer_id > 380 and customer_id < 430
GROUP BY amount
HAVING COUNT(rental_id) > 250
ORDER BY amount DESC;



-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
    --Answer:  5 rating categories
    --         PG-13 with 223 total movies

SELECT count(DISTINCT rating)
FROM film

SELECT rating
FROM film

SELECT COUNT(title)
FROM film
WHERE rating = 'R'
-- 195

SELECT COUNT(title)
FROM film
WHERE rating = 'PG-13'
-- 223

SELECT COUNT(title)
FROM film
WHERE rating = 'G'
-- 178

SELECT COUNT(title)
FROM film
WHERE rating = 'NC-17'
-- 209

SELECT COUNT(title)
FROM film
WHERE rating = 'PG'
-- 194


