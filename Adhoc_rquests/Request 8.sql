# In which quarter of 2020, got the maximum total_sold_quantity?

select 
    quarter, round(sum(sold_quantity)/1000000,2) as total_sold_quantity
    from fact_sales_monthly
    where fiscal_year=2020
    group by quarter
    order by total_sold_quantity desc;
