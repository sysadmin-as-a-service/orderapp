USE [Exo]
GO

DROP TABLE [dbo].[customers]

CREATE TABLE [dbo].[customers](
	[id] [int] NOT NULL IDENTITY (1,1) PRIMARY KEY,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO

CREATE INDEX idx_customers_name
ON customers (name)
GO


INSERT INTO [dbo].[customers] ([name],[address])
VALUES 
	('Jodie Harsh', '100 Ponsonby Road, Auckland'),
	('Masked Wolf', '101 Ponsonby Road, Auckland'),
	('TCTS', '102 Ponsonby Road, Auckland')

GO