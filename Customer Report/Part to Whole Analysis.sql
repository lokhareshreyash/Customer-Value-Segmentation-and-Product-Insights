--Which categories contribute the most to the overall sales

SELECT DISTINCT p.category, ROUND(100*(CAST(SUM(f.sales_amount) AS FLOAT)/(SELECT SUM(sales_amount) FROM gold.fact_sales)), 2) AS sales_percentage
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY sales_percentage DESC;
