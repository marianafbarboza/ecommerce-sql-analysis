
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
