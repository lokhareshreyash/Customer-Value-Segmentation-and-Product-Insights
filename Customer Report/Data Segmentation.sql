--Segment products into cost ranges and count how many products fall into each segment
WITH product_segments AS
(
SELECT product_key, product_name, 
CASE WHEN cost < 100 THEN 'Below 100'
	 WHEN cost BETWEEN 100 AND 500 THEN '100-500'
	 WHEN cost BETWEEN 501 AND 1000 THEN '501-1000'
	 ELSE 'Above 1000' END AS cost_range
FROM gold.dim_products
)

SELECT cost_range, COUNT(product_key) AS product_counts
FROM product_segments
GROUP BY cost_range
ORDER BY product_counts DESC;

--Group customers into 3 segments based on their spending behavior:
--VIP: at least 12 months of history and spending more than 5,000
--Regular: at least 12 months of history but spending 5000 or less
--New: lifespan less than 12 months
--Find the total number of customers in each group

WITH max_order_dates AS 
(
SELECT c.customer_key, MAX(f.order_date) AS latest_order, MIN(order_date) AS first_order
FROM gold.dim_customers AS c
LEFT JOIN gold.fact_sales AS f
ON c.customer_key = f.customer_key
GROUP BY c.customer_key
),
customer_age AS
(
SELECT m.customer_key, m.latest_order, m.first_order, DATEDIFF(MONTH, m.first_order, m.latest_order) AS account_age
FROM max_order_dates AS m
INNER JOIN gold.dim_customers AS c
ON c.customer_key = m.customer_key
),
customer_spendings AS
(
SELECT customer_key, SUM(sales_amount) AS total_spendings
FROM gold.fact_sales
GROUP BY customer_key
),
segmentation AS
(
SELECT a.customer_key, 
CASE WHEN a.account_age >= 12 AND s.total_spendings > 5000 THEN 'VIP'
	 WHEN a.account_age >= 12 AND s.total_spendings <= 5000 THEN 'Regular'
	 ELSE 'New' END AS customer_segmentation
FROM customer_age AS a
LEFT JOIN customer_spendings AS s
ON a.customer_key = s.customer_key
)

SELECT customer_segmentation, COUNT(customer_key) AS customer_count
FROM segmentation
GROUP BY customer_segmentation
ORDER BY customer_count DESC;
