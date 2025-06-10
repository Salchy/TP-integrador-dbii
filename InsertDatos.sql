USE TPIGrupo29;

INSERT INTO Marcas (Nombre) VALUES
	('Samsung'),
	('Apple'),
	('Dell'),
	('Motorola'),
	('Lenovo');

SELECT * FROM MARCAS;

INSERT INTO Articulos (IDMarca, Nombre, Precio) VALUES
	(1, 'Smart TV 55"', 250000),
	(2, 'iPhone 14', 550000),
	(3, 'Netbook Latitude 3420', 350000),
	(4, 'Motorola G60s', 200000),
	(5, 'Notebook Ideapad 3', 310000);

SELECT * FROM Articulos;

INSERT INTO Stock (IDArticulo, Cantidad) VALUES
	(1, 8),
	(2, 3),
	(3, 12),
	(4, 2),
	(5, 8);

SELECT * FROM Stock;