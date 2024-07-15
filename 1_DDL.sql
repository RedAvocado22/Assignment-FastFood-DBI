USE Fast_Food_Store_Management_Assignment;
GO

-- Create Manager table
CREATE TABLE Manager
(
    ManagerID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(200) NOT NULL,
    StoreID INT NOT NULL
);

-- Create Store table
CREATE TABLE Store
(
    StoreID INT PRIMARY KEY NOT NULL,
    ZipCode VARCHAR(5) NOT NULL,
    City VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Location VARCHAR(200) NOT NULL,
    SupplierID INT NOT NULL
);

-- Create Employee table
CREATE TABLE Employee
(
    EmployeeID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(200) NOT NULL,
    ManagerID INT NOT NULL,
    StoreID INT NOT NULL
);

-- Create Relative table
CREATE TABLE Relative
(
    RelativeID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    EmployeeID INT NOT NULL
);

-- Create Supplier table
CREATE TABLE Supplier
(
    SupplierID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Location VARCHAR(200) NOT NULL
);

-- Create Order table
CREATE TABLE [Order]
(
    OrderID INT PRIMARY KEY NOT NULL,
    DateOrder DATE NOT NULL,
    DateComplete DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    CustomerID INT NOT NULL,
    StoreID INT NOT NULL
);

-- Create Customer table
CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    Age INT NOT NULL,
    Rank VARCHAR(20) NOT NULL
);

-- Create OrderDetail table
CREATE TABLE OrderDetail
(
    OrderDetailID INT PRIMARY KEY NOT NULL,
    SalePrice DECIMAL(10, 2) NOT NULL,
    Profit DECIMAL(10, 2) NOT NULL,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL
);

-- Create Product table
CREATE TABLE Product
(
    ProductID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CategoryID INT NOT NULL
);

-- Create Category table
CREATE TABLE Category
(
    CategoryID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL
);
