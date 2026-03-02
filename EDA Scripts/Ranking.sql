--Which 5 products generate the highest revenue?
SELECT TOP 5 p.product_name, SUM(f.sales_amount) AS revenue
FROM gold.dim_products AS p
LEFT JOIN gold.fact_sales AS f
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY revenue DESC;

--What are the 5 worst-performing products in terms of sales?
SELECT TOP 5 p.product_name, SUM(f.sales_amount) AS revenue
FROM gold.dim_products AS p
LEFT JOIN gold.fact_sales AS f
ON p.product_key = f.product_key
GROUP BY p.product_name
HAVING SUM(f.sales_amount) > 0
ORDER BY revenue;


--Top 10 customers who have generated the highest revenue
SELECT * 
FROM (
SELECT c.first_name, c.last_name, SUM(f.sales_amount) AS revenue, 
ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS ranks
FROM gold.dim_customers AS c
LEFT JOIN gold.fact_sales AS f
ON c.customer_key = f.customer_key
GROUP BY c.first_name, c.last_name
HAVING SUM(f.sales_amount) > 0) AS s
WHERE ranks <= 10;


--Top 3 customers with fewest orders placed
SELECT *
FROM (
SELECT c.customer_key, c.first_name, c.last_name, COUNT(DISTINCT f.order_number) AS orders_placed,
ROW_NUMBER() OVER(ORDER BY COUNT(DISTINCT f.order_number), c.customer_key) AS ranks
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name) AS s
WHERE ranks <= 3;
