ALTER PROCEDURE SP_AgregarArticulo(
		@nombreArticulo nvarchar(100),
		@idMarca int,
		@precioArticulo floaT
	)
AS
	BEGIN TRY
		IF (@precioArticulo < 0) BEGIN
			RAISERROR('No se puede insertar un precio de artículo negativo', 16, 1)
		END
		DECLARE @marcaID int
		SET @marcaID = 0;

		SELECT @marcaID = M.IDMarca FROM MARCAS AS M WHERE M.IDMarca = @idMarca;

		IF (@marcaID = 0) BEGIN
			RAISERROR('Número de ID de marca no existe en la base de datos', 16, 1)
		END
		INSERT INTO Articulos (Nombre, IDMarca, Precio) VALUES (@nombreArticulo, @idMarca, @precioArticulo);
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE();
	END CATCH
GO