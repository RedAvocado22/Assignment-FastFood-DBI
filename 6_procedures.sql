-- Get Customer Orders
-- This procedure will retrieve all orders for a given customer.
CREATE OR ALTER PROCEDURE sp_GetCustomerOrders
    @CustomerID INT
AS
BEGIN
    SELECT 
        o.OrderID,
        o.DateOrder,
        o.Total,
        o.Description
    FROM 
        [Order] o
    WHERE 
        o.CustomerID = @CustomerID
    ORDER BY 
        o.DateOrder DESC;
END

-- Update Product Price and Recalculate Order Totals
-- This procedure will update a product's price and recalculate the total for all affected orders.
CREATE OR ALTER PROCEDURE sp_UpdateProductPriceAndRecalculateOrders
    @ProductID INT,
    @NewPrice DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        UPDATE Product
        SET Price = @NewPrice
        WHERE ProductID = @ProductID;
        
        UPDATE o
        SET Total = (
            SELECT SUM(
                CASE 
                    WHEN od.ProductID = @ProductID THEN @NewPrice
                    ELSE od.SalePrice
                END
            )
            FROM OrderDetail od
            WHERE od.OrderID = o.OrderID
        )
        FROM [Order] o
        WHERE EXISTS (
            SELECT 1
            FROM OrderDetail od
            WHERE od.OrderID = o.OrderID AND od.ProductID = @ProductID
        );
        
        COMMIT TRANSACTION;
        
        SELECT 'Price updated and orders recalculated successfully.' AS Result;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT 'An error occurred: ' + ERROR_MESSAGE() AS Result;
    END CATCH
END

-- Generate Monthly Sales Report
-- This procedure generates a monthly sales report, including product rankings, total sales, and year-over-year comparisons.
CREATE OR ALTER PROCEDURE sp_GenerateMonthlySalesReport
    @Year INT,
    @Month INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartDate DATE = DATEFROMPARTS(@Year, @Month, 1);
    DECLARE @EndDate DATE = EOMONTH(@StartDate);
    DECLARE @LastYearStartDate DATE = DATEADD(YEAR, -1, @StartDate);
    DECLARE @LastYearEndDate DATE = EOMONTH(@LastYearStartDate);

    WITH CurrentMonthSales AS (
        SELECT 
            p.ProductID,
            p.Name AS ProductName,
            p.CategoryID,
            SUM(od.SalePrice) AS TotalSales,
            SUM(od.Profit) AS TotalProfit,
            COUNT(DISTINCT o.OrderID) AS OrderCount
        FROM 
            [Order] o
            JOIN OrderDetail od ON o.OrderID = od.OrderID
            JOIN Product p ON od.ProductID = p.ProductID
        WHERE 
            o.DateOrder BETWEEN @StartDate AND @EndDate
        GROUP BY 
            p.ProductID, p.Name, p.CategoryID
    ),
    LastYearSales AS (
        SELECT 
            p.ProductID,
            SUM(od.SalePrice) AS LastYearSales
        FROM 
            [Order] o
            JOIN OrderDetail od ON o.OrderID = od.OrderID
            JOIN Product p ON od.ProductID = p.ProductID
        WHERE 
            o.DateOrder BETWEEN @LastYearStartDate AND @LastYearEndDate
        GROUP BY 
            p.ProductID
    ),
    RankedSales AS (
        SELECT 
            cms.*,
            c.Name AS CategoryName,
            lys.LastYearSales,
            RANK() OVER (ORDER BY cms.TotalSales DESC) AS OverallRank,
            RANK() OVER (PARTITION BY cms.CategoryID ORDER BY cms.TotalSales DESC) AS CategoryRank
        FROM 
            CurrentMonthSales cms
            LEFT JOIN LastYearSales lys ON cms.ProductID = lys.ProductID
            JOIN Category c ON cms.CategoryID = c.CategoryID
    )
    SELECT 
        rs.ProductID,
        rs.ProductName,
        rs.CategoryName,
        rs.TotalSales,
        rs.TotalProfit,
        rs.OrderCount,
        rs.OverallRank,
        rs.CategoryRank,
        rs.LastYearSales,
        CASE 
            WHEN rs.LastYearSales > 0 THEN 
                (rs.TotalSales - rs.LastYearSales) / rs.LastYearSales * 100 
            ELSE 
                NULL 
        END AS YearOverYearGrowth,
        (SELECT SUM(TotalSales) FROM CurrentMonthSales) AS TotalMonthlySales,
        (SELECT SUM(LastYearSales) FROM LastYearSales) AS TotalLastYearSales,
        @StartDate AS ReportStartDate,
        @EndDate AS ReportEndDate
    FROM 
        RankedSales rs
    ORDER BY 
        rs.OverallRank;
END