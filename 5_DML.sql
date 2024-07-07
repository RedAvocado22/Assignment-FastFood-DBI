USE Fast_Food_Store_Management_Assignment
GO

-- Data for Stores
INSERT INTO Store (StoreID, ZipCode, City, Address, PhoneNumber, Location, SupplierID) VALUES
(1, '12345', 'New York', '123 Main St', '1234567890', 'Downtown', 1),
(2, '54321', 'Los Angeles', '456 Elm St', '0987654321', 'Uptown', 2),
(3, '67890', 'Chicago', '789 Oak St', '1122334455', 'Midtown', 3);

-- Data for Suppliers
INSERT INTO Supplier (SupplierID, Name, Address, PhoneNumber, Location) VALUES
(1, 'Supplier A', '100 Supplier St', '1231231234', 'Location A'),
(2, 'Supplier B', '200 Supplier St', '2342342345', 'Location B'),
(3, 'Supplier C', '300 Supplier St', '3453453456', 'Location C');

-- Data for Managers
INSERT INTO Manager (ManagerID, Name, Email, PhoneNumber, Address, Age, StoreID) VALUES
(1, 'Alice Manager', 'alice.manager@example.com', '1111111111', '123 Manager St', 40, 1),
(2, 'Bob Manager', 'bob.manager@example.com', '2222222222', '456 Manager St', 45, 2),
(3, 'Carol Manager', 'carol.manager@example.com', '3333333333', '789 Manager St', 50, 3);

-- Data for Employees
INSERT INTO Employee (EmployeeID, Name, Email, PhoneNumber, Address, Age, ManagerID, StoreID) VALUES
(1, 'John Doe', 'john.doe@example.com', '4444444444', '123 Employee St', 30, 1, 1),
(2, 'Jane Smith', 'jane.smith@example.com', '5555555555', '456 Employee St', 25, 1, 1),
(3, 'Jim Brown', 'jim.brown@example.com', '6666666666', '789 Employee St', 35, 1, 1),
(4, 'Anna White', 'anna.white@example.com', '7777777777', '123 Employee Ave', 28, 2, 2),
(5, 'Paul Green', 'paul.green@example.com', '8888888888', '456 Employee Ave', 32, 2, 2),
(6, 'Mary Black', 'mary.black@example.com', '9999999999', '789 Employee Ave', 29, 2, 2),
(7, 'Tom Blue', 'tom.blue@example.com', '1010101010', '123 Employee Blvd', 33, 3, 3),
(8, 'Linda Yellow', 'linda.yellow@example.com', '1111111111', '456 Employee Blvd', 31, 3, 3),
(9, 'Chris Red', 'chris.red@example.com', '1212121212', '789 Employee Blvd', 34, 3, 3);

-- Data for Relatives
INSERT INTO Relatives (RelativeID, Name, EmployeeID, Email, PhoneNumber, Age) VALUES
(1, 'Relative 1', 1, 'relative1@example.com', '1313131313', 60),
(2, 'Relative 2', 2, 'relative2@example.com', '1414141414', 58),
(3, 'Relative 3', 3, 'relative3@example.com', '1515151515', 65),
(4, 'Relative 4', 4, 'relative4@example.com', '1616161616', 55),
(5, 'Relative 5', 5, 'relative5@example.com', '1717171717', 62),
(6, 'Relative 6', 6, 'relative6@example.com', '1818181818', 59),
(7, 'Relative 7', 7, 'relative7@example.com', '1919191919', 63),
(8, 'Relative 8', 8, 'relative8@example.com', '2020202020', 61),
(9, 'Relative 9', 9, 'relative9@example.com', '2121212121', 64);

-- Data for Categories
INSERT INTO Category (CategoryID, Name, Description) VALUES
(1, 'Burgers', 'Variety of burgers'),
(2, 'Pizzas', 'Different types of pizzas'),
(3, 'Tacos', 'Various kinds of tacos'),
(4, 'Drinks', 'Beverages'),
(5, 'Desserts', 'Sweet treats');

-- Data for Products
INSERT INTO Product (ProductID, Name, Price, CategoryID) VALUES
(1, 'Cheeseburger', 5.99, 1),
(2, 'Veggie Burger', 6.99, 1),
(3, 'Chicken Burger', 7.99, 1),
(4, 'Margherita Pizza', 8.99, 2),
(5, 'Pepperoni Pizza', 9.99, 2),
(6, 'BBQ Chicken Pizza', 10.99, 2),
(7, 'Beef Taco', 3.99, 3),
(8, 'Chicken Taco', 4.99, 3),
(9, 'Fish Taco', 5.99, 3),
(10, 'Soda', 1.99, 4),
(11, 'Juice', 2.99, 4),
(12, 'Milkshake', 3.99, 4),
(13, 'Ice Cream', 2.99, 5),
(14, 'Brownie', 3.49, 5),
(15, 'Cheesecake', 4.49, 5);

