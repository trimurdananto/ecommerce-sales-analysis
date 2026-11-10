-- ==========================================================
-- E-COMMERCE SALES PERFORMANCE ANALYSIS - SQL SCRIPTS
-- Database Dialect: PostgreSQL / MySQL Compatible
-- ==========================================================

-- 1. Monthly Revenue & Total Orders Trend
-- Objective: Track how revenue and order volumes grow month-over-month.
SELECT 
    DATE_TRUNC('month', order_date) AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_active_customers,
    SUM(quantity * unit_price) AS total_revenue
FROM 
    ecommerce_sales
GROUP BY 
    1
ORDER BY 
    sales_month ASC;


-- 2. Top 5 Best-Selling Products by Revenue
-- Objective: Identify which products contribute the most to the bottom line.
SELECT 
    product_name,
    product_category,
    SUM(quantity) AS total_units_sold,
    SUM(quantity * unit_price) AS total_revenue
FROM 
    ecommerce_sales
GROUP BY 
    product_name,
    product_category
ORDER BY 
    total_revenue DESC
LIMIT 5;


-- 3. Regional Performance Breakdown
-- Objective: Analyze sales performance and average order value (AOV) by region.
SELECT 
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity * unit_price) AS total_revenue,
    ROUND(AVG(quantity * unit_price), 2) AS average_order_value
FROM 
    ecommerce_sales
GROUP BY 
    region
ORDER BY 
    total_revenue DESC;
