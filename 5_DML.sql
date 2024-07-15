USE Fast_Food_Store_Management_Assignment
GO

-- RUN ONE BY ONE INSERT.

-- Data for Suppliers
INSERT INTO Supplier 
	(SupplierID, Name, PhoneNumber, Location) 
VALUES
	(1, 'Supplier A', '1231231234', 'Location A'),
	(2, 'Supplier B', '2342342345', 'Location B'),
	(3, 'Supplier C', '3453453456', 'Location C');

-- Data for Stores
INSERT INTO Store 
	(StoreID, ZipCode, City, PhoneNumber, Location, SupplierID) 
VALUES
	(1, '12345', 'New York', '1234567890', 'Downtown', 1),
	(2, '54321', 'Los Angeles', '0987654321', 'Uptown', 2),
	(3, '67890', 'Chicago', '1122334455', 'Midtown', 3);

-- Data for Managers
INSERT INTO 
	Manager (ManagerID, Name, Email, PhoneNumber, Age, Address, StoreID) 
VALUES
	(1, 'Alice Manager', 'alice.manager@example.com', '1111111111', 40, '123 Manager St', 1),
	(2, 'Bob Manager', 'bob.manager@example.com', '2222222222', 45, '456 Manager St', 2),
	(3, 'Carol Manager', 'carol.manager@example.com', '3333333333', 50, '789 Manager St', 3);

-- Data for Employees
INSERT INTO Employee 
	(EmployeeID, Name, Email, PhoneNumber, Age, Address, ManagerID, StoreID) 
VALUES
	(1, 'John Doe', 'john.doe@example.com', '4444444444', 30, '123 Employee St', 1, 1),
	(2, 'Jane Smith', 'jane.smith@example.com', '5555555555', 25, '456 Employee St', 1, 1),
	(3, 'Jim Brown', 'jim.brown@example.com', '6666666666', 35, '789 Employee St', 1, 1),
	(4, 'Anna White', 'anna.white@example.com', '7777777777', 28, '123 Employee Ave', 2, 2),
	(5, 'Paul Green', 'paul.green@example.com', '8888888888', 32, '456 Employee Ave', 2, 2),
	(6, 'Mary Black', 'mary.black@example.com', '9999999999', 29, '789 Employee Ave', 2, 2),
	(7, 'Tom Blue', 'tom.blue@example.com', '1010101010', 33, '123 Employee Blvd', 3, 3),
	(8, 'Linda Yellow', 'linda.yellow@example.com', '1111111111', 31, '456 Employee Blvd', 3, 3),
	(9, 'Chris Red', 'chris.red@example.com', '1212121212', 34, '789 Employee Blvd', 3, 3);

-- Data for Relatives
INSERT INTO Relative 
	(RelativeID, Name, EmployeeID, Email, PhoneNumber, Age) 
VALUES
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
INSERT INTO Category 
	(CategoryID, Name, Description) 
VALUES
	(1, 'Burgers', 'Variety of burgers'),
	(2, 'Pizzas', 'Different types of pizzas'),
	(3, 'Tacos', 'Various kinds of tacos'),
	(4, 'Drinks', 'Beverages'),
	(5, 'Desserts', 'Sweet treats');

-- Data for Products
INSERT INTO Product 
	(ProductID, Name, Description, Price, Quantity, CategoryID) 
VALUES
	(1, 'Cheeseburger', 'Classic cheeseburger', 5.99, 100, 1),
	(2, 'Veggie Burger', 'Vegetarian burger', 6.99, 80, 1),
	(3, 'Chicken Burger', 'Grilled chicken burger', 7.99, 90, 1),
	(4, 'Margherita Pizza', 'Classic Margherita', 8.99, 50, 2),
	(5, 'Pepperoni Pizza', 'Pepperoni topped pizza', 9.99, 60, 2),
	(6, 'BBQ Chicken Pizza', 'BBQ chicken topped pizza', 10.99, 40, 2),
	(7, 'Beef Taco', 'Beef filled taco', 3.99, 120, 3),
	(8, 'Chicken Taco', 'Chicken filled taco', 4.99, 100, 3),
	(9, 'Fish Taco', 'Fish filled taco', 5.99, 80, 3),
	(10, 'Soda', 'Carbonated drink', 1.99, 200, 4),
	(11, 'Juice', 'Fresh fruit juice', 2.99, 150, 4),
	(12, 'Milkshake', 'Creamy milkshake', 3.99, 100, 4),
	(13, 'Ice Cream', 'Vanilla ice cream', 2.99, 120, 5),
	(14, 'Brownie', 'Chocolate brownie', 3.49, 90, 5),
	(15, 'Cheesecake', 'New York style cheesecake', 4.49, 70, 5);

