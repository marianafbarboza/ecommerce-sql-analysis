-- Join queries to explore relationships between tables

-- Customers with orders
SELECT COUNT(*)
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Customers without orders
SELECT COUNT(*)
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Orders without payments
SELECT COUNT(*)
FROM orders o
LEFT JOIN order_payments op ON o.order_id = op.order_id
WHERE op.order_id IS NULL;

-- Orders with customers (validation)
SELECT COUNT(*)
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
