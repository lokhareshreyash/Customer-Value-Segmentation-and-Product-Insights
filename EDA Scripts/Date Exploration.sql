--Find the date of First and last order
SELECT MIN(order_date) AS first_order_date, MAX(order_date) AS last_order_date
FROM gold.fact_sales;

--How many years of sales are available
SELECT DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS years_of_sale
FROM gold.fact_sales;

--Youngest and Oldest customer
SELECT MIN(birthdate) AS oldest_customer, MAX(birthdate) AS oldest_customer,
DATEDIFF(year, MIN(birthdate), MAX(birthdate)) AS customer_age_range
FROM gold.dim_customers;