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
