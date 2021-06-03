USE [Exo]
GO

DROP TABLE [dbo].[products]

CREATE TABLE [dbo].[products](
	[id] [int] NOT NULL IDENTITY (1,1) PRIMARY KEY,
	[name] [nvarchar](50) NOT NULL,
	[producttype] [nvarchar](50) NOT NULL,
    [sellprice] [decimal](19,4) NOT NULL,
    [costprice] [decimal](19,4) NOT NULL,

) ON [PRIMARY]
GO

CREATE INDEX idx_products_name
ON products (name)

INSERT INTO [dbo].[products] ([name],[producttype],[sellprice],[costprice])
VALUES
	('Suzuki SV650','Sports',10995.0000,4015.0000),
	('Triumph Bonneville','Cruiser',12995.0000,2085.1200),
	('Honda CBR1000RR','Sports',21995.0000,8280.8200),
	('BMW S1000','Sports',22995.0000,8485.0000),
	('Indian Scout','Cruiser',20995.0000,4285.1200),
	('Suzuki DL650','Touring',16995.0000,7285.1200),
	('Honda Africa Twin','Touring',15995.0000,6985.1200)

GO