-- Aggregation queries to summarize key metrics from the dataset

-- Top 10 users by total payment amount
SELECT
	c.customer_unique_id,
	SUM(op.payment_value) AS total_payments
FROM customers c
JOIN orders o ON c.customer_id  = o.customer_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_payments DESC
LIMIT 10;

-- Revenue for each year
SELECT
STRFTIME('%Y', o.order_purchase_timestamp) AS year,
SUM(op.payment_value) AS revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY year
ORDER BY year;

-- Average ticket per order
SELECT
AVG(order_total) AS average_ticket
FROM (
	SELECT
	o.order_id,
	SUM(op.payment_value) AS order_total
	FROM orders o
	JOIN order_payments op ON o.order_id = op.order_id
	GROUP BY o.order_id
);

-- Order distribution by status
SELECT
	order_status,
	COUNT(*) AS total
FROM orders
GROUP BY order_status
ORDER BY total DESC;

-- Revenue by payment method
SELECT
	payment_type,
	SUM(payment_value) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;

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
