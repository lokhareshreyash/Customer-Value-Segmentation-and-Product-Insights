#  Customer Revenue & Product Analytics using SQL

##  Project Overview

This project is a complete **end-to-end SQL data analytics project** where I used only SQL to explore the data, generate business KPIs, and create customer and product level reports.

The main goal of this project is to convert raw transactional data into **meaningful business insights** which can help management in better decision making.

In this project I performed:

- Data exploration
- KPI calculation
- Time-based trend analysis
- Customer segmentation
- Product performance analysis
- Ranking & contribution analysis
- Report generation using SQL

---

##  Business Objective

The objective of this project is to answer important business questions like:

- Who are our top customers?
- Which products are generating the highest revenue?
- How is the business growing over time?
- Which category contributes the most to total sales?
- Which customers are high value and low value?
- What are the key performance metrics of the business?

---

##  Tools & Skills Used

- SQL
- Joins
- CTE (Common Table Expressions)
- Aggregate Functions
- Window Functions
- CASE WHEN
- Ranking Functions
- Running Totals
- Contribution Analysis

---

##  Step by Step Query Explanation

### 1 Fetching Base Data
In this query I joined the required tables and created a base dataset which is used for complete analysis.

Purpose:
To bring all important columns like customer, product, sales, quantity and date into one place.

---

### 2 Date Exploration
Here I checked:

- First order date
- Last order date
- Total time period of data

Business Use:
To understand how many years/months of data is available for analysis.

---

### 3 Dimensions Exploration
In this part I found:

- Total number of customers
- Total number of products
- Total number of categories

Business Use:
To understand business size and data distribution.

---

### 4 Measures Exploration (KPI Calculation)

Main KPIs created:

- Total Revenue
- Total Orders
- Total Quantity Sold
- Average Order Value

These KPIs show overall business performance.

---

### 5 Magnitude Analysis

Here I compared performance across:

- Products
- Categories
- Customers

Business Question Answered:
Which segment is generating more revenue?

---

### 6 Ranking Analysis

I identified:

- Top customers
- Top products
- Bottom performing products

Business Use:
Helps in target marketing and inventory planning.

---

### 7 Changes Over Time (Trend Analysis)

In this query I analysed:

- Monthly revenue
- Yearly growth

Business Use:
To track business growth and identify seasonality.

---

### 8 Cumulative Analysis

Here I created:

- Running total of revenue
- Running total of customers

Business Use:
To see how business is growing over time.

---

### 9 Part to Whole Analysis

In this I calculated:

- % contribution of each product/category to total revenue

Business Use:
To identify high impact products.

---

### 10 Data Segmentation

Customers are segmented into:

- High Value Customers
- Medium Value Customers
- Low Value Customers

Business Use:
Useful for marketing strategy and customer retention.

---

### 11 Performance Analysis

In this query I compared:

- Actual performance of products/customers

Business Use:
To identify best and worst performers.

---

##  Reports Created

###  Customer Report

This report contains:

- Total orders per customer
- Total revenue per customer
- Total quantity purchased
- Customer ranking
- Customer segment (High / Medium / Low value)

 Business Insights:

- Top customers contributing major revenue
- Low value customers who need engagement
- Customer purchase behaviour

---

###  Product Report

This report contains:

- Product wise total revenue
- Total quantity sold
- Product ranking
- Product contribution %
- Performance category

 Business Insights:

- Best selling products
- Slow moving products
- High revenue generating categories

---

##  Key Business Insights from the Project

✔ Few customers are contributing most of the revenue (Pareto effect)  
✔ Top products are driving the overall business growth  
✔ Some products have high quantity but low revenue  
✔ Monthly sales show clear growth trend  
✔ High value customers should be targeted for retention  
✔ Low performing products need business strategy change  

---
