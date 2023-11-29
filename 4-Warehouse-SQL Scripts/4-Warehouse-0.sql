select count(*)
from [Groceries_wh].[dbo].[instacart_products]

select [a].[aisle], count([p].[product_name]) as product_count
from [Groceries_wh].[dbo].[instacart_products] [p]
    inner join [Groceries_lh].[dbo].[instacart_aisles] [a] on [p].[aisle_id] = [a].[aisle_id]
group by [a].[aisle],[p].[product_name]
order by count([p].[product_name]) asc

select top 100 * from [Groceries_lh].[dbo].[instacart_aisles]
select top 100 * from [Groceries_lh].[dbo].[instacart_order_products_prior]
select top 100 * from [Groceries_lh].[dbo].[instacart_order_products_train]
select top 100 * from [Groceries_lh].[dbo].[instacart_orders]
select top 100 * from [Groceries_wh].[dbo].[instacart_departments]