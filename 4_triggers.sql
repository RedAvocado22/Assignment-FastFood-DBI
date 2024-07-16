CREATE OR ALTER TRIGGER trg_UpdateCustomerRank
ON [Order]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    WITH CustomerTotal AS (
        SELECT o.CustomerID, SUM(od.SalePrice) AS TotalSpent
        FROM [Order] o
        JOIN OrderDetail od ON o.OrderID = od.OrderID
        WHERE o.CustomerID IN (SELECT DISTINCT CustomerID FROM inserted)
        GROUP BY o.CustomerID
    )
    UPDATE c
    SET Rank = 
        CASE
            WHEN ct.TotalSpent >= 500 THEN 'Diamond'
            WHEN ct.TotalSpent >= 250 THEN 'Platinum'
            WHEN ct.TotalSpent >= 100 THEN 'Gold'
            WHEN ct.TotalSpent >= 50 THEN 'Silver'
            WHEN ct.TotalSpent >= 30 THEN 'Bronze'
            ELSE 'Regular'
        END
    FROM Customer c
    JOIN CustomerTotal ct ON c.CustomerID = ct.CustomerID;
END;