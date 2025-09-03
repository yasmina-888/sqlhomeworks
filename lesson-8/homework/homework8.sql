1. Total number of products available in each category:
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

2. Average price of products in the 'Electronics' category:
SELECT AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics';
3. List all customers from cities that start with 'L':

SELECT *
FROM Customers
WHERE City LIKE 'L%';
4. Get all product names that end with 'er':

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';
5. List all customers from countries ending in 'A':

SELECT *
FROM Customers
WHERE Country LIKE '%a';
6. Show the highest price among all products:

SELECT MAX(Price) AS HighestPrice
FROM Products;
7. Label stock as 'Low Stock' if quantity < 30, else 'Sufficient':

SELECT ProductName,
       Quantity,
       CASE 
           WHEN Quantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockStatus
FROM Products;
8. Find the total number of customers in each country:

SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
9. Find the minimum and maximum quantity ordered:

SELECT MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders;
 
 
 MEDIUM

 1. List customer IDs who placed orders in Jan 2023 but did NOT have invoices (using Orders and Invoices):
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate < '2023-02-01'
  AND o.CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Invoices)

2. Combine all product names from Products and Products_Discounted including duplicates:

SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
3. Combine all product names from Products and Products_Discounted without duplicates:

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
4. Find the average order amount by year (using Orders):
Assuming OrderAmount is a column in Orders:

SELECT YEAR(OrderDate) AS OrderYear, AVG(OrderAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate);
For databases that dont support YEAR(), use:
EXTRACT(YEAR FROM OrderDate)
5. Group products based on price into 'Low', 'Mid', 'High' (using Products):

SELECT ProductName,
       CASE 
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;
6. Pivot City_Population to show years (2012, 2013) as columns and copy to Population_Each_Year table (SQL Server syntax):

SELECT *INTO Population_Each_Year
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;
7. Find total sales per product ID (using Sales):

SELECT ProductID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
8. Find products that contain 'oo' in the name (using wildcard):

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';
9. Pivot City_Population to show cities (Bektemir, Chilonzor, Yakkasaroy) as columns and copy to Population_Each_City table (SQL Server syntax):

SELECT *INTO Population_Each_City
FROM (
    SELECT Year, City, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable

HARD

1. Top 3 customers with the highest total invoice amount (from Invoices):
SELECT TOP 3 CustomerID, SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC

2. Transform Population_Each_Year back to original format (City_Population) – using UNPIVOT (SQL Server):
SELECT City, [Year], Population
INTO City_Population
FROM (
    SELECT City, [2012], [2013]
    FROM Population_Each_Year
) AS SourceTable
UNPIVOT (
    Population FOR [Year] IN ([2012], [2013])
) AS UnpivotTable

3. List product names and the number of times each has been sold (using Products and Sales with JOIN):

Assuming:

Products.ProductID = Sales.ProductID

Each record in Sales represents one sale (or has a Quantity column)

SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName

4. Transform Population_Each_City back to original format (City_Population) – using UNPIVOT (SQL Server):
SELECT [Year], City, Population
INTO City_Population
FROM (
    SELECT [Year], Bektemir, Chilonzor, Yakkasaroy
    FROM Population_Each_City
) AS SourceTable
UNPIVOT (
    Population FOR City IN (Bektemir, Chilonzor, Yakkasaroy)
) AS UnpivotTable
