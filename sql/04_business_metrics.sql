-- Business metrics to evaluate performance and customer behavior

-- Cancellation rate (% of canceled orders)
SELECT
    ROUND(
        SUM(CASE WHEN order_status = 'canceled' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS cancel_rate_percent
FROM orders;

-- Revenue from delivered orders
SELECT
    SUM(op.payment_value) AS revenue_delivered
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status = 'delivered';

-- Recurrence rate (% of customers with more than one order)
SELECT
    ROUND(
        SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(DISTINCT customer_unique_id),
        2
    ) AS recurrence_rate_percent
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS orders
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) t;

-- Percentage of high-value customers (total spend> R$1000)
SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(DISTINCT customer_unique_id) FROM customers),
        2
    ) AS perc_high_value_customers
FROM (
    SELECT
        c.customer_unique_id,
        SUM(op.payment_value) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_payments op ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
    HAVING total_spent > 1000
);

-- Orders vs customers by status
SELECT
    o.order_status,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.order_status
ORDER BY total_orders DESC;
