-- Create a persistent sql table from the Lakehouse with a Date Key column
create table [dbo].[instacart_orders] AS
select 
    [o].[order_id],
    [o].[user_id],
    [o].[eval_set],
    [o].[order_number],
    [o].[order_dow],
    [o].[order_hour_of_day],
    [o].[days_since_prior_order],
    [d].[PKey] AS [date_key]
from
    (select *,
        DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '01/01/2015', '12/31/2022'), '01/01/2015') AS OrderDate,
        DATEADD(HOUR, CAST([order_hour_of_day] AS INT), DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '01/01/2015', '12/31/2022'), '01/01/2015')) AS OrderDateTime
    from [Groceries_lh].[dbo].[instacart_orders]) [o]
         inner join [DateDim] [d] on [o].[OrderDate] = [d].[Date]
