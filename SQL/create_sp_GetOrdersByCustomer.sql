USE Exo
GO

CREATE PROCEDURE sp_GetOrdersByCustomerId @customerId int
AS
BEGIN
    SET NOCOUNT ON
    SELECT 
        orders.[id],
        orders.[date],
        orders.[reference]
    FROM
        orders
    INNER JOIN customers ON orders.customerId=customers.Id
    WHERE
        customers.[id] = @customerId
END
GO