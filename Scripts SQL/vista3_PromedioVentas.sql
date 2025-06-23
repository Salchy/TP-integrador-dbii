-- USE TPIGrupo29;

CREATE VIEW Vista3_PromedioDeVentas AS
	SELECT AVG(ImporteTotal) AS PromedioImporteTotal
	FROM Ventas;
GO