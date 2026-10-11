
# Project Background

**Atliq Hardware** is a **FMCG company** which sells **computers, laptops and peripherals** through **e-commerece paltforms** like **Amazon, Flipkart** and through stores like **croma, best buy** and also their own **Atliq Exclusive** stores. 

However, the **management noticed that they do not get enough insights to make quick and smart data-informed decisions.** They want to **expand** their **data analytics team** by adding several junior data analysts. **Tony Sharma, their data analytics director,** wanted to hire someone good at both **tech and soft skills.** Hence, he decided to conduct a **SQL challenge**, which will help him understand both skills.

# Data Structure and Initial checks

**Atliq's Data structure** consists for four main tables as seen below: dim_customer, dim_product, fact_gross_price, fact_manufacturing_cost, fact_pre_invoice_deductions, fact_sales_monthly with a **total row count of 9,71,631 rows.**

#### Description of each table is as follows:
- dim_customer: contains customer-related data
- dim_product: contains product-related data
- fact_gross_price: contains gross price information for each product
- fact_manufacturing_cost: contains the cost incurred in the production of each product
- fact_pre_invoice_deductions: contains pre-invoice deductions information for each product
- fact_sales_monthly: contains monthly sales data for each product.

![Image](Images/Screenshot%202024-08-13%20190821.png)

SQL Codes for the adhoc requests can be found [here](Adhoc_SQL_Codes)

# Executive Summary

#### Overview of Findings:

Executive Management put out adhoc requests to the analyst team to uncover insights of Sales performance of **Atilq Exclusive**, **New Products** in **2021**, **discounts** offered to **customers**. 

Identification of **Sales Channel Performance**, **Segment performance** and **Overall Sales Performance**.

![Image](Images/Screenshot%202024-08-16%20192407.png)
![Image](Images/Screenshot%202026-10-11%20184618.png)

# Insights based on 10 adhoc requests

1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

![Image](Images/Screenshot%202024-08-13%20192507.png) 

- **Management wants to figure out** which markets **Atliq Exclusive** stores are located in **APAC region**. 

2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg.

![Image](Images/Screenshot%202024-08-13%20193309.png)

- **89 new products** have been added in **2021** along with the existing products a **36.3% increase** in the number of **unique products.**

3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, segment product_count.

![Image](Images/Screenshot%202024-08-13%20194255.png)

- **Notebook**, **Accessories** and **Peripherals** segments have significant **increase** in **unique products.**

4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020 product_count_2021 difference.

![Image](Images/Screenshot%202024-08-13%20221959.png)

- **Accessories**, **Notebook** and **Peripherals** segments have significant **increase** in **unique products** compared to **Desktop, Storage and Networking.**

5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, product_code product manufacturing_cost.

![Image](Images/Screenshot%202024-08-16%20184735.png)

- **Highest** manufacturing cost is **240.5** and **lowest** is **0.89.**

6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields, customer_code, customer and average_discount_percentage.

![Image](Images/Screenshot%202024-08-16%20191253.png)

- **Flipkart, Viveks, Ezone, Croma and Amazon** have the **highest pre-invoice discount percentage** in **India** for **FY 2021.**

7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.The final report contains these columns: Month, Year and Gross sales Amount.

![Image](Images/Screenshot%202024-08-16%20192320.png)
![Image](Images/Screenshot%202024-08-16%20192335.png)

- **Q1 sales** in **FY2020 was the highest** and **March 2020** was **lowest** due to **Covid**. 
- **Q1 sales** in **FY2021** was again the **highest** and **significantlly more compared to FY2020.**

8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, Quarter and total_sold_quantity.

![Image](Images/Screenshot%202024-08-16%20202939.png)

- **Q1** of FY2020 **sold the most** with a **quantity of 7.01.**

9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields: channel, gross_sales_mln, percentage.

![Image](Images/Screenshot%202024-08-16%20205433.png)

- **Retailer** performed the best with **1924.17 M** in **gross sales** and **contributed 73.22% of overall sales.**

10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021.The final output contains these fields: division, product_code, product, total_sold_quantity, rank_order

![Image](Images/Screenshot%202024-08-16%20211441.png)

- **Network & Storage(N & S)** have the **highest sold quantity** **products** were **pendrives.**

# Recommendations:

**Based on the insights and findings above, we would recommend the Executive Management to consider the following:**

- **Atliq Exclusive stores** are located at **8** countries in **APAC region**, the **highest Gross Sales** was contributed by **India of 49.6% of total sales**, followed by **South Korea, Indonesia, Australia and Philiphines with combined contribution of 41.5%.**. Need to check with the **Sales heads** of  **Bangladesh, Newzealand and Japan** for the **low performance in Gross Sales.**    

![Image](Images/Screenshot%202026-10-10%20170538.png)

- **New products** increased to **36.3% in 2021** compared to **2020**, Out of these segments like **Notebook, Accessories and Peripherals have 82.87%** concentration with **Desktop, Storage and Networking** have the least of **17.13%**. 

  The **total sold quantity** is contributed by **Accessories, storage and peripherals** segment with **91.23%.** We see that there is **significant increase** in unique product for **Notebook segment** although it has least sold segment. Segments like **Notebook, Dekstop and Networking** have to be optimized.

![Image](Images/Screenshot%202026-10-10%20184513.png)

- **Flipkart, Viveks, Ezone, Croma and Amazon** were given an **highest average pre-invoice discount of 31.84%** in **India** market for the year **2021.** **Ezone, Viveks and Croma** **discounts** should be **verified** as their **contribution** towards **overall gross sales** in 2021 for India is about **5.23%.**

![Image](Images/Screenshot%202026-10-10%20231220.png)

- **Q1** is the **highest sales quarter** with **34.7 Million** in **2020** and **62.8 Million** in **2021** being the **festive season** of the year. **March 2020** was **lowest sales** accounted for **due to Covid.** **Alternate months** have **dip in sales** which requires attention.

![Image](Images/Screenshot%202024-08-16%20192407.png)

- **Direct** and **Distributor** channel have **contributed** about **15.47%** and **11.31%** have to be given **attention** and **improve** their **sales contribution.**

![Image](Images/Screenshot%202024-08-16%20205453.png)

- 