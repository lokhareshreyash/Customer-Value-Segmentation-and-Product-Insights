-- ALL UNIQUE COUNTRIES IN CUSTOMERS TABLE
SELECT DISTINCT country
FROM gold.dim_customers;

--ALL UNIQUE PRODUCT CATEGORIES and its SUBCATEGORIES IN THE PRODUCTS TABLE
SELECT DISTINCT category, subcategory
FROM gold.dim_products;

--EXPLORE ALL CATEGORIES "THE MAJOR DIVISIONS"
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products;