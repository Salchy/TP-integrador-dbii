--Advertencia y baja logica de producto al llegar a 0 stock en el mismo
--
CREATE TRIGGER trg_AlertaCantidadStockCero
ON Stock
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        WHERE i.Cantidad = 0
    )
    BEGIN
    PRINT 'Atencion, uno o mas productos estan actualmente sin stock, asi que se les dara una baja logica del mismo'
    UPDATE Articulos set Eliminado = 1 from INSERTED where Articulos.IDArticulo = INSERTED.IDArticulo;
    END    
END
GO