-- Agrega un artículo al inventario que ofrece el punto de venta, Y por defecto pone stock 0

--USE TPIGrupo29;

CREATE PROCEDURE SP_registrarArticulo(
		@nombreArticulo nvarchar(100),
		@idMarca int,
		@precioArticulo float
	)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
			IF (@precioArticulo < 0) BEGIN
				RAISERROR('No se puede insertar un precio de artículo negativo', 16, 1)
			END
			DECLARE @marcaID int
			SET @marcaID = 0;

			SELECT @marcaID = IDMarca FROM MARCAS WHERE IDMarca = @idMarca;

			IF (@marcaID = 0) BEGIN
				RAISERROR('Número de ID de marca no existe en la base de datos', 16, 1)
			END
			INSERT INTO Articulos (Nombre, IDMarca, Precio) VALUES (@nombreArticulo, @idMarca, @precioArticulo);

			INSERT INTO Stock VALUES (@@IDENTITY, 0);
			
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		PRINT ERROR_MESSAGE();
	END CATCH
END;