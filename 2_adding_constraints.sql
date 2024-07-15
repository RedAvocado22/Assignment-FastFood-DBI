-- Manager table constraints
ALTER TABLE Manager 
ADD CONSTRAINT FK_Manager_Store FOREIGN KEY (StoreID) REFERENCES Store(StoreID);

ALTER TABLE Manager 
ADD CONSTRAINT CHK_Manager_PhoneNumber CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Manager 
ADD CONSTRAINT CHK_Manager_Email CHECK (Email LIKE '%@%.%');

ALTER TABLE Manager 
ADD CONSTRAINT CHK_Manager_Age CHECK (Age >= 18 AND Age <= 65);

-- Store table constraints
ALTER TABLE Store 
ADD CONSTRAINT FK_Store_Supplier FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);

ALTER TABLE Store 
ADD CONSTRAINT CHK_Store_PhoneNumber CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Store 
ADD CONSTRAINT CHK_Store_ZipCode CHECK (ZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]');

-- Employee table constraints
ALTER TABLE Employee 
ADD CONSTRAINT FK_Employee_Manager FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID);

ALTER TABLE Employee 
ADD CONSTRAINT FK_Employee_Store FOREIGN KEY (StoreID) REFERENCES Store(StoreID);

ALTER TABLE Employee 
ADD CONSTRAINT CHK_Employee_PhoneNumber CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Employee 
ADD CONSTRAINT CHK_Employee_Email CHECK (Email LIKE '%@%.%');

ALTER TABLE Employee 
ADD CONSTRAINT CHK_Employee_Age CHECK (Age >= 18 AND Age <= 65);

-- Relative table constraints
ALTER TABLE Relative 
ADD CONSTRAINT FK_Relative_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE Relative 
ADD CONSTRAINT CHK_Relative_PhoneNumber CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Relative 
ADD CONSTRAINT CHK_Relative_Email CHECK (Email LIKE '%@%.%');

ALTER TABLE Relative 
ADD CONSTRAINT CHK_Relative_Age CHECK (Age >= 0);

-- Order table constraints
ALTER TABLE [Order] 
ADD CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

ALTER TABLE [Order] 
ADD CONSTRAINT FK_Order_Store FOREIGN KEY (StoreID) REFERENCES Store(StoreID);

ALTER TABLE [Order] 
ADD CONSTRAINT CHK_Order_Dates CHECK (DateComplete >= DateOrder);

-- Customer table constraints
ALTER TABLE Customer 
	ADD CONSTRAINT CHK_Customer_PhoneNumber CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Customer 
ADD CONSTRAINT CHK_Customer_Age CHECK (Age >= 0);

-- OrderDetail table constraints
ALTER TABLE OrderDetail 
ADD CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderID) REFERENCES [Order](OrderID);

ALTER TABLE OrderDetail 
ADD CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

ALTER TABLE OrderDetail 
ADD CONSTRAINT CHK_OrderDetail_SalePrice CHECK (SalePrice >= 0);

ALTER TABLE OrderDetail 
ADD CONSTRAINT CHK_OrderDetail_Profit CHECK (Profit >= 0);

-- Product table constraints
ALTER TABLE Product 
ADD CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

ALTER TABLE Product 
ADD CONSTRAINT CHK_Product_Price CHECK (Price > 0);