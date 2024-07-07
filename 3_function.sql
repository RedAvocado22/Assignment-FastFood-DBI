-- Calculate the discounted price based on the customer's rank.
-- Each rank corresponds to a specific discount percentage.
-- The CASE statement checks the rank and applies the appropriate discount.

CREATE FUNCTION dbo.GetDiscountedPrice
(
    @OriginalPrice DECIMAL(10,2),
    @CustomerRank NVARCHAR(50)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @DiscountedPrice DECIMAL(10,2)

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