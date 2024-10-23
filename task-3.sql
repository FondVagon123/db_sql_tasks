1. Загальна кількість фільмів у кожній категорії
SELECT 
    c.name AS category_name, 
    COUNT(f.film_id) AS film_count
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name;


2. Середня тривалість фільмів у кожній категорії
SELECT 
    c.name AS category_name, 
    AVG(f.length) AS average_length
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name;


3. Мінімальна та максимальна тривалість фільмів
SELECT 
    MIN(f.length) AS minimum_length, 
    MAX(f.length) AS maximum_length
FROM 
    film f;


4. Загальна кількість клієнтів
SELECT 
    COUNT(customer_id) AS total_customers
FROM 
    customer;


5. Сума платежів по кожному клієнту
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    SUM(p.amount) AS total_payments
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id;


6. Пять клієнтів з найбільшою сумою платежів
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    SUM(p.amount) AS total_payments
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id
ORDER BY 
    total_payments DESC
LIMIT 5;


7. Загальна кількість орендованих фільмів кожним клієнтом
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    COUNT(r.rental_id) AS total_rentals
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id;


8. Середній вік фільмів у базі даних
SELECT 
    AVG(EXTRACT(YEAR FROM CURRENT_DATE) - f.release_year) AS average_film_age
FROM 
    film f;


9. Кількість фільмів, орендованих за певний період
SELECT 
    COUNT(r.rental_id) AS total_rentals
FROM 
    rental r
WHERE 
    r.rental_date BETWEEN '2023-01-01' AND '2023-12-31'; -- Змініть дати на потрібні


10. Сума платежів по кожному місяцю
SELECT 
    DATE_TRUNC('month', p.payment_date) AS month, 
    SUM(p.amount) AS total_payments
FROM 
    payment p
GROUP BY 
    month
ORDER BY 
    month;


11. Максимальна сума платежу, здійснена клієнтом
SELECT 
    c.customer_id, 
    MAX(p.amount) AS max_payment
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id;

12. Середня сума платежів для кожного клієнта
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    AVG(p.amount) AS average_payment
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id;


13. Кількість фільмів у кожному рейтингу (rating)
SELECT 
    f.rating AS film_rating, 
    COUNT(f.film_id) AS film_count
FROM 
    film f
GROUP BY 
    f.rating;


14. Середня сума платежів по кожному магазину (store)
SELECT 
    s.store_id, 
    AVG(p.amount) AS average_payment
FROM 
    store s
JOIN 
    customer c ON s.store_id = c.store_id
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    s.store_id;
