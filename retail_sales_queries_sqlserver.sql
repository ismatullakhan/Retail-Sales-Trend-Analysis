-- ============================================================
-- RETAIL SALES TREND ANALYSIS
-- Analysis Queries - SQL Server Version
-- ============================================================

USE retail_sales_db;
GO

-- ============================================================
-- QUERY 1: Total Revenue by Month (Trend Analysis)
-- ============================================================
SELECT 
    DATENAME(MONTH, sale_date) AS month_name,
    MONTH(sale_date) AS month_num,
    YEAR(sale_date) AS year,
    SUM(total_amount) AS total_revenue,
    COUNT(sale_id) AS total_orders
FROM sales
GROUP BY YEAR(sale_date), MONTH(sale_date), DATENAME(MONTH, sale_date)
ORDER BY year, month_num;

-- ============================================================
-- QUERY 2: Revenue by Quarter (Window Function)
-- ============================================================
SELECT 
    CONCAT('Q', DATEPART(QUARTER, sale_date)) AS quarter,
    YEAR(sale_date) AS year,
    SUM(total_amount) AS quarterly_revenue,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS revenue_rank
FROM sales
GROUP BY YEAR(sale_date), DATEPART(QUARTER, sale_date)
ORDER BY quarterly_revenue DESC;

-- ============================================================
-- QUERY 3: Revenue by Region (JOIN)
-- ============================================================
SELECT 
    r.region_name,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.total_amount) AS total_revenue,
    ROUND(AVG(s.total_amount), 2) AS avg_order_value
FROM sales s
JOIN regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_revenue DESC;

-- ============================================================
-- QUERY 4: Top Product Categories by Revenue (JOIN)
-- ============================================================
SELECT 
    p.category,
    SUM(s.total_amount) AS total_revenue,
    COUNT(s.sale_id) AS total_orders,
    RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS category_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- ============================================================
-- QUERY 5: Underperforming Product Categories (CTE)
-- ============================================================
WITH category_revenue AS (
    SELECT 
        p.category,
        SUM(s.total_amount) AS total_revenue
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category
),
avg_revenue AS (
    SELECT AVG(total_revenue) AS avg_rev FROM category_revenue
)
SELECT 
    c.category,
    c.total_revenue,
    ROUND(a.avg_rev, 2) AS avg_revenue,
    CASE WHEN c.total_revenue < a.avg_rev THEN 'Underperforming' ELSE 'Good' END AS status
FROM category_revenue c
CROSS JOIN avg_revenue a
ORDER BY c.total_revenue ASC;

-- ============================================================
-- QUERY 6: Customer Purchase Summary (JOIN + Aggregation)
-- ============================================================
SELECT 
    c.customer_name,
    c.city,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.total_amount) AS total_spent,
    MAX(s.sale_date) AS last_purchase_date
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_spent DESC;

-- ============================================================
-- QUERY 7: Return Rate Analysis
-- ============================================================
SELECT 
    COUNT(DISTINCT s.sale_id) AS total_sales,
    COUNT(DISTINCT r.return_id) AS total_returns,
    ROUND(COUNT(DISTINCT r.return_id) * 100.0 / COUNT(DISTINCT s.sale_id), 2) AS return_rate_pct
FROM sales s
LEFT JOIN returns r ON s.sale_id = r.sale_id;
GO

PRINT 'All queries executed successfully!';
GO
