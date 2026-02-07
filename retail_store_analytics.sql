SELECT * FROM retail_sales;

-- 1. TOP CATEGORIES BY REVENUE
SELECT Category, FORMAT(SUM(NetAmount),2) AS TotalRevenue
FROM retail_sales
GROUP BY Category
ORDER BY SUM(NetAmount) DESC;

-- 2.DISCOUNT EFFECTIVENESS
SELECT DiscountFlag, COUNT(*) AS Transactions,
ROUND(AVG(NetAmount),2) AS AvgSpend,
ROUND(AVG(ItemRating),2) AS AvgRating
FROM retail_sales
GROUP BY DiscountFlag;

-- 3. CUSTOMER LOYALTY
SELECT CustomerType, COUNT(*) AS Orders,
ROUND(AVG(NetAmount),2) AS AvgSpend
FROM retail_sales
GROUP BY CustomerType;

-- 4. SEASONAL PERFORMANCE
SELECT Season, ROUND(SUM(NetAmount),2) AS SeasonalRevenue
FROM retail_sales
GROUP BY Season
ORDER BY SeasonalRevenue DESC;

-- 5. AGE GROUP SPENDING
SELECT AgeGroup, ROUND(SUM(NetAmount),2) AS AvgSpend
FROM retail_sales
GROUP BY AgeGroup
ORDER BY AvgSpend DESC;


-- 6.CREATING VIEWS FOR TABLEAU
-- CATEGORY REVENUE
CREATE VIEW category_revenue AS 
SELECT Category, SUM(NetAmount) AS Revenue
FROM retail_sales
GROUP BY Category;

SELECT * FROM category_revenue
ORDER BY revenue DESC;

-- SEASONAL REVENUE
CREATE VIEW seasonal_revenue AS
SELECT Season, SUM(NetAmount) AS Revenue
FROM retail_sales
GROUP BY Season;

SELECT * FROM seasonal_revenue
ORDER BY revenue DESC;

-- DISCOUNT PERFORMANCE
CREATE VIEW discount_performance AS
SELECT DiscountFlag,
COUNT(*) AS Transactions, 
AVG(NetAmount) AS AvgSpend,
AVG(ItemRating) AS AvgRating
FROM retail_sales
GROUP BY DiscountFlag;

SELECT * FROM discount_performance
ORDER BY AvgSpend DESC;