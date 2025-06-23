USE TPIGrupo29;

-- Muestra todo
SELECT * FROM VW_MostrarInformacionVentas;

-- Muestra informaci�n de una venta en espec�fico
SELECT * FROM VW_MostrarInformacionVentas WHERE IDVenta = 7

-- Muestra s�lo el importe de esa venta
SELECT SUM(SubTotal) AS SubTotalVenta FROM VW_MostrarInformacionVentas WHERE IDVenta = 7

-- Muestra todos los subtotales de cada venta
SELECT IDventa, Fecha, SUM(SubTotal) AS SubTotalVenta FROM VW_MostrarInformacionVentas GROUP BY IDVenta, Fecha;

-- Opci�n, filtrado por periodo de fechas
SELECT IDventa, Fecha, SUM(SubTotal) AS SubTotalVenta FROM VW_MostrarInformacionVentas WHERE MONTH(Fecha) = 8 GROUP BY IDVenta, Fecha;