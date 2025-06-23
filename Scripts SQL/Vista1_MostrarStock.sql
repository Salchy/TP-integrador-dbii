-- Debería devolver un listado con el stock que hay actualmente (un join entre Articulos y Stock) 
-- Quizá sea un Left Join de Artículos con Stock, para que muestre todos los artículos, tengan stock o no


CREATE VIEW VW_MostrarStock
AS
    SELECT Articulos.Nombre AS Articulo, Stock.Cantidad AS Cantidad
    FROM Articulos
        INNER JOIN Stock ON Articulos.IDArticulo = Stock.IDArticulo;
GO