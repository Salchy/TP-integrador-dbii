-- Insert de datos

USE TPIGrupo29;

-- Ingreso de marcas
INSERT INTO Marcas (Nombre) VALUES
	('Coca-Cola'),
	('Pepsi'),
	('Fanta'),
	('Sprite'),
	('Arcor'),
	('Bon o Bon'),
	('Mogul'),
	('Tita'),
	('Rhodesia'),
	('Cerealitas'),
	('Cepita'),
	('Beldent'),
	('Marlboro'),
	('Lays'),
	('Rocklets');
GO

------------------------------------------------------

-- Visualizar marcas
SELECT * FROM MARCAS;
GO

------------------------------------------------------

-- Ingreso de art�culos

-- Versi�n sin procedimiento
--INSERT INTO Articulos (IDMarca, Nombre, Precio) VALUES
--	(1, 'Smart TV 55"', 250000),
--	(2, 'iPhone 14', 550000),
--	(3, 'Netbook Latitude 3420', 350000),
--	(4, 'Motorola G60s', 200000),
--	(5, 'Notebook Ideapad 3', 310000);

-- Versi�n con procedimiento almacenado
EXEC SP_registrarArticulo 'Coca-Cola 500 ml PET', 1, 950;
EXEC SP_registrarArticulo 'Coca-Cola 1.5 L', 1, 1750;
EXEC SP_registrarArticulo 'Coca-Cola Sin Az�car 500 ml', 1, 920;
EXEC SP_registrarArticulo 'Pepsi 600 ml', 2, 880;
EXEC SP_registrarArticulo 'Pepsi Black 1.5 L', 2, 1690;
EXEC SP_registrarArticulo 'Fanta Naranja 500 ml', 3, 930;
EXEC SP_registrarArticulo 'Fanta Uva 1.5 L', 3, 1790;
EXEC SP_registrarArticulo 'Sprite 500 ml', 4, 920;
EXEC SP_registrarArticulo 'Sprite Cero 1.5 L', 4, 1750;
EXEC SP_registrarArticulo 'Caramelos masticables Arcor 100 g', 5, 650;
EXEC SP_registrarArticulo 'Chupet�n Pico Dulce', 5, 220;
EXEC SP_registrarArticulo 'Turr�n Arcor', 5, 270;
EXEC SP_registrarArticulo 'Bon o Bon cl�sico', 6, 230;
EXEC SP_registrarArticulo 'Bon o Bon blanco', 6, 250;
EXEC SP_registrarArticulo 'Mogul Ositos �cidos 90 g', 7, 900;
EXEC SP_registrarArticulo 'Mogul Frutales 90 g', 7, 870;
EXEC SP_registrarArticulo 'Tita individual', 8, 280;
EXEC SP_registrarArticulo 'Tita x6 unidades', 8, 1550;
EXEC SP_registrarArticulo 'Rhodesia individual', 9, 280;
EXEC SP_registrarArticulo 'Rhodesia Pack x3', 9, 790;
EXEC SP_registrarArticulo 'Cerealitas Salvado 117 g', 10, 750;
EXEC SP_registrarArticulo 'Cerealitas Avena y Miel 117 g', 10, 780;
EXEC SP_registrarArticulo 'Cepita Durazno 200 ml', 11, 390;
EXEC SP_registrarArticulo 'Cepita Multifruta 1 L', 11, 1290;
EXEC SP_registrarArticulo 'Beldent Infinit Mint x8', 12, 650;
EXEC SP_registrarArticulo 'Beldent Frutilla �cida x8', 12, 650;
EXEC SP_registrarArticulo 'Beldent Caja x28', 12, 1950;
EXEC SP_registrarArticulo 'Marlboro Gold Box', 13, 2000;
EXEC SP_registrarArticulo 'Marlboro Red Box', 13, 2100;
EXEC SP_registrarArticulo 'Lays Cl�sicas 43 g', 14, 850;
EXEC SP_registrarArticulo 'Lays Jam�n 90 g', 14, 1580;
EXEC SP_registrarArticulo 'Rocklets 45 g', 15, 600;
EXEC SP_registrarArticulo 'Rocklets tubo 120 g', 15, 1250;
GO

----------------------------------------------------------------

-- Visualizaci�n de productos
SELECT * FROM Articulos;

-- Visualizacion de stock
SELECT * FROM Stock;

----------------------------------------------------------------

-- Verificaci�n de ingreso con datos erroneos
EXEC SP_registrarArticulo 'Prueba', 3, -1; -- Este da error, y no permite insertarlo, ya que el precio es negativo
EXEC SP_registrarArticulo 'Prueba', 50, 5000; -- Este tambi�n da error, y no permite insertarlo, ya que el el id de marca no existe en la base de datos
GO

----------------------------------------------------------------

-- Modificar el stock manualmente, falta crear procedure para adicionar stock a un producto.

