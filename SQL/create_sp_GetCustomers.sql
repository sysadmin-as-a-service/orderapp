USE Exo
GO

CREATE PROCEDURE sp_GetCustomers
AS
BEGIN
    SET NOCOUNT ON
    SELECT 
        [id],
        [name]
    FROM
        [customers]
END
GO