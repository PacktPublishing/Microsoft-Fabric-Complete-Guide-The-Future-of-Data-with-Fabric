SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create a view of the aisles Lakehouse table so it will be accessible from the default dataset
CREATE VIEW [dbo].[instacart_aisles]
AS
    SELECT * FROM [Groceries_lh].[dbo].[instacart_aisles]
GO