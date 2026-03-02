--Calculate the total sales per month and the running total of sales over time
SELECT months, total_sales, SUM(total_sales) OVER(PARTITION BY YEAR(months) ORDER BY months) AS running_totals
FROM (
SELECT DATETRUNC(month, order_date) AS months, SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE DATETRUNC(month, order_date) IS NOT NULL
GROUP BY DATETRUNC(month, order_date)) AS s;


--Calculate the averages of the sales per year and the moving averages over time
SELECT years, average_sales, AVG(average_sales) OVER(ORDER BY years) AS moving_averages
FROM (
SELECT YEAR(order_date) AS years, AVG(sales_amount) AS average_sales
FROM gold.fact_sales
WHERE YEAR(order_date) IS NOT NULL
GROUP BY YEAR(order_date)) AS s;