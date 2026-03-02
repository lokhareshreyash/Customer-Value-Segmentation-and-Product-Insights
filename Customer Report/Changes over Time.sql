--Sales Performance Over Years
SELECT YEAR(order_date) AS years, SUM(sales_amount) AS Sales, COUNT(DISTINCT customer_key) AS total_customers, SUM(quantity) AS total_quantities
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY years;

--Sales Performance Over Years and their months
SELECT YEAR(order_date) AS years, MONTH(order_date) AS months, SUM(sales_amount) AS Sales, COUNT(DISTINCT customer_key) AS total_customers, SUM(quantity) AS total_quantities
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY years, months;

