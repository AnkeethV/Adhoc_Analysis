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
