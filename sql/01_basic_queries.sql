-- Initial queries to better understand the analyzed database

--Top 10 users by payment amount, considering delivery status
SELECT
	c.customer_id,
	SUM(op.payment_value) AS total_payments
FROM customers c
JOIN orders o ON c.customer_id  = o.customer_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_id
ORDER BY total_payments DESC
LIMIT 10;

--To check the available order statuses
SELECT DISTINCT order_status
FROM orders;

--Number of sales above R$2,000
SELECT COUNT(*) payment_value
FROM order_payments
WHERE payment_value > 2000;

--Most commonly used payment methods
SELECT payment_type,
COUNT(*) AS payment_total
FROM order_payments
GROUP BY payment_type
ORDER BY payment_total DESC;

--Total number of orders
SELECT COUNT(*) order_id
FROM orders;

--Total number of users
SELECT COUNT(*) AS total_customers
FROM customers;
