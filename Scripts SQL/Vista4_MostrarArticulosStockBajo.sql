-- Obtener un listado de los art�culos que tengan alerta de stock bajo

CREATE VIEW VW_MostrarArticulosStockBajo AS
	SELECT
		Nombre
	FROM Articulos
	WHERE Eliminado = 1;
GO

select * FROM VW_MostrarArticulosStockBajo;