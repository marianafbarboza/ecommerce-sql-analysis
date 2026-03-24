--Título

--Customers with more than one order
SELECT
	COUNT(DISTINCT customer_unique_id) AS total_customers,
	SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) AS recurring_customers
FROM (
	SELECT
		c.customer_unique_id,
		COUNT(o.order_id) AS orders
	FROM customers c
	JOIN orders o ON c.customer_id = o.customer_id
	GROUP BY c.customer_unique_id
) t;

--Users with no orders
SELECT COUNT(DISTINCT c.customer_unique_id) AS customers_zero_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--Avegrage orders by month
SELECT
	month,
	AVG(total_orders) AS media_orders
FROM (
	SELECT
		STRFTIME('%Y', order_purchase_timestamp) AS year,
		STRFTIME('%m', order_purchase_timestamp) AS month,
		COUNT(*) AS total_orders
	FROM orders
	GROUP BY year, month
) t
GROUP BY month
ORDER BY month;

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

