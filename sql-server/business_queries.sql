-- 1. Top 10 Kunden
SELECT TOP 10 CustomerID, AccountNumber
FROM Sales.Customer;

-- 2. Bestverkaufte Produkte
SELECT TOP 10 ProductID, SUM(OrderQty) AS TotalSold
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalSold DESC;

-- 3. Umsatz pro Monat
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(TotalDue) AS Revenue
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- 4. Durchschnittlicher Bestellwert
SELECT AVG(TotalDue) AS AvgOrderValue
FROM Sales.SalesOrderHeader;

-- 5. Anzahl Bestellungen pro Kunde
SELECT CustomerID, COUNT(*) AS Orders
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY Orders DESC;