-- Data for Customers
INSERT INTO Customer 
	(CustomerID, Name, PhoneNumber, Age, Description, Rank) 
VALUES
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
	(14, 'Customer 14', '5566778890', 40, 'Loyal customer', 'Regular'),
	(15, 'Customer 15', '6677889901', 45, 'New customer', 'Regular');

-- Data for Orders
INSERT INTO [Order] 
	(OrderID, DateOrder, DateComplete, Total, Description, CustomerID, StoreID) 
VALUES
	(1, '2024-01-01', '2024-01-01', 15.97, 'First order', 1, 1),
	(2, '2024-01-02', '2024-01-02', 20.98, 'Second order', 2, 2),
	(3, '2024-01-03', '2024-01-03', 25.97, 'Third order', 3, 3),
	(4, '2024-01-04', '2024-01-04', 18.99, 'Fourth order', 4, 1),
	(5, '2024-01-05', '2024-01-05', 22.97, 'Fifth order', 5, 2),
	(6, '2024-01-06', '2024-01-06', 14.99, 'Sixth order', 6, 3),
	(7, '2024-01-07', '2024-01-07', 19.98, 'Seventh order', 7, 1),
	(8, '2024-01-08', '2024-01-08', 24.97, 'Eighth order', 8, 2),
	(9, '2024-01-09', '2024-01-09', 16.99, 'Ninth order', 9, 3),
	(10, '2024-01-10', '2024-01-10', 21.98, 'Tenth order', 10, 1),
	(11, '2024-01-11', '2024-01-11', 23.97, 'Eleventh order', 11, 2),
	(12, '2024-01-12', '2024-01-12', 55.97, 'Twelfth order', 2, 3),
	(13, '2024-01-13', '2024-01-13', 60.99, 'Thirteenth order', 3, 1),
	(14, '2024-01-14', '2024-01-14', 65.97, 'Fourteenth order', 4, 2),
	(15, '2024-01-15', '2024-01-15', 70.98, 'Fifteenth order', 5, 3),
	(16, '2024-01-16', '2024-01-16', 75.99, 'Sixteenth order', 1, 1),
	(17, '2024-01-17', '2024-01-17', 80.97, 'Seventeenth order', 2, 2),
	(18, '2024-01-18', '2024-01-18', 85.98, 'Eighteenth order', 3, 3),
	(19, '2024-01-19', '2024-01-19', 90.99, 'Nineteenth order', 4, 1),
	(20, '2024-01-20', '2024-01-20', 95.97, 'Twentieth order', 5, 2);

-- Data for OrderDetails
INSERT INTO OrderDetail 
	(OrderDetailID, SalePrice, Profit, OrderID, ProductID) 
