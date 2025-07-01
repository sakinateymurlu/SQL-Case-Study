- 03_customer_loyalty_analysis.sql
-- Case Study 3: Customer Loyalty Analysis

-- Goal: Identify loyal customers based on their order frequency and recency.

-- Assumptions:
-- We have two tables: CUSTOMERS and ORDERS
-- CUSTOMERS: customer_id, customer_name
-- ORDERS: order_id, customer_id, order_date

-- Criteria:
-- - Customers with 3 or more total orders
-- - At least 1 order placed within the last 6 months

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    MAX(o.order_date) AS last_order_date,
    CASE 
        WHEN COUNT(o.order_id) >= 3 
             AND MAX(o.order_date) >= ADD_MONTHS(SYSDATE, -6)
        THEN 'Loyal'
        ELSE 'Not Loyal'
    END AS loyalty_status
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name
ORDER BY
    loyalty_status DESC, total_orders DESC;
