--MOdificar el importe de la venta al hacer un insert en la tabla de ArticuloVenta
--
CREATE TRIGGER trg_ActualizarImporteVenta
ON ArticulosVenta
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
  
    UPDATE V
    SET ImporteTotal = (
        SELECT SUM(AV.Cantidad * AV.PrecioUnitario)
        FROM ArticulosVenta AV
        WHERE AV.IDVenta = V.IDVenta
    )
    FROM Ventas V
    INNER JOIN inserted I ON V.IDVenta = I.IDVenta;
END
GO