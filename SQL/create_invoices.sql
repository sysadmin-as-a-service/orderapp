USE [Exo]
GO

DROP TABLE [dbo].[invoices]

CREATE TABLE [dbo].[invoices](
    [id] [int] NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [orderId] [int] NOT NULL,
    [customerId] [int] NOT NULL,
    CONSTRAINT FK_OrderInvoice FOREIGN KEY (orderId)
    REFERENCES orders(id),
    
    CONSTRAINT FK_CustomerInvoice FOREIGN KEY (customerid)
    REFERENCES customers(id)

) ON [PRIMARY]
GO

CREATE INDEX idx_invoices_orderId_customerId
ON invoices (orderId, customerId)

INSERT INTO [dbo].[invoices] (orderId, customerId)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2)