USE [Exo]
GO

DROP TABLE [dbo].[orders]

CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [date] [date] NOT NULL,
	[reference] [nvarchar](50) NOT NULL,
    [customerId] [int] NOT NULL,
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (customerId)
    REFERENCES customers(id)

) ON [PRIMARY]
GO

CREATE INDEX idx_orders_date_customerid
ON orders ([date], [customerId])

INSERT INTO [dbo].[orders] ([date],[reference],[customerId])
VALUES
    ('2021-01-01','no regerts','1'),
    ('2021-01-05','keeping up with the jodies','2'),
    ('2021-01-07','but all my friends have one','3'),
    ('2021-01-08','why is everyone copying me','1'),
    ('2021-01-09','gotta spend money to make money','2')