USE TPIGrupo29;

-- Muestra todo
SELECT * FROM VW_MostrarInformacionVentas;

-- Muestra información de una venta en específico
SELECT * FROM VW_MostrarInformacionVentas WHERE IDVenta = 7

-- Muestra sólo el importe de esa venta
SELECT SUM(SubTotal) AS SubTotalVenta FROM VW_MostrarInformacionVentas WHERE IDVenta = 7

-- Muestra todos los subtotales de cada venta
SELECT IDventa, Fecha, SUM(SubTotal) AS SubTotalVenta FROM VW_MostrarInformacionVentas GROUP BY IDVenta, Fecha;

-- Opción, filtrado por periodo de fechas
SELECT IDventa, Fecha, SUM(SubTotal) AS SubTotalVenta FROM VW_MostrarInformacionVentas WHERE MONTH(Fecha) = 8 GROUP BY IDVenta, Fecha;