-- Data for Customers
INSERT INTO Customer (CustomerID, Name, PhoneNumber, Age, Description, Rank) VALUES
(1, 'Customer 1', '2233445566', 25, 'Frequent visitor', 'Regular'),
(2, 'Customer 2', '3344556677', 30, 'Regular customer', 'Regular'),
(3, 'Customer 3', '4455667788', 35, 'Occasional buyer', 'Regular'),
(4, 'Customer 4', '5566778899', 40, 'Loyal customer', 'Regular'),
(5, 'Customer 5', '6677889900', 45, 'New customer', 'Regular'),
(6, 'Customer 6', '7788990011', 25, 'Frequent visitor', 'Regular'),
(7, 'Customer 7', '8899001122', 30, 'Regular customer', 'Regular'),
(8, 'Customer 8', '9900112233', 35, 'Occasional buyer', 'Regular'),
(9, 'Customer 9', '0011223344', 40, 'Loyal customer', 'Regular'),
(10, 'Customer 10', '1122334455', 45, 'New customer', 'Regular'),
(11, 'Customer 11', '2233445567', 25, 'Frequent visitor', 'Regular'),
(12, 'Customer 12', '3344556678', 30, 'Regular customer', 'Regular'),
(13, 'Customer 13', '4455667789', 35, 'Occasional buyer', 'Regular'),
(14, 'Customer 14', '5566778890', 40, 'Loyal customer','Regular'),
(15, 'Customer 15', '6677889901', 45, 'New customer', 'Regular');

-- Data for Orders
INSERT INTO [Order] (OrderID, DateOrder, DateComplete, Description, CustomerID) VALUES
(1, '2024-01-01', '2024-01-01', 'First order', 1),
(2, '2024-01-02', '2024-01-02', 'Second order', 2),
(3, '2024-01-03', '2024-01-03', 'Third order', 3),
(4, '2024-01-04', '2024-01-04', 'Fourth order', 4),
(5, '2024-01-05', '2024-01-05', 'Fifth order', 5),
(6, '2024-01-06', '2024-01-06', 'Sixth order', 6),
(7, '2024-01-07', '2024-01-07', 'Seventh order', 7),
(8, '2024-01-08', '2024-01-08', 'Eighth order', 8),
(9, '2024-01-09', '2024-01-09', 'Ninth order', 9),
(10, '2024-01-10', '2024-01-10', 'Tenth order', 10),
(11, '2024-01-11', '2024-01-11', 'Eleventh order', 11);

INSERT INTO OrderDetail (OrderDetailID, Quantity, SalePrice, Profit, OrderID, ProductID) VALUES
(1, 2, 11.98, 2.00, 1, 1),   -- Cheeseburger
(2, 1, 6.99, 1.50, 1, 2),    -- Veggie Burger
(3, 3, 29.97, 5.00, 2, 4),   -- Margherita Pizza
(4, 2, 19.98, 3.50, 2, 5),   -- Pepperoni Pizza
(5, 1, 10.99, 2.00, 3, 6),   -- BBQ Chicken Pizza
(6, 1, 3.99, 1.00, 3, 7),    -- Beef Taco
(7, 2, 7.98, 1.50, 4, 8),    -- Chicken Taco
(8, 1, 5.99, 1.50, 4, 9),    -- Fish Taco
(9, 2, 3.98, 0.50, 5, 10),   -- Soda
(10, 1, 2.99, 0.75, 5, 11),  -- Juice
(11, 1, 3.99, 1.00, 6, 12),  -- Milkshake
(12, 1, 2.99, 0.50, 6, 13),  -- Ice Cream
(13, 2, 6.98, 1.50, 7, 14),  -- Brownie
(14, 1, 4.49, 1.00, 7, 15),  -- Cheesecake
(15, 1, 5.99, 1.50, 8, 3),   -- Chicken Burger
(16, 1, 3.99, 1.00, 8, 7),   -- Beef Taco
(17, 2, 9.98, 2.00, 9, 9),   -- Fish Taco
(18, 1, 1.99, 0.50, 9, 10),  -- Soda
(19, 3, 8.97, 2.00, 10, 11), -- Juice
(20, 1, 3.99, 1.00, 10, 12), -- Milkshake
(21, 2, 6.98, 1.50, 11, 13), -- Ice Cream
(22, 1, 2.99, 0.50, 11, 14); -- Brownie


INSERT INTO Bill (BillID, Date, Description, Total, StoreID, CustomerID) VALUES
(1, '2024-01-01', 'Bill for first order', 18.97, 1, 1),
(2, '2024-01-02', 'Bill for second order', 43.95, 2, 2),
(3, '2024-01-03', 'Bill for third order', 16.98, 3, 3),
(4, '2024-01-04', 'Bill for fourth order', 12.97, 1, 4),
(5, '2024-01-05', 'Bill for fifth order', 17.95, 2, 5),
(6, '2024-01-06', 'Bill for sixth order', 9.97, 3, 6),
(7, '2024-01-07', 'Bill for seventh order', 4.49, 1, 7),
(8, '2024-01-08', 'Bill for eighth order', 9.98, 2, 8),
(9, '2024-01-09', 'Bill for ninth order', 13.98, 3, 9),
(10, '2024-01-10', 'Bill for tenth order', 1.99, 1, 10),
(11, '2024-01-11', 'Bill for eleventh order', 8.97, 2, 11);