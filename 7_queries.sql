

USE Fast_Food_Store_Management_Assignment
GO

-- 1) === List all employees and information of the stores they work at (Inner Join) ===
SELECT 
    e.EmployeeID, e.Name AS EmployeeName, e.Email, e.PhoneNumber,
    s.StoreID, s.Location AS StoreLocation, s.City, s.ZipCode
FROM 
    Employee e
INNER JOIN 
    Store s ON e.StoreID = s.StoreID;

-- 2) === List customer names and their order counts (Left Join) ===
-- Sort by order count in ascending order
SELECT 
    c.CustomerID, c.Name AS CustomerName,
    COUNT(o.OrderID) AS OrderCount
FROM 
    Customer c
LEFT JOIN 
    [Order] o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.Name
ORDER BY 
    OrderCount ASC;

-- 3) === Display the list of stores and their respective managers (Right Join) ===
SELECT 
    s.StoreID, s.Location AS StoreLocation,
    m.ManagerID, m.Name AS ManagerName
FROM 
    Manager m
RIGHT JOIN 
    Store s ON m.StoreID = s.StoreID;

-- 4) === Top 3 most popular dishes ===
SELECT TOP 3
    p.ProductID, p.Name AS ProductName,
    COUNT(od.OrderDetailID) AS OrderCount
FROM 
    Product p
JOIN 
    OrderDetail od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    OrderCount DESC;

-- 5) === List dishes that have never been ordered ===
SELECT 
    p.ProductID, p.Name AS ProductName
FROM 
    Product p
LEFT JOIN 
    OrderDetail od ON p.ProductID = od.ProductID
WHERE 
    od.OrderDetailID IS NULL;

-- 6) === List products with total sales of 3 units or more ===
-- 6) === List products with total sales of 3 units or more ===
SELECT 
    p.ProductID, 
    p.Name AS ProductName,
    COUNT(od.OrderDetailID) AS TotalQuantitySold
FROM 
    Product p
JOIN 
    OrderDetail od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, p.Name
HAVING 
    COUNT(od.OrderDetailID) >= 3
ORDER BY 
    TotalQuantitySold DESC;

-- 7) === List products and their total sold quantities, sorted by total quantity in descending order ===
SELECT 
    p.ProductID, 
    p.Name AS ProductName,
    COUNT(od.OrderDetailID) AS TotalQuantitySold
FROM 
    Product p
LEFT JOIN 
    OrderDetail od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    TotalQuantitySold DESC;

-- 8) === Find products with prices between 10 and 20 dollars ===
SELECT 
    ProductID, Name AS ProductName, Price
FROM 
    Product
WHERE 
    Price BETWEEN 10 AND 20;

-- 9) === List orders placed after 2023-01-01 ===
SELECT 
    OrderID, CustomerID, DateOrder, Total
FROM 
    [Order]
WHERE 
    DateOrder > '2023-01-01'
ORDER BY 
    DateOrder;

-- 10) === Display the list of stores and their respective managers ===
SELECT 
    s.StoreID, s.Location AS StoreLocation,
    m.ManagerID, m.Name AS ManagerName
FROM 
    Store s
LEFT JOIN 
    Manager m ON s.StoreID = m.StoreID;

-- 11) === List products in the 'Drinks' category ===
SELECT 
    p.ProductID, p.Name AS ProductName, p.Price
FROM 
    Product p
JOIN 
    Category c ON p.CategoryID = c.CategoryID
WHERE 
    c.Name = 'Drinks';