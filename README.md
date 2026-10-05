
# Project Background

Atliq Hardware is a FMCG company which sells computers, laptops and peripherals through e-commerece paltforms like Amazon, Flipkart and through stores like croma, best buy and also their own Atliq Exclusive stores. 

However, the management noticed that they do not get enough insights to make quick and smart data-informed decisions. They want to expand their data analytics team by adding several junior data analysts. Tony Sharma, their data analytics director, wanted to hire someone good at both tech and soft skills. Hence, he decided to conduct a SQL challenge, which will help him understand both skills.

# Data Structure and Initial checks

Atliq's Data structure consists for four main tables as seen below: dim_customer, dim_product, dim_market, fact_sales_monthly with a total row count of 9,71,631 rows.

#### Description of each table is as follows:
- dim_customer: contains customer-related data
- dim_product: contains product-related data
- fact_gross_price: contains gross price information for each product
- fact_manufacturing_cost: contains the cost incurred in the production of each product
- fact_pre_invoice_deductions: contains pre-invoice deductions information for each product
- fact_sales_monthly: contains monthly sales data for each product.

![Image](Images/Screenshot%202024-08-13%20190821.png)

Please find SQL Codes for the adhoc requests [here](Adhoc_SQL_Codes)

# Insights based on 10 adhoc requests:

1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

![Image](Images/Screenshot%202024-08-13%20192507.png)

2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg.

![Image](Images/Screenshot%202024-08-13%20193309.png)

3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, segment product_count.

![Image](Images/Screenshot%202024-08-13%20194255.png)

4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020 product_count_2021 difference.

![Image](Images/Screenshot%202024-08-13%20221959.png)

5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, product_code product manufacturing_cost.

![Image](Images/Screenshot%202024-08-16%20184735.png)

6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields, customer_code, customer and average_discount_percentage.

![Image](Images/Screenshot%202024-08-16%20191253.png)

7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . This analysis helps to get an idea of low and high-performing months and take strategic decisions. The final report contains these columns: Month, Year
and Gross sales Amount.

![Image](Images/Screenshot%202024-08-16%20192320.png)
![Image](Images/Screenshot%202024-08-16%20192335.png)

8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, Quarter and total_sold_quantity.

![Image](Images/Screenshot%202024-08-16%20202939.png)

9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields: channel, gross_sales_mln, percentage.

![Image](Images/Screenshot%202024-08-16%20205433.png)

10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these fields: division, product_code, product, total_sold_quantity, rank_order

![Image](Images/Screenshot%202024-08-16%20211441.png)


