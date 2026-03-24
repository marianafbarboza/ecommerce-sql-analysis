
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
)
