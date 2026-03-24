-- Basic exploration queries to understand the dataset structure and volume

--Check available order statuses
SELECT DISTINCT order_status
FROM orders;

--Number of sales above R$2,000
SELECT COUNT(*) AS total_payments
FROM order_payments
WHERE payment_value > 2000;

--Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

--Total number of users
SELECT COUNT(*) AS total_customers
FROM customers;
