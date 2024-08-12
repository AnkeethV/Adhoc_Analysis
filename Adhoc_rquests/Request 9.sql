# Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

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