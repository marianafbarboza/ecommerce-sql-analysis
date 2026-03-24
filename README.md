# 🛒 E-commerce Data Analysis with SQL

## Project Overview
This project explores an e-commerce dataset using SQL to analyze customer behavior, revenue distribution, and operational performance.
The goal is to simulate real-world business questions and extract actionable insights from raw data.

---

## Objectives
- To understand customer purchasing behavior
- Analyze revenue distribution
- Evaluate operational performance (deliveries and cancellations)
- Identify opportunities for business improvement

---

## Dataset
The dataset contains information about:
- Customers
- Orders
- Payments

Key tables used:
- `customers`
- `orders`
- `order_payments`

---

## Tools & Skills
- SQL (SQLite)
- Data aggregation (COUNT, SUM, AVG)
- JOINs (INNER JOIN, LEFT JOIN)
- Business metrics calculation
- Analytical thinking

---

## Key Analyses
### 1. Operational Performance
- Most orders are successfully delivered
- Cancellation rate is low (~0.63%)
Indicates a generally efficient operation, with room for improvement in cancellations.

---

### 2. Revenue Analysis
- Revenue is mainly generated from delivered orders
Highlights the importance of logistics and fulfillment.

---

### 3. Customer Behavior
- Some customers place multiple orders
Indicates recurring behavior and potential for retention strategies.

---

### 4. Customer Segmentation
- Only 1.27% of customers are high-value (> R$1000)
- These customers represent 12.17% of total revenue
Shows the importance of a small but impactful customer segment.

---

### 5. Additional Insights
- Orders > customers → repeat purchases exist
- Customers appear in multiple statuses → status is order-level
- Some customers canceled more than once → potential experience issues

---

## Key Metrics
- Cancellation Rate: ~0.63%
- High-value customers: 1.27%
- Revenue from high-value customers: 12.17%

---

## Recommendations
- Monitor cancellation patterns to identify operational issues
- Invest in retention strategies for recurring customers
- Develop targeted strategies for high-value customers

---

## Project Structure

sql (./sql/)
- 01_basic_queries.sql
- 02_aggregations.sql
- 03_joins.sql
- 04_business_metrics.sql

insights(./insights/)
- findings.md


---

##  Next Steps
- Add data visualization (Power BI / Tableau)
- Explore customer lifetime value (CLV)
- Analyze churn behavior

---

## Author
Developed as part of a hands-on SQL learning journey focused on real-world business analysis.
