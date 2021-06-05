USE Exo
GO

CREATE PROCEDURE sp_GetCustomers
AS
BEGIN
    SET NOCOUNT ON
    SELECT 
        [id],
        [name],
        [address]
    FROM
        [customers]
END
GO