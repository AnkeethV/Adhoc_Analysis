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