USE [Exo]
GO

DROP TABLE [dbo].[orderitems]

CREATE TABLE [dbo].[orderitems](
	[id] [int] NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [orderId] [int] NOT NULL,
    [productId] [int] NOT NULL,
    [quantity] [int] NOT NULL,
    
    CONSTRAINT FK_OrderOrderItems FOREIGN KEY (orderId)
    REFERENCES orders(id),

    CONSTRAINT FK_ProductOrderItems FOREIGN KEY (productId)
    REFERENCES products(id)

) ON [PRIMARY]
GO

CREATE INDEX idx_orderitems_orderId_productId
ON orderitems (orderId,productId)

INSERT INTO [dbo].[orderitems] (orderId, productId, quantity)
VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 1, 1),
    (3, 2, 2),
    (3, 3, 2),
    (4, 2, 5),
    (4, 3, 4),
    (5, 3, 2),
    (5, 4, 5),
    (5, 5, 18),
    (5, 6, 4),
    (5, 7, 4)