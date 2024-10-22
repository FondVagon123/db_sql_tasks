1. Загальна кількість фільмів у кожній категорії
SELECT c.name AS category_name, COUNT(f.film_id) AS film_count
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;


2. Середня тривалість фільмів у кожній категорії
SELECT c.name AS category_name, AVG(f.length) AS avg_length
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;


3. Мінімальна та максимальна тривалість фільмів
SELECT MIN(length) AS min_length, MAX(length) AS max_length
FROM film;


4. Загальна кількість клієнтів
SELECT COUNT(customer_id) AS total_customers
FROM customer;


5. Сума платежів по кожному клієнту
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;


6. Пять клієнтів з найбільшою сумою платежів
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_payments DESC
LIMIT 5;


7. Загальна кількість орендованих фільмів кожним клієнтом
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;


8. Середній вік фільмів у базі даних
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(release_year)) AS avg_film_age
FROM film;


9. Кількість фільмів, орендованих за певний період
SELECT COUNT(r.rental_id) AS total_rentals
FROM rental r
WHERE r.rental_date BETWEEN '2023-01-01' AND '2023-12-31';


10. Сума платежів по кожному місяцю
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month, SUM(p.amount) AS total_payments
FROM payment p
GROUP BY month
ORDER BY month;


11. Максимальна сума платежу, здійснена клієнтом
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, MAX(p.amount) AS max_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;


12. Середня сума платежів для кожного клієнта
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, AVG(p.amount) AS avg_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;


13. Кількість фільмів у кожному рейтингу (rating)
SELECT f.rating, COUNT(f.film_id) AS film_count
FROM film f
GROUP BY f.rating;


14. Середня сума платежів по кожному магазину (store)
SELECT s.store_id, AVG(p.amount) AS avg_payment
FROM store s
JOIN customer c ON s.store_id = c.store_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY s.store_id;