UPDATE Stock SET Cantidad = 12 WHERE IDArticulo = 1;
UPDATE Stock SET Cantidad = 3  WHERE IDArticulo = 2;
UPDATE Stock SET Cantidad = 8  WHERE IDArticulo = 3;
UPDATE Stock SET Cantidad = 1  WHERE IDArticulo = 4;
UPDATE Stock SET Cantidad = 11 WHERE IDArticulo = 5;
UPDATE Stock SET Cantidad = 7  WHERE IDArticulo = 6;
UPDATE Stock SET Cantidad = 5  WHERE IDArticulo = 7;
UPDATE Stock SET Cantidad = 9  WHERE IDArticulo = 8;
UPDATE Stock SET Cantidad = 2  WHERE IDArticulo = 9;
UPDATE Stock SET Cantidad = 13 WHERE IDArticulo = 10;
UPDATE Stock SET Cantidad = 4  WHERE IDArticulo = 11;
UPDATE Stock SET Cantidad = 6  WHERE IDArticulo = 12;
UPDATE Stock SET Cantidad = 4  WHERE IDArticulo = 13;
UPDATE Stock SET Cantidad = 14 WHERE IDArticulo = 14;
UPDATE Stock SET Cantidad = 10 WHERE IDArticulo = 15;
UPDATE Stock SET Cantidad = 1  WHERE IDArticulo = 16;
UPDATE Stock SET Cantidad = 9  WHERE IDArticulo = 17;
UPDATE Stock SET Cantidad = 12 WHERE IDArticulo = 18;
UPDATE Stock SET Cantidad = 8  WHERE IDArticulo = 19;
UPDATE Stock SET Cantidad = 6  WHERE IDArticulo = 20;
UPDATE Stock SET Cantidad = 2  WHERE IDArticulo = 21;
UPDATE Stock SET Cantidad = 10 WHERE IDArticulo = 22;
UPDATE Stock SET Cantidad = 0  WHERE IDArticulo = 23;
UPDATE Stock SET Cantidad = 13 WHERE IDArticulo = 24;
UPDATE Stock SET Cantidad = 7  WHERE IDArticulo = 25;
UPDATE Stock SET Cantidad = 3  WHERE IDArticulo = 26;
UPDATE Stock SET Cantidad = 9  WHERE IDArticulo = 27;
UPDATE Stock SET Cantidad = 9  WHERE IDArticulo = 28;
UPDATE Stock SET Cantidad = 11 WHERE IDArticulo = 29;
UPDATE Stock SET Cantidad = 5  WHERE IDArticulo = 30;
UPDATE Stock SET Cantidad = 14 WHERE IDArticulo = 31;
GO

----------------------------------------------------------------

-- Visualizar stock
SELECT * FROM Stock;
GO

----------------------------------------------------------------
SET DATEFORMAT ymd;
-- Dar de alta ventas
-- Por defecto, el importeTotal, se establece a 0, se va modificando por triggers, cuando se inserta una venta de un art�culo, para la venta ID
INSERT INTO Ventas (Fecha, TipoFactura, ImporteTotal) VALUES 
	('2025-06-09 18:20:15', 'A', 0),
	('2025-06-10 08:30:00', NULL, 0),
	('2025-06-11 13:56:49', 'B', 0),
	('2025-06-12 20:08:37', 'A', 0),
	('2025-06-13 11:13:21', NULL, 0),
	('2025-06-14 16:42:10', 'B', 0),
	('2025-06-15 09:17:33', 'A', 0),
	('2025-06-16 19:05:44', 'B', 0),
	('2025-06-17 14:22:58', NULL, 0),
	('2025-06-18 10:45:12', 'A', 0);
GO

----------------------------------------------------------------

-- Ver ventas
SELECT * FROM Ventas;
GO

----------------------------------------------------------------

-- Insersion de productos vendidos en una venta
-- Versi�n sin procedimiento
--INSERT INTO ArticulosVenta (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (1, 2, 2, 550000);
--INSERT INTO ArticulosVenta (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (2, 4, 2, 120000);
--INSERT INTO ArticulosVenta (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (1, 5, 1, 310000);

-- Versi�n con procedimiento almacenado
-- Venta 1
EXEC SP_RegistrarVentaArticulo 1, 5, 2;
EXEC SP_RegistrarVentaArticulo 1, 12, 1;
EXEC SP_RegistrarVentaArticulo 1, 27, 4;

-- Venta 2
EXEC SP_RegistrarVentaArticulo 2, 3, 1;
EXEC SP_RegistrarVentaArticulo 2, 8, 2;

-- Venta 3
EXEC SP_RegistrarVentaArticulo 3, 15, 5;
EXEC SP_RegistrarVentaArticulo 3, 6, 2;
EXEC SP_RegistrarVentaArticulo 3, 24, 3;

-- Venta 4
EXEC SP_RegistrarVentaArticulo 4, 1, 3;

-- Venta 5
EXEC SP_RegistrarVentaArticulo 5, 4, 1;
EXEC SP_RegistrarVentaArticulo 5, 9, 1;
EXEC SP_RegistrarVentaArticulo 5, 19, 3;

-- Venta 6
EXEC SP_RegistrarVentaArticulo 6, 13, 2;
EXEC SP_RegistrarVentaArticulo 6, 2, 1;

-- Venta 7
EXEC SP_RegistrarVentaArticulo 7, 26, 3;
EXEC SP_RegistrarVentaArticulo 7, 7, 1;
EXEC SP_RegistrarVentaArticulo 7, 17, 2;

-- Venta 8
EXEC SP_RegistrarVentaArticulo 8, 11, 1;
EXEC SP_RegistrarVentaArticulo 8, 29, 2;

-- Venta 9
EXEC SP_RegistrarVentaArticulo 9, 14, 4;

-- Venta 10
EXEC SP_RegistrarVentaArticulo 10, 10, 4;
EXEC SP_RegistrarVentaArticulo 10, 18, 1;
EXEC SP_RegistrarVentaArticulo 10, 21, 2;
GO

----------------------------------------------------------------

-- Ver art�culos de ventas
SELECT * FROM ArticulosVenta;
GO