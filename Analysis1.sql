SELECT * FROM LITA_Capstone_New 

-- Renaming column to specify currency context
-- This helps clarify that revenue values are in Nigerian Naira (₦)
EXEC sp_rename 'LITA_Capstone_New.UnitPrice', 'UnitPrice_NGN', 'COLUMN'

-- Filtering both years to Jan–Aug for fair comparison
-- 2024 has data only for 8 months; 2023 is trimmed to match
SELECT *
INTO #FILTERED_SDATA
FROM [dbo].[LITA_Capstone_New]
WHERE MONTH(OrderDate) BETWEEN	1 and 8

SELECT * FROM #FILTERED_SDATA

-- Converting the data types of Quantity and UnitPrice from SMALLINT to INT to accommodate larger values in the Revenue column.
ALTER TABLE #FILTERED_SDATA
	ALTER COLUMN Quantity INT not null

ALTER TABLE #FILTERED_SDATA
	ALTER COLUMN UnitPrice_NGN INT not null

-- Adding derived columns to enhance analysis:
-- Revenue (calculated as Quantity * UnitPrice),
-- OrderYear (extracted from OrderDate),
-- OrderMonth (extracted from OrderDate)
ALTER TABLE #FILTERED_SDATA
	ADD Revenue_NGN INT

UPDATE #FILTERED_SDATA
	SET Revenue_NGN = Quantity * UnitPrice_NGN

ALTER TABLE #FILTERED_SDATA
	ADD OrderYear INT

UPDATE #FILTERED_SDATA
	SET OrderYear = YEAR(OrderDate)

ALTER TABLE #FILTERED_SDATA
	ADD OrderMonth INT

UPDATE #FILTERED_SDATA
	SET OrderMonth = Month(OrderDate)

SELECT * FROM #FILTERED_SDATA

--------------- UNIVARIATE ANALYSIS
---- Calculating Total Quantity Sold
SELECT SUM(Quantity) AS TotalQuantity
FROM #FILTERED_SDATA

---- Calculating Total Revenue
SELECT SUM(Revenue_NGN) AS TotalRevenue_NGN
FROM #FILTERED_SDATA


--------------- TIME-BASED ANALYSIS
-- In this section, we calculate the revenue generated and quantity sold by Year, Quarter, and Month for the years (Jan. to Aug.)

---- Quantity Sold By Year
SELECT 
	CASE 
		WHEN OrderYear = '2023' THEN 2023 ELSE 2024 
	END AS Sales_Year,
	SUM(Quantity) AS TotalQuantitySold
FROM #FILTERED_SDATA
GROUP BY 
	CASE 
		WHEN OrderYear = '2023' THEN 2023 ELSE 2024 
	END

---- Revenue By Year
SELECT 
	CASE 
		WHEN OrderYear = '2023' THEN 2023 ELSE 2024 
	END AS Sales_Year,
	SUM(Revenue_NGN) AS TotalRevenue_NGN
FROM #FILTERED_SDATA
GROUP BY 
	CASE 
		WHEN OrderYear = '2023' THEN 2023 ELSE 2024 
	END

---- Quantity Sold By Quarter
WITH SalesData AS (
    SELECT 
        OrderYear,
        CASE 
            WHEN OrderMonth BETWEEN 1 AND 3 THEN 'Q1'
            WHEN OrderMonth BETWEEN 4 AND 6 THEN 'Q2'
            ELSE 'Q3'
        END AS Quarter,
        Quantity
    FROM #FILTERED_SDATA
)
SELECT
    Quarter,
    SUM(CASE WHEN OrderYear = '2023' THEN Quantity ELSE 0 END) AS QuantitySold2023,
    SUM(CASE WHEN OrderYear = '2024' THEN Quantity ELSE NULL END) AS QuantitySold2024 
FROM SalesData
GROUP BY Quarter
ORDER BY Quarter

---- Revenue By Quarter
WITH SalesData AS (
    SELECT 
        OrderYear,
        CASE 
            WHEN OrderMonth BETWEEN 1 AND 3 THEN 'Q1'
            WHEN OrderMonth BETWEEN 4 AND 6 THEN 'Q2'
            ELSE 'Q3'
        END AS Quarter,
        Revenue_NGN
    FROM #FILTERED_SDATA
)
SELECT
    Quarter,
    SUM(CASE WHEN OrderYear = '2023' THEN Revenue_NGN ELSE 0 END) AS Revenue_NGN2023,
    SUM(CASE WHEN OrderYear = '2024' THEN Revenue_NGN ELSE NULL END) AS Revenue_NGN2024 
FROM SalesData
GROUP BY Quarter
ORDER BY Quarter

---- Quantity Sold By Month
WITH Year2023 AS (
	SELECT OrderMonth, SUM(Quantity) AS MonthlyQuantitySold2023
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2023'
	GROUP BY OrderMonth 
	),
Year2024 AS (
	SELECT OrderMonth, SUM(Quantity) AS MonthlyQuantitySold2024
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2024'
	GROUP BY OrderMonth
	)
