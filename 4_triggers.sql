CREATE OR ALTER TRIGGER trg_UpdateCustomerRank
ON Bill
AFTER INSERT, UPDATE
AS
BEGIN
    -- Create a temporary table to hold the affected CustomerIDs and their total spent
    CREATE TABLE #TempCustomerTotal (
        CustomerID INT,
        TotalSpent DECIMAL(10, 2)
    )

    -- Insert the affected CustomerIDs and calculate their total spent across all bills
    INSERT INTO #TempCustomerTotal (CustomerID, TotalSpent)
    SELECT b.CustomerID, SUM(b.Total)
    FROM Bill b
    WHERE b.CustomerID IN (SELECT DISTINCT CustomerID FROM inserted)
    GROUP BY b.CustomerID

    -- Update the customer's rank based on total spent
    UPDATE c
    SET Rank = 
        CASE
            WHEN t.TotalSpent >= 500 THEN 'Diamond'
            WHEN t.TotalSpent >= 250 THEN 'Platinum'
            WHEN t.TotalSpent >= 100 THEN 'Gold'
            WHEN t.TotalSpent >= 50 THEN 'Silver'
            WHEN t.TotalSpent >= 30 THEN 'Bronze'
            ELSE 'Regular'
        END
    FROM Customer c
    INNER JOIN #TempCustomerTotal t ON c.CustomerID = t.CustomerID
    WHERE c.Rank IS NULL OR c.Rank <> 
        CASE
            WHEN t.TotalSpent >= 500 THEN 'Diamond'
            WHEN t.TotalSpent >= 250 THEN 'Platinum'
            WHEN t.TotalSpent >= 100 THEN 'Gold'
            WHEN t.TotalSpent >= 50 THEN 'Silver'
            WHEN t.TotalSpent >= 30 THEN 'Bronze'
            ELSE 'Regular'
        END

    -- Drop the temporary table
    DROP TABLE #TempCustomerTotal
END