CREATE PROCEDURE sp_AperturaVenta_Simple
    @TipoFactura CHAR(1),
    @ImporteTotal FLOAT, 
    @IDVenta INT OUTPUT 
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Ventas (TipoFactura, ImporteTotal)
    VALUES (@TipoFactura, @ImporteTotal);
    
    SET @IDVenta = SCOPE_IDENTITY();
END
GO