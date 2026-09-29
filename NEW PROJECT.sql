CREATE DATABASE  ecommerce_analytics;
USE ecommerce_analytics;
CREATE TABLE ecommerce_sales (
    Order_ID VARCHAR(100),
    Order_Date DATE,
    Customer_ID VARCHAR(100),
    Customer_Name CHAR(100),
    Country CHAR(50),
    Region CHAR(50),
    City CHAR(100),
    Product CHAR(100),
    Category CHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10 , 2 ),
    Discount DECIMAL(5 , 2 ),
    Sales DECIMAL(10 , 2 ),
    Profit DECIMAL(10 , 2 ),
    Payment_Method CHAR(100),
    Customer_Segment CHAR(50),
    Shipping_Method CHAR(50),
    Customer_Satisfaction INT,
    Year INT,
    Month INT,
    Month_Name CHAR(60)
);
SELECT 
    *
FROM
    ecommerce_sales;
SELECT 
    COUNT(Order_ID) AS TOTAL_ORDERS
FROM
    ecommerce_sales;
SELECT 
    SUM(Sales) AS TOTAL_SALES
FROM
    ecommerce_sales;
SELECT 
    SUM(Profit) AS TOTAL_PROFIT
FROM
    ecommerce_sales;
SELECT 
    AVG(Sales) AS TOTAL_AVERAGE
FROM
    ecommerce_sales;
SELECT 
    SUM(Quantity) AS TOTAL_QUANTITY
FROM
    ecommerce_sales;
SELECT 
    Region, SUM(Sales) AS TOTAL_SALES
FROM
    ecommerce_sales
GROUP BY Region
ORDER BY TOTAL_SALES DESC;
SELECT 
    Region, SUM(Profit) AS TOTAL_PROFIT
FROM
    ecommerce_sales
GROUP BY Region
ORDER BY TOTAL_PROFIT DESC;
SELECT 
    Region, COUNT(*) AS TOTAL_ORDERS
FROM
    ecommerce_sales
GROUP BY Region
ORDER BY TOTAL_ORDERS DESC;
SELECT 
    Category, SUM(Sales) AS TOTAL_SALES
FROM
    ecommerce_sales
GROUP BY Category
ORDER BY TOTAL_SALES DESC;
SELECT 
    Category, SUM(Profit) AS TOTAL_PROFIT
FROM
    ecommerce_sales
GROUP BY Category
ORDER BY TOTAL_PROFIT DESC;
SELECT 
    Category, SUM(Quantity) AS TOTAL_QUANTITY
FROM
    ecommerce_sales
GROUP BY Category
ORDER BY TOTAL_QUANTITY DESC;
SELECT 
    Product, SUM(Sales) AS TOTAL_SALES
FROM
    ecommerce_sales
GROUP BY Product
ORDER BY TOTAL_SALES DESC;
SELECT 
    Product, SUM(Profit) AS TOTAL_PROFIT
FROM
    ecommerce_sales
GROUP BY Product
ORDER BY TOTAL_PROFIT DESC;
SELECT 
    Product,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM ecommerce_sales
GROUP BY Product;
SELECT 
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) * 100 / NULLIF(SUM(Sales), 0),2)AS Profit_Margin
FROM
    ecommerce_sales
GROUP BY Product
ORDER BY Profit_Margin DESC;







