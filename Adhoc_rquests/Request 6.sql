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
