-- 02_sales_trend_analysis.sql
-- Case Study 2: Sales Trend Analysis

-- Məqsəd: Aylıq satışların ümumi məbləğini analiz etmək və satış performansını vaxt üzrə izləmək.

-- Fərziyyə: ORDERS cədvəlində aşağıdakı sütunlar var:
-- order_id (number), order_date (date), order_amount (number)

SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
    SUM(order_amount) AS total_sales,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY
    TO_CHAR(order_date, 'YYYY-MM')
ORDER BY
    sales_month;
