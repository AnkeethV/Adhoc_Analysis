# What is the percentage of unique product increase in 2021 vs. 2020? 

with count_2020 as (select
     count(distinct product_code) as unique_prod_count_2020
     from fact_sales_monthly
	 where fiscal_year=2020),     
count_2021 as (select
     count(distinct product_code) as unique_prod_count_2021
     from fact_sales_monthly
	 where fiscal_year=2021)
select unique_prod_count_2020,unique_prod_count_2021,
(unique_prod_count_2021-unique_prod_count_2020)*100/unique_prod_count_2020 as chg_pct
from count_2020,count_2021; 