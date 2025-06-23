-- Creación de vistas

-- Mostrar contenido de una venta
-- "Debería mostrar todos los artículos que formaron parte de una venta
-- Join entre Ventas, ArtículoVenta y Artículo para obtener el nombre del artículo"

-- USE TPIGrupo29;

CREATE VIEW VW_MostrarInformacionVentas AS
	SELECT
		V.IDVenta, V.Fecha, A.Nombre as 'Artículo', AV.Cantidad, AV.PrecioUnitario, AV.Cantidad * AV.PrecioUnitario AS 'SubTotal', V.TipoFactura
	FROM ArticulosVenta AS AV
	INNER JOIN Articulos AS A ON AV.IDArticulo = A.IDArticulo
	INNER JOIN Ventas AS V ON AV.IDVenta = V.IDVenta;
GO

SELECT * FROM VW_MostrarInformacionVentas;