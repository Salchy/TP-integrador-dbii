-- Creaci�n de vistas

-- Mostrar contenido de una venta
-- "Deber�a mostrar todos los art�culos que formaron parte de una venta
-- Join entre Ventas, Art�culoVenta y Art�culo para obtener el nombre del art�culo"

-- USE TPIGrupo29;

CREATE VIEW VW_MostrarInformacionVentas AS
	SELECT
		V.IDVenta, V.Fecha, A.Nombre as 'Art�culo', AV.Cantidad, AV.PrecioUnitario, AV.Cantidad * AV.PrecioUnitario AS 'SubTotal', V.TipoFactura
	FROM ArticulosVenta AS AV
	INNER JOIN Articulos AS A ON AV.IDArticulo = A.IDArticulo
	INNER JOIN Ventas AS V ON AV.IDVenta = V.IDVenta;
GO

SELECT * FROM VW_MostrarInformacionVentas;