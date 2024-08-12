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