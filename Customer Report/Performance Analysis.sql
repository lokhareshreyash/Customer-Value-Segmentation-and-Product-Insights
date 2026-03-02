--Analyze the yearly performance of products by comparing each product's sales to both its average sales and the previous years sales
WITH general_stats AS 
(
SELECT YEAR(f.order_date) AS order_year, p.product_name, SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
ON f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
GROUP BY YEAR(f.order_date), p.product_name
)

SELECT order_year, product_name, total_sales,
AVG(total_sales) OVER(PARTITION BY product_name) AS average_sales,
total_sales - AVG(total_sales) OVER(PARTITION BY product_name) AS sales_diff,
CASE WHEN total_sales - AVG(total_sales) OVER(PARTITION BY product_name) < 0 THEN 'Below Average'
WHEN total_sales - AVG(total_sales) OVER(PARTITION BY product_name) > 0 THEN 'Above Average'
END AS flag,
LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS previous_sales,
total_sales - LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS previous_diff,
CASE WHEN total_sales - LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
 WHEN total_sales - LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
ELSE 'No Change' END AS flag1
FROM general_stats
ORDER BY product_name, order_year;