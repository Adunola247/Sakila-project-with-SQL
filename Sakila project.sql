-- This project is an Exploratory Data Analysis on the Sakila Dataset.
-- find the first, last name and email address of customers from store 2
SELECT 
    *
FROM
    customer;

SELECT 
    c.first_name, c.last_name, c.email
FROM
    customer AS c
WHERE
    store_id = 2;

-- find all movies with rental rate of $0.99
SELECT 
    *
FROM
    film;
SELECT 
    title
FROM
    film
WHERE
    rental_rate = 0.99;

-- what is the total number of movies with the rental rate of $0.99?
SELECT 
    COUNT(title) AS 'below 1 dollar'
FROM
    film
WHERE
    rental_rate = 0.99;

-- find the total number of most film rating
SELECT 
    COUNT(title), rating
FROM
    film
GROUP BY rating;

-- which rating is most prevalent in each store?
SELECT 
    *
FROM
    inventory;
SELECT 
    *
FROM
    store;
SELECT 
    *
FROM
    film;

SELECT 
    s.store_id, f.rating, COUNT(f.rating) AS total_rating
FROM
    store s
        JOIN
    inventory i ON s.store_id = i.store_id
        JOIN
    film f ON f.film_id = i.film_id
GROUP BY 1 , 2
ORDER BY total_rating DESC;


-- find the title, category and language of the movies
SELECT 
    *
FROM
    language;
SELECT 
    *
FROM
    film_category;
SELECT 
    *
FROM
    category;

SELECT 
    f.title, c.name AS category, l.name AS language
FROM
    film AS f
        JOIN
    language AS l USING (language_id)
        JOIN
    film_category AS fc USING (film_id)
        JOIN
    category AS c USING (category_id);

-- find the customer with the highest rental amount so that we can send him/her rewards or debate
SELECT 
    *
FROM
    customer;
SELECT 
    *
FROM
    payment;


SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount
FROM
    customer c
        JOIN
    payment p using (customer_id)
GROUP BY customer_id
ORDER BY total_amount DESC
LIMIT 1;

-- find the customers between 250-259
SELECT 
    *
FROM
    customer
LIMIT 249, 10;