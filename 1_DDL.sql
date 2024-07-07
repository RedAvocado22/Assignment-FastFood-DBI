USE Fast_Food_Store_Management_Assignment
GO

-- Table Store
CREATE TABLE Store (
    StoreID INT PRIMARY KEY,
    ZipCode NVARCHAR(20) NOT NULL,
    City NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    SupplierID INT,
);

-- Table Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    ManagerID INT,
    StoreID INT,
);

-- Table Relative
CREATE TABLE Relatives (
    RelativeID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    EmployeeID INT NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Age INT NOT NULL,
);

-- Table Manager
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    StoreID INT,
);

-- Table Supplier
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Location NVARCHAR(255) NOT NULL
);

-- Table Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(255)
);

-- Table Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
);

-- Table Order
CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY,
    DateOrder DATE NOT NULL,
    DateComplete DATE NOT NULL,
    Description NVARCHAR(255),
    CustomerID INT,
);

-- Table OrderDetail
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY,
    Quantity INT NOT NULL,
    SalePrice DECIMAL(10, 2) NOT NULL,
    Profit DECIMAL(10, 2) NOT NULL,
    OrderID INT,
    ProductID INT,
);

-- Table Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Description NVARCHAR(255) NOT NULL,
    Rank NVARCHAR(50),
);

-- Table Bill
CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Description NVARCHAR(255),
    Total DECIMAL(10, 2) NOT NULL,
    StoreID INT,
    CustomerID INT,
);

-- Add indexes
-- CREATE INDEX IX_Employee_Email ON Employee(Email);
-- CREATE INDEX IX_Employee_ManagerID ON Employee(ManagerID);
-- CREATE INDEX IX_Employee_StoreID ON Employee(StoreID);
-- CREATE INDEX IX_Product_CategoryID ON Product(CategoryID);
-- CREATE INDEX IX_Order_CustomerID ON [Order](CustomerID);
-- CREATE INDEX IX_OrderDetail_OrderID ON OrderDetail(OrderID);
-- CREATE INDEX IX_OrderDetail_ProductID ON OrderDetail(ProductID);