USE Exo
GO

DECLARE @customer nvarchar(50) = 'Masked Wolf' -- Enter the name of the customer
DECLARE @startDate DATE = '2021-01-01' -- Enter the start date e.g. 2021-04-01
DECLARE @endDate DATE = '2021-12-31' -- Enter the (non-inclusive) end date e.g. 2021-05-01

SELECT
    customers.[Name],
    products.[productType],
    SUM(orderItems.[quantity]) AS 'Total Units',
    SUM(products.[SellPrice] * orderItems.[quantity]) as 'Total Price'
FROM
    customers
INNER JOIN orders ON orders.customerId=customers.id
INNER JOIN orderItems ON orders.id=orderItems.orderId
INNER JOIN products ON orderitems.productId=products.Id

WHERE
    customers.[name] = @customer AND
    orders.date >= @startDate AND
    orders.date < @endDate

GROUP BY
    customers.[name],
    products.[productType]