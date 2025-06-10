-- Insert de datos

USE TPIGrupo29;

INSERT INTO Marcas (Nombre) VALUES
	('Samsung'),
	('Apple'),
	('Dell'),
	('Motorola'),
	('Lenovo');

SELECT * FROM MARCAS;

-- Versión sin procedimiento
--INSERT INTO Articulos (IDMarca, Nombre, Precio) VALUES
--	(1, 'Smart TV 55"', 250000),
--	(2, 'iPhone 14', 550000),
--	(3, 'Netbook Latitude 3420', 350000),
--	(4, 'Motorola G60s', 200000),
--	(5, 'Notebook Ideapad 3', 310000);

-- Versión con procedimiento almacenado
EXEC SP_AgregarArticulo 'Smart TV 55"', 1, 250000
EXEC SP_AgregarArticulo 'iPhone 14', 2, 550000
EXEC SP_AgregarArticulo 'Netbook Latitude 3420', 3, 350000
EXEC SP_AgregarArticulo 'Motorola G60s', 4, 200000
EXEC SP_AgregarArticulo 'Notebook Ideapad 3', 5, 310000

EXEC SP_AgregarArticulo 'Prueba', 3, -1; -- Este da error, y no permite insertarlo, ya que el precio es negativo
EXEC SP_AgregarArticulo 'Prueba', 8, 5000; -- Este también da error, y no permite insertarlo, ya que el el id de marca no existe en la base de datos

INSERT INTO Stock (IDArticulo, Cantidad) VALUES
	(1, 8),
	(2, 3),
	(3, 12),
	(4, 2),
	(5, 8);

SELECT * FROM Stock;

INSERT INTO Ventas (Fecha, TipoFactura, ImporteTotal) VALUES -- Cómo calculo realmente el ImporteTotal? Debería insertar el importeTotal, el valor del precio del artículo, en el procedimiento de registrar una venta
	(GETDATE(), 'B', 4000),
	(GETDATE(), NULL, 5000),
	(GETDATE(), 'A', 6000);

INSERT INTO ArticulosVenta (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (1, 2, 2, 550000);
INSERT INTO ArticulosVenta (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (2, 4, 2, 120000);
INSERT INTO ArticulosVenta (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (1, 5, 1, 310000);