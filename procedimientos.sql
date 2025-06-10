CREATE PROCEDURE SP_AgregarArticulo(
		@nombreArticulo nvarchar(100),
		@idMarca int,
		@precioArticulo floaT
	)
AS
	BEGIN
	-- Ver tema de restricciones y manejo de errores (TRY-CATH)
		INSERT INTO Articulos (Nombre, IDMarca, Precio) VALUES (@nombreArticulo, @idMarca, @precioArticulo);
	END
GO