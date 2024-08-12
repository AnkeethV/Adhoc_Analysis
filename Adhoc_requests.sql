# Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

select 
     distinct market from dim_customer
     where customer="Atliq Exclusive" and region="APAC";
     
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

# Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. 

select
	segment, count(distinct product_code) as product_count
    from dim_product
    group by segment
    order by product_count desc;
    
# Which segment had the most increase in unique products in 2021 vs 2020? 

with product_cnt_2020 as (select
    p.segment as A, count(distinct s.product_code) as product_count_2020
    from dim_product p
    join fact_sales_monthly s
    on p.product_code = s.product_code
    where fiscal_year=2020
    group by p.segment,s.fiscal_year),
product_cnt_2021 as (select
    p.segment as B, count(distinct s.product_code) as product_count_2021
    from dim_product p
    join fact_sales_monthly s
    on p.product_code = s.product_code
    where fiscal_year=2021
    group by p.segment,s.fiscal_year)
select
product_cnt_2020.A as segment, product_count_2020, product_count_2021,
(product_count_2021-product_count_2020) as difference
from product_cnt_2020,product_cnt_2021
where product_cnt_2020.A=product_cnt_2021.B;

# Get the products that have the highest and lowest manufacturing costs.

select
	c.product_code, p.product, c.manufacturing_cost
    from dim_product p
    join fact_manufacturing_cost c
    on p.product_code = c.product_code
    where manufacturing_cost
    in (
        select max(manufacturing_cost) from fact_manufacturing_cost
        union
        select min(manufacturing_cost) from fact_manufacturing_cost
       )
    order by manufacturing_cost desc;   

# Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.

select
     c.customer_code, c.customer, round(avg(pre_invoice_discount_pct),4) as average_discount_percentage
     from fact_pre_invoice_deductions d
     join dim_customer c
     on d.customer_code=c.customer_code
     where fiscal_year=2021 and market="India"
     group by c.customer_code, c.customer
     order by average_discount_percentage desc
     limit 5;
     
# Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . This analysis helps to get an idea of low and high-performing months and take strategic decisions.     

select 
	concat(monthname(s.date),'(',Year(s.date),')') as 'Month', s.fiscal_year,
    round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_amount
    from fact_sales_monthly s
    join dim_customer c
    on s.customer_code=c.customer_code
    join fact_gross_price g
    on s.product_code=g.product_code
    where c.customer="Atliq Exclusive"
    group by Month, s.fiscal_year
    order by s.fiscal_year;
    
# In which quarter of 2020, got the maximum total_sold_quantity?

select 
    quarter, round(sum(sold_quantity)/1000000,2) as total_sold_quantity
    from fact_sales_monthly
    where fiscal_year=2020
    group by quarter
    order by total_sold_quantity desc;
    
# Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

select 
    c.channel,
    round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mln,
    (round(sum(g.gross_price*s.sold_quantity)/1000000,2)/(select sum(g.gross_price*s.sold_quantity)/1000000 from fact_sales_monthly s join fact_gross_price g
    on s.product_code=g.product_code where s.fiscal_year=2021)*100) as precentage
    from fact_sales_monthly s
    join dim_customer c 
    on s.customer_code=c.customer_code
    join fact_gross_price g
    on s.product_code=g.product_code
    where s.fiscal_year=2021
    group by c.channel
    order by gross_sales_mln desc;

With Output as(
select 
    c.channel,
    round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mln
    from fact_sales_monthly s
    join dim_customer c 
    on s.customer_code=c.customer_code
    join fact_gross_price g
    on s.product_code=g.product_code
    where s.fiscal_year=2021
    group by c.channel
)
select 
    channel, gross_sales_mln, round(gross_sales_mln*100/total,2) as percentage
from
(
(select sum(gross_sales_mln) as total from Output) A,
(select * from Output) B
)
order by percentage desc;   

# Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?

with A as(
select
    p.division, p.product_code, p.product,
    sum(s.sold_quantity) as total_quantity
    from fact_sales_monthly s
    join dim_product p
    on s.product_code=p.product_code
    where fiscal_year=2021
    group by p.division,p.product_code,p.product
),
B as(
select *,
dense_rank() over(partition by division order by total_quantity desc) as rank_order
from A)
select * from B where rank_order<=3;
      