SELECT 
	f.OrderMonth, f.MonthlyQuantitySold2023, s.MonthlyQuantitySold2024
FROM Year2023 AS f
LEFT JOIN Year2024 AS s
ON f.OrderMonth = s.OrderMonth
ORDER BY f.OrderMonth

---- Revenue By Month
WITH Year2023 AS (
	SELECT OrderMonth, SUM(Revenue_NGN) AS MonthlyRevenue_NGN2023
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2023'
	GROUP BY OrderMonth 
	),
Year2024 AS (
	SELECT OrderMonth, SUM(Revenue_NGN) AS MonthlyRevenue_NGN2024
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2024'
	GROUP BY OrderMonth
	)
SELECT 
	f.OrderMonth, f.MonthlyRevenue_NGN2023, s.MonthlyRevenue_NGN2024
FROM Year2023 AS f
LEFT JOIN Year2024 AS s
ON f.OrderMonth = s.OrderMonth
ORDER BY f.OrderMonth


--------------- PRODUCT ANALYSIS
-- An analysis of the products is done in this section to know the quantities of the products sold and the revenue generated.

-- We want to calculate the total quantity sold and total revenue generated for the products in the years (January to August)
WITH Revenue_Generated AS (
	SELECT 
		Product, 
		SUM(Revenue_NGN) AS TotalRevenue_NGN
	FROM #FILTERED_SDATA
	GROUP BY Product),
QuantitySold AS (
	SELECT 
		Product,
		SUM(Quantity) AS QuantitySold
	FROM #FILTERED_SDATA
	GROUP BY Product)
SELECT r.Product, q.QuantitySold, r.TotalRevenue_NGN
FROM Revenue_Generated as r
JOIN QuantitySold as q
ON r.Product = q.Product
ORDER BY r.TotalRevenue_NGN DESC


-- We want to calculate in this section the quantities sold and generated revenue per year.
WITH Product_Data2023 AS (
	SELECT Product, SUM(Quantity) AS Quantity_Sold2023, SUM(Revenue_NGN) AS GeneratedRevenue_NGN2023
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2023'
	GROUP BY Product
	),
Product_Data2024 AS (
	SELECT Product, SUM(Quantity) AS Quantity_Sold2024, SUM(Revenue_NGN) AS GeneratedRevenue_NGN2024
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2024'
	GROUP BY Product
	)
SELECT f.Product, f.Quantity_Sold2023, s.Quantity_Sold2024, f.GeneratedRevenue_NGN2023, s.GeneratedRevenue_NGN2024
FROM Product_Data2023 AS f
JOIN Product_Data2024 AS s
ON f.Product = s.Product
ORDER BY GeneratedRevenue_NGN2024 DESC

select Distinct UnitPrice, OrderDate, sum(Quantity), sum(Revenue)
FROM LITA_Capstone
Where Product = 'Socks' 
Group by OrderDate, UnitPrice


--------------- REGIONAL ANALYSIS
WITH RegionalRevenue_NGN AS (
	SELECT Region, SUM(Revenue_NGN) AS GeneratedRevenue_NGN
	FROM #FILTERED_SDATA
	GROUP BY Region
	),
Regional_Quantity AS (
	SELECT Region, SUM(Quantity) AS QuantitySold
	FROM #FILTERED_SDATA
	GROUP BY Region
	)
SELECT r.Region, q.QuantitySold, r.GeneratedRevenue_NGN
FROM RegionalRevenue_NGN AS r
JOIN Regional_Quantity AS q
ON r.Region = q.Region
ORDER BY r.GeneratedRevenue_NGN DESC

-- In this section we calculate the Quantity Sold, Average Quantity Sold, Generated Revenue and Average Revenue for the Regions Over the two sales years (2023 - 2024).
WITH Regional_Data2023 AS (
	SELECT Region, SUM(Quantity) AS QuantitySold2023, AVG(Quantity) AS AverageQuantity2023, 
		SUM(Revenue_NGN) AS GeneratedRevenue_NGN2023, AVG(Revenue_NGN) AS AverageRevenue_NGN2023
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2023'
	GROUP BY Region
	),
Regional_Data2024 AS (
	SELECT Region, SUM(Quantity) AS QuantitySold2024, AVG(Quantity) AS AverageQuantity2024, 
		SUM(Revenue_NGN) AS GeneratedRevenue_NGN2024, AVG(Revenue_NGN) AS AverageRevenue_NGN2024
	FROM #FILTERED_SDATA
	WHERE OrderYear = '2024'
	GROUP BY Region
	)
SELECT f.Region, f.QuantitySold2023, AverageQuantity2023, s.QuantitySold2024, AverageQuantity2024, f.GeneratedRevenue_NGN2023, 
	   f.AverageRevenue_NGN2023, s.GeneratedRevenue_NGN2024, s.AverageRevenue_NGN2024
FROM Regional_Data2023 AS f
JOIN Regional_Data2024 AS s
ON f.Region = s.Region
ORDER BY GeneratedRevenue_NGN2024 DESC


