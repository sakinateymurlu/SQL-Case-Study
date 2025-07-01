-- Case Study 1: Customer Analysis

-- Goal: Identify the top 10 customers based on their total spending
-- and number of orders.

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_spent
FROM 
    orders
GROUP BY 
    customer_id
ORDER BY 
    total_spent DESC
LIMIT 10;
