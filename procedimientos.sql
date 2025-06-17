-- Creaci�n de procedimientos

CREATE PROCEDURE SP_AgregarArticulo(
		@nombreArticulo nvarchar(100),
		@idMarca int,
		@precioArticulo float
	)
AS
	BEGIN TRANSACTION
		BEGIN TRY
			IF (@precioArticulo < 0) BEGIN
				RAISERROR('No se puede insertar un precio de art�culo negativo', 16, 1)
			END
			DECLARE @marcaID int
			SET @marcaID = 0;

			SELECT @marcaID = IDMarca FROM MARCAS WHERE IDMarca = @idMarca;

			IF (@marcaID = 0) BEGIN
				RAISERROR('N�mero de ID de marca no existe en la base de datos', 16, 1)
			END
			INSERT INTO Articulos (Nombre, IDMarca, Precio) VALUES (@nombreArticulo, @idMarca, @precioArticulo);

			INSERT INTO Stock VALUES (@@IDENTITY, 0);
			
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION;
			PRINT ERROR_MESSAGE();
		END CATCH
GO

-- "Deber�a descontar el stock del producto que se vendi�
-- Es un insert a ArticuloVentas, pasandole por argumento, el ID de venta al que va asociado ese art�culo
-- Para hacerlo m�s sencillo, vamos a realizar un procedimiento, de registrar un �tem de venta, para una venta en cuesti�n
-- A tener en cuenta: se deber� guardar el precio del art�culo en el campo importeUnitario,para guardar el precio de esa venta, as� poder modificar el precio luego de ese art�culo, sin que influya en los reportes, ya que el precio de venta es otro.
-- A demas, si la cantidad a comprar, es mayor a la del stock que hay disponible, arrojar error "

CREATE PROCEDURE SP_RegistrarVentaArticulo (
	@idVenta INT,
	@idArticulo INT,
	@cantidad INT
)
AS
BEGIN
	BEGIN TRANSACTION
		BEGIN TRY
			-- Validaci�n de idVenta
			IF (@idVenta < 0) BEGIN
				RAISERROR('No se puede insertar un id de venta negativo', 16, 1);
			END
			IF (SELECT count(IDVenta) FROM Ventas WHERE IDVenta = @idVenta) = 0 BEGIN
				RAISERROR('No existe este id de venta', 16, 1);
			END

			-- Validaci�n de idArticulo
			DECLARE @precioUnitario FLOAT; -- Para guardar el precio unitario, para despu�s multiplicarlo por la cantidad, y guardar el subtotal en la db
			IF (@idArticulo < 0) BEGIN
				RAISERROR('No puedes ingresar un ID de art�culo negativo', 16, 1); 
			END
			--IF (SELECT count(IDArticulo) FROM Articulos WHERE IDArticulo = @idArticulo) = 0 BEGIN
			SELECT @precioUnitario = Precio FROM Articulos WHERE IDArticulo = @idArticulo;
			IF (@precioUnitario IS NULL) BEGIN
				RAISERROR('No existe este id de art�tuclo', 16, 1);
			END

			-- Validaci�n cantidad
			IF (@cantidad < 0) BEGIN
				RAISERROR('No puedes insertar una cantidad negativa', 16, 1);
			END
			
			-- Validaci�n de stock
			DECLARE @stockActual INT;
			SELECT @stockActual = Cantidad FROM Stock WHERE IDArticulo = @idArticulo;
			IF (@stockActual < @cantidad) BEGIN
				RAISERROR('Stock insuficiente para efectuar esta transaccion', 16, 1);
			END

			-- Actualizar el stock
			UPDATE Stock SET Cantidad = @stockActual - @cantidad WHERE IDArticulo = @idArticulo;

			-- Registrar la venta del art�culo para una venta en espec�fico
			INSERT INTO ArticulosVenta VALUES (@idVenta, @idArticulo, @cantidad, @precioUnitario);

			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION;
			PRINT ERROR_MESSAGE();
		END CATCH
	END
GO

CREATE PROCEDURE SP_RegistrarVentaArticulo (
	@idVenta INT,
	@idArticulo INT,
	@cantidad INT
)

EXEC SP_RegistrarVentaArticulo 4, 4, 4;

SELECT * FROM Articulos;
SELECT * FROM Stock;
SELECT * FROM Ventas;


INSERT INTO Ventas (ImporteTotal) VALUES (0);