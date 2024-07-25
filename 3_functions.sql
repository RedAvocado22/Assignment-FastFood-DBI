-- Function: GetDiscountedPrice
-- Purpose: Calculates the discounted price based on the customer's rank
-- Parameters:
--   @OriginalPrice: The original price of the item (DECIMAL(10,2))
--   @CustomerRank: The rank of the customer (NVARCHAR(50))
-- Returns: The discounted price as a DECIMAL(10,2)
CREATE FUNCTION dbo.GetDiscountedPrice
(
    @OriginalPrice DECIMAL(10,2),
    @CustomerRank NVARCHAR(50)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @DiscountedPrice DECIMAL(10,2)

    -- Apply discount based on customer rank
    SET @DiscountedPrice = 
        CASE @CustomerRank
            WHEN 'Bronze' THEN @OriginalPrice * 0.95  -- 5% discount
            WHEN 'Silver' THEN @OriginalPrice * 0.90  -- 10% discount
            WHEN 'Gold' THEN @OriginalPrice * 0.85    -- 15% discount
            WHEN 'Platinum' THEN @OriginalPrice * 0.80 -- 20% discount
            WHEN 'Diamond' THEN @OriginalPrice * 0.75  -- 25% discount
            ELSE @OriginalPrice  -- No discount for 'Regular' or NULL rank
        END

    RETURN @DiscountedPrice
END

-- Function: GetTotalSalesForStore
-- Purpose: Calculates the total sales for a specific store within a given date range
-- Parameters:
--   @StoreID: The ID of the store to calculate sales for
--   @StartDate: The start date of the period to consider
--   @EndDate: The end date of the period to consider
-- Returns: The total sales amount as a DECIMAL(10,2)
CREATE FUNCTION dbo.GetTotalSalesForStore
(
    @StoreID INT,
    @StartDate DATE,
    @EndDate DATE
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalSales DECIMAL(10,2)

    -- Sum up the Total field from the Order table for the specified store and date range
    SELECT @TotalSales = SUM(o.Total)
    FROM [Order] o
    WHERE o.StoreID = @StoreID
      AND o.DateComplete BETWEEN @StartDate AND @EndDate

    -- Return the total sales, or 0 if no sales were found
    RETURN ISNULL(@TotalSales, 0)
END

-- Function: GetProductStockStatus
-- Purpose: Determines the stock status of a product based on its quantity
-- Parameters:
--   @ProductID: The ID of the product to check
-- Returns: A VARCHAR(20) indicating the stock status ('In Stock', 'Low Stock', 'Out of Stock', or 'Unknown')
CREATE FUNCTION dbo.GetProductStockStatus
(
    @ProductID INT
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @StockStatus VARCHAR(20)
    DECLARE @Quantity INT

    -- Get the quantity of the specified product
    SELECT @Quantity = Quantity
    FROM Product
    WHERE ProductID = @ProductID

    -- Determine the stock status based on the quantity
    SET @StockStatus = 
        CASE 
            WHEN @Quantity > 20 THEN 'In Stock'
            WHEN @Quantity BETWEEN 1 AND 20 THEN 'Low Stock'
            WHEN @Quantity = 0 THEN 'Out of Stock'
            ELSE 'Unknown'
        END

    RETURN @StockStatus
END

-- Function: GetAverageOrderValueForCustomer
-- Purpose: Calculates the average order value for a specific customer
-- Parameters:
--   @CustomerID: The ID of the customer to calculate the average order value for
-- Returns: The average order value as a DECIMAL(10,2)
CREATE FUNCTION dbo.GetAverageOrderValueForCustomer
(
    @CustomerID INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @AvgOrderValue DECIMAL(10,2)

    -- Calculate the average of the Total field from the Order table for the specified customer
    SELECT @AvgOrderValue = AVG(Total)
    FROM [Order]
    WHERE CustomerID = @CustomerID

    -- Return the average order value, or 0 if no orders were found
    RETURN ISNULL(@AvgOrderValue, 0)
END

