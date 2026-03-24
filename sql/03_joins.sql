--Título

--Users with no orders
SELECT COUNT(DISTINCT c.customer_unique_id) AS customers_zero_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


--Revenue for delivered orders
SELECT
	SUM(op.payment_value) AS receita
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status = 'delivered';

--Customers by order status
SELECT
	o.order_status,
	COUNT(*) AS pedidos,
	COUNT(DISTINCT c.customer_unique_id) AS clientes
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.order_status
ORDER BY pedidos DESC;