VALUES
	(1, 5.99, 2.00, 1, 1),   -- Cheeseburger
	(2, 6.99, 2.50, 1, 2),   -- Veggie Burger
	(3, 2.99, 1.00, 1, 11),  -- Juice
	(4, 8.99, 3.00, 2, 4),   -- Margherita Pizza
	(5, 9.99, 3.50, 2, 5),   -- Pepperoni Pizza
	(6, 1.99, 0.50, 2, 10),  -- Soda
	(7, 10.99, 4.00, 3, 6),  -- BBQ Chicken Pizza
	(8, 7.99, 3.00, 3, 3),   -- Chicken Burger
	(9, 6.99, 2.50, 3, 2),   -- Veggie Burger
	(10, 3.99, 1.50, 4, 7),  -- Beef Taco
	(11, 4.99, 2.00, 4, 8),  -- Chicken Taco
	(12, 9.99, 3.50, 4, 5),  -- Pepperoni Pizza
	(13, 5.99, 2.00, 5, 1),  -- Cheeseburger
	(14, 8.99, 3.00, 5, 4),  -- Margherita Pizza
	(15, 7.99, 3.00, 5, 3),  -- Chicken Burger
	(16, 3.99, 1.50, 6, 12), -- Milkshake
	(17, 5.99, 2.00, 6, 9),  -- Fish Taco
	(18, 4.99, 2.00, 6, 8),  -- Chicken Taco
	(19, 5.99, 2.00, 7, 1),  -- Cheeseburger
	(20, 9.99, 3.50, 7, 5),  -- Pepperoni Pizza
	(21, 3.99, 1.50, 7, 12), -- Milkshake
	(22, 10.99, 4.00, 8, 6), -- BBQ Chicken Pizza
	(23, 8.99, 3.00, 8, 4),  -- Margherita Pizza
	(24, 4.99, 2.00, 8, 8),  -- Chicken Taco
	(25, 3.99, 1.50, 9, 7),  -- Beef Taco
	(26, 7.99, 3.00, 9, 3),  -- Chicken Burger
	(27, 4.99, 2.00, 9, 8),  -- Chicken Taco
	(28, 5.99, 2.00, 10, 1), -- Cheeseburger
	(29, 9.99, 3.50, 10, 5), -- Pepperoni Pizza
	(30, 5.99, 2.00, 10, 9), -- Fish Taco
	(31, 10.99, 4.00, 11, 6),-- BBQ Chicken Pizza
	(32, 7.99, 3.00, 11, 3), -- Chicken Burger
	(33, 4.99, 2.00, 11, 8), -- Chicken Taco
	(34, 18.99, 6.50, 12, 6), -- BBQ Chicken Pizza (specialty size)
	(35, 18.99, 6.50, 12, 6), -- BBQ Chicken Pizza (specialty size)
	(36, 17.99, 6.00, 12, 6), -- BBQ Chicken Pizza (large specialty size)
	(37, 20.99, 7.00, 13, 6), -- BBQ Chicken Pizza (premium size)
	(38, 20.99, 7.00, 13, 6), -- BBQ Chicken Pizza (premium size)
	(39, 18.99, 6.50, 13, 6), -- BBQ Chicken Pizza (specialty size)
	(40, 21.99, 7.50, 14, 6), -- BBQ Chicken Pizza (supreme size)
	(41, 21.99, 7.50, 14, 6), -- BBQ Chicken Pizza (supreme size)
	(42, 21.99, 7.50, 14, 6), -- BBQ Chicken Pizza (supreme size)
	(43, 23.99, 8.00, 15, 6), -- BBQ Chicken Pizza (ultimate size)
	(44, 23.99, 8.00, 15, 6), -- BBQ Chicken Pizza (ultimate size)
	(45, 22.99, 7.50, 15, 6), -- BBQ Chicken Pizza (almost ultimate size)
	(46, 25.99, 8.50, 16, 6), -- BBQ Chicken Pizza (mega size)
	(47, 25.99, 8.50, 16, 6), -- BBQ Chicken Pizza (mega size)
	(48, 23.99, 8.00, 16, 6), -- BBQ Chicken Pizza (ultimate size)
	(49, 26.99, 9.00, 17, 6), -- BBQ Chicken Pizza (super mega size)
	(50, 26.99, 9.00, 17, 6), -- BBQ Chicken Pizza (super mega size)
	(51, 26.99, 9.00, 17, 6), -- BBQ Chicken Pizza (super mega size)
	(52, 30.99, 10.00, 18, 6), -- BBQ Chicken Pizza (ultra size)
	(53, 30.99, 10.00, 18, 6), -- BBQ Chicken Pizza (ultra size)
	(54, 23.99, 8.00, 18, 6), -- BBQ Chicken Pizza (ultimate size)
	(55, 30.99, 10.00, 19, 6), -- BBQ Chicken Pizza (ultra size)
	(56, 30.99, 10.00, 19, 6), -- BBQ Chicken Pizza (ultra size)
	(57, 28.99, 9.50, 19, 6), -- BBQ Chicken Pizza (almost ultra size)
	(58, 32.99, 11.00, 20, 6), -- BBQ Chicken Pizza (maximum size)
	(59, 32.99, 11.00, 20, 6), -- BBQ Chicken Pizza (maximum size)
	(60, 29.99, 10.00, 20, 6); -- BBQ Chicken Pizza (near maximum size)




















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




















































	
	
	UPDATE [Order] SET OrderID = OrderID;