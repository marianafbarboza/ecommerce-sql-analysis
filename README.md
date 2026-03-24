# E-commerce Data Analysis with SQL

## Objective
This project analyzes an e-commerce open dataset using SQL, focusing on revenue, customer behavior, and operational performance.

## Tools
- SQL (SQLite)
- DBeaver

## Dataset
Brazilian E-commerce Public Dataset (Olist)

---

## Key Questions

- How is revenue distributed across customers?
- What is the average ticket per order?
- What is the cancellation rate?
- Are there high-value customers?
- Is revenue concentrated?

---

## Key Metrics

- Total Orders: 99,441
- Average Ticket: R$160.99
- Cancellation Rate: 0.63%
- High-value customers (> R$1000): 1.27% of total
- Revenue from high-value customers: 12.17%

---

## Key Insights

- A small portion of customers (1.27%) generates 12.17% of total revenue, indicating moderate revenue concentration.
- Most orders are successfully delivered, suggesting strong operational performance.
- Cancellation rate is low (0.63%), indicating efficiency, though repeated cancellations by some customers may require attention.
- Customer behavior suggests some level of recurrence, especially among delivered orders.

---

## Project Structure

- `/sql`: SQL queries used in the analysis
- `/insights`: Business insights derived from the data

---

## Next Steps

- Analyze revenue loss from cancellations
- Compare recurring vs non-recurring customers
- Build a dashboard on Power BI
