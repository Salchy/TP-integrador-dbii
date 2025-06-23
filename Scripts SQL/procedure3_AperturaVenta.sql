-- USE TPIGrupo29

CREATE PROCEDURE sp_AperturaVenta_Simple (
    @TipoFactura CHAR(1),
    @ImporteTotal FLOAT
)
AS
BEGIN
	SET NOCOUNT ON; -- Evita que el servidor SQL realize una devolución con las filas afectadas, puede mejorar el rendimiento
	BEGIN TRY
		IF (@TipoFactura != 'A' AND @TipoFactura != 'B') BEGIN
			RAISERROR('Tipo de factura inválido', 16, 1); 
		END
		INSERT INTO Ventas (TipoFactura, ImporteTotal)
		OUTPUT inserted.IDVenta
		VALUES (@TipoFactura, @ImporteTotal);
    END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE();
	END CATCH
END
GO