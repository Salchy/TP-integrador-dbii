-- Use TPIGrupo29;

CREATE PROCEDURE SP_RegistrarMarca(
	@nombreMarca nvarchar(100)
)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Marcas (Nombre) VALUES (@nombreMarca);
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE();
	END CATCH
END;