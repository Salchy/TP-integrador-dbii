-- USE TPIGrupo29;

CREATE PROCEDURE SP_ModificarStock(
	@idArticulo INT,
	@cantidad INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Validaci�n de idArticulo
			DECLARE @stockActual FLOAT; -- Para guardar el stock actual, para luego acumularlo
			IF (@idArticulo < 0) BEGIN
				RAISERROR('No puedes ingresar un ID de art�culo negativo', 16, 1); 
			END

			SELECT @stockActual = Cantidad FROM Stock WHERE IDArticulo = @idArticulo;
			IF (@stockActual IS NULL) BEGIN
				RAISERROR('No existe este id de art�tuclo', 16, 1);
			END

			IF (@cantidad = 0) BEGIN
				UPDATE Stock SET Cantidad = 0 WHERE IDArticulo = @idArticulo;
			END
			ELSE IF (@cantidad < 0) BEGIN -- Es una modificaci�n de sustracci�n
				-- Validaci�n de stock actual
				IF (@stockActual + @cantidad < 0) BEGIN
					RAISERROR('No se puede realizar esta modificaci�n porque generar�a stock en negativo', 16, 1);
				END
			END
			UPDATE Stock SET Cantidad = @stockActual + @cantidad WHERE IDArticulo = @idArticulo;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		PRINT ERROR_MESSAGE();
	END CATCH
END