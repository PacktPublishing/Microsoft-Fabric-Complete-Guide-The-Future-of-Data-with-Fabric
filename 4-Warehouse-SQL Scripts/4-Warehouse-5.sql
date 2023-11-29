SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create a view of the order_products_prior Lakehouse table so it will be accessible from the default dataset
CREATE VIEW [dbo].[instacart_order_products_prior]
AS
    SELECT * FROM [Groceries_lh].[dbo].[instacart_order_products_prior]
GO