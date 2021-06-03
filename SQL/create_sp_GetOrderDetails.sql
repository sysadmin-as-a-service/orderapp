USE Exo
GO

CREATE PROCEDURE sp_GetOrderDetails @orderId int
AS
BEGIN
    SET NOCOUNT ON
    SELECT 
        orders.[id] as 'OrderId',
        orders.[reference] as 'OrderReference',
        orders.[date] as 'OrderDate',
        products.[name] as 'ProductName',
        products.[producttype] as 'ProductType',
        orderitems.[quantity] as 'OrderQuantity'
    FROM
        orders
    INNER JOIN orderItems ON orders.Id=orderItems.orderId
    INNER JOIN products ON orderItems.productId=products.Id

    WHERE orders.[id] = @orderId

END
GO
