/**********************************************/
/********* EJERCICIOS PROGRAMACION  ***********/
/**********************************************/ 

-- 1- Utilizando la base de datos del Almacen, guardar en una variable el producto de mayor precio
use a23anxobo_almacen;

Declare @variable int = (select max(p.PrecioActual) from PRODUCTOS p)
Print @variable
-- 2- Comprobar si est? dado de alta el empleado JAVIER CAL y si no insertarlo
DECLARE @idEmpleado INT, @name VARCHAR (50)
	SET @idEmpleado = 1150
	SET @name = 'Cal, Javier'

IF EXISTS (SELECT * FROM EMPLEADOS WHERE IDEmpleado = @idEmpleado)
	BEGIN
		PRINT 'Empleado '+ @name +'ya existe correctamente'
	END
ELSE
	BEGIN
		INSERT INTO EMPLEADOS (IDEmpleado, Nombre)
			VALUES (@idEmpleado, @name)
		PRINT 'Empleado dado de alta correctamente'
	END


-- 3- Recorrer la tabla productos y mostrar por pantalla los que tienen menos de 20 unidades de stock
SELECT * FROM PRODUCTOS WHERE Stock <=30;

DECLARE @total INT = 0, @id INT = 0, @nombre varchar(50);
 SET @total = (SELECT count(IDProducto) FROM PRODUCTOS WHERE Stock <=30);
 PRINT 'Hay '+ cast(@total as VARCHAR(3)) + ' productos con stock bajo'
 WHILE (@total > 0)
	 BEGIN
		SELECT TOP(1) @id=IdProducto, @nombre= Descripcion 
			FROM PRODUCTOS 
			WHERE Stock <=30 AND IDProducto > @id ORDER BY IDProducto;
		PRINT CAST(@total as VARCHAR(4)) + ' El producto  '+ @nombre  + ' - '+ CAST(@id as VARCHAR(4)) + ' tiene poco stock';
		SET @total = @total - 1
	 END
-- 4- Dada la siguiente tabla de descuentos, devolver en una variable el descuento que se va a aplicar seg?n las unidades del pedido
	--0-4 unidades -> no descuento
	--4-19 unidades -> 0,1
	--20-49 unidades -> 0,3
	--51 o m?s unidades ->0,5
	
DECLARE @unidades int=29;
DECLARE @descuento varchar(50);
SET @descuento = CASE 
		WHEN @unidades between 0 and 9 THEN
			'0'
		WHEN @unidades between 10 and 19 THEN 
			'0.1'
		WHEN @unidades between 20 and 49 THEN
			'0.3'
		WHEN @unidades >50 THEN 
			'0.5'
		ELSE 
			'0'
		END
-- 5- Por cada pedido del almacen mostrar una mensaje con su id, el n?mero de unidades y el porcentaje de descuento de cada uno
DECLARE @count INT;
	DECLARE @id INT =0, @unidades INT =0;
	SELECT @count = COUNT(*) FROM PEDIDOS;
	SET @count = (SELECT COUNT(*) FROM Pedidos);
	PRINT @count;

-- 6- Comprobar si existen productos los productos cuyo stock sea 0 y eliminarlos
 DECLARE @idproducto INT;
SET NOCOUNT ON
while  EXISTS (SELECT IDProducto FROM PRODUCTOS WHERE Stock=0)
	BEGIN
		SET @idproducto = (SELECT TOP(1) IDProducto FROM PRODUCTOS WHERE Stock=0)
		DELETE FROM PRODUCTOS WHERE IDProducto = @idproducto
		PRINT 'Producto eliminado: ' + cast(@idproducto as varchar(5))
	END

  

 -- Prueba
  select * from PRODUCTOS;
  insert into productos values (3,'c',20,0),(2,'b',20,0), (1,'a',20,0) ;

-- Otra solucion
    DECLARE @idproducto INT;

	WHILE  EXISTS (SELECT IDProducto FROM PRODUCTOS WHERE Stock=0)
		BEGIN
			SET @idproducto = (SELECT TOP(1) IDProducto FROM PRODUCTOS WHERE Stock=0)
			DELETE FROM PRODUCTOS WHERE IDProducto = @idproducto
			PRINT 'Producto eliminado: ' + cast(@idproducto as varchar(5))
			continue 
		END
	PRINT 'No hay ya productos'


-- 7- Comprobar el n?mero de pedidos en un periodo de fechas entre 2021-04-01 y 2021-04-30
  -- Sacar reportes de ese mes, mostrar la fecha y el n?mero de pedidos en ese d?a ...
 
    
-- 8- Mostrar el reporte anterior solo para los d?as que tienen pedidos
 --Con el formato El d?a Martes 20 Abr 2021 se han realizado 1 pedidos
 
-- 9- Recorrer la tabla clientes y mostrar por pantalla el n?mero de pedidos que ha realizado.

-- 10- Recorrer la tabla empleados y mostrar por pantalla su nombre y el nombre de los clientes que tienen asignados.
