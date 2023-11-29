-- Create a DateDim table
CREATE TABLE DateDim (
    [PKey] INT,
    [Year] INT,
    [Date] DATE
)

-- Set the start and end dates
DECLARE @StartDate DATE = '2015-01-01'
DECLARE @EndDate DATE = '2022-12-31'
DECLARE @IncrementValue INT = 1;

-- Populate the date table
WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DateDim ([PKey], [Year], [Date])
    VALUES (@IncrementValue, YEAR(@StartDate), @StartDate)
    SET @StartDate = DATEADD(DAY, 1, @StartDate)
    SET @IncrementValue = @IncrementValue + 1;
END

-- Query the date table
SELECT DISTINCT YEAR([Date]) FROM DateDim ORDER BY YEAR([Date])

-- Drop the temporary table
-- DROP TABLE DateDim

