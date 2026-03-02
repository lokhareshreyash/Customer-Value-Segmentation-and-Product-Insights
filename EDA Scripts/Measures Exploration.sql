--Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

--How many items are sold
SELECT SUM(quantity) AS total_sales
FROM gold.fact_sales;

--Average Selling Price
SELECT AVG(price) AS avg_price
FROM gold.fact_sales;

--Total Number of Orders
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

--Total Number of Products
SELECT COUNT(DISTINCT product_id) AS total_products
FROM gold.dim_products;

--Total number of Customers
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.dim_customers;

--Total Number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS customers_with_orders
FROM gold.fact_sales
WHERE order_date IS NOT NULL;


--Key Metrics in a Table
SELECT 'Total_sales' AS measure_name, SUM(sales_amount) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT 'Items Sold', SUM(quantity)
FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price)
FROM gold.fact_sales
UNION ALL
SELECT 'Total Customers' , COUNT(DISTINCT customer_key)
FROM gold.dim_customers
UNION ALL
SELECT 'Customers with Orders', COUNT(DISTINCT customer_key)
FROM gold.fact_sales
WHERE order_date IS NOT NULL;