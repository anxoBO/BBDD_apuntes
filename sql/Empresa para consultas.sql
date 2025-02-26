DROP DATABASE IF EXISTS Empresa_a23anxobo;
GO
CREATE DATABASE Empresa_a23anxobo;
GO
USE Empresa_a23anxobo;
 

CREATE TABLE DEPARTAMENTOS
( IDDepartamento TINYINT,
  Nombre 		 VARCHAR(14),
  Localidad 	 VARCHAR(10),
 PRIMARY KEY (IDDepartamento));
 
CREATE TABLE EMPLEADOS
( IDEmpleado	 INT,
  Nombre 		 VARCHAR(8),
  Oficio 		 VARCHAR(10),
  FechaAlta 	 DATE,
  Salario 		 SmallMoney,
  Comision 		 DECIMAL(4,2),
  IDDepartamento TINYINT, -- Id departamento
  PRIMARY KEY (IDEmpleado),
  FOREIGN KEY (IDDepartamento) REFERENCES DEPARTAMENTOS(IDDepartamento)
  ON UPDATE CASCADE ON DELETE SET NULL
);
 
CREATE TABLE CLIENTES
(IDCliente		INT,
 Nombre 		VARCHAR(25),
 Localidad      VARCHAR(14),
 IDComercial    INT,
 Debe			Money,
 Haber			Money,
 Credito    	SmallMoney,
 PRIMARY KEY (IDCliente),
 FOREIGN KEY (IDComercial) REFERENCES EMPLEADOS(IDEmpleado) ON DELETE SET NULL
);
 
CREATE TABLE PRODUCTOS
(IDProducto  		INT,
 Descripcion  		VARCHAR(30),
 PrecioActual 		MONEY,
 Stock				INT,
 PRIMARY KEY (IDProducto) 
);
 
CREATE TABLE PEDIDOS
(IDPedido      	INT,
 IDProducto		INT,
 IDCliente 		INT,
 UNIDADES 	    INT,
 FECHA_PEDIDO   DATE,
 PRIMARY KEY (IDPedido),
 FOREIGN KEY (IDProducto) REFERENCES PRODUCTOS(IDProducto) ON DELETE CASCADE,
 FOREIGN KEY (IDCliente)  REFERENCES CLIENTES(IDCliente) ON DELETE CASCADE 
);
 
-- DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS VALUES(10, 'CONTABILIDAD', 'BARCELONA');
INSERT INTO DEPARTAMENTOS VALUES(20, 'INVESTIGACION', 'VALENCIA');
INSERT INTO DEPARTAMENTOS VALUES(30, 'VENTAS',        'MADRID'); 
INSERT INTO DEPARTAMENTOS VALUES(40, 'PRODUCCION',    'SEVILLA');

-- EMPLEADOS
INSERT INTO EMPLEADOS VALUES (7839,'REY',     'PRESIDENTE','1981-11-17',6000,   NULL, NULL);
INSERT INTO EMPLEADOS VALUES (7698,'GARRIDO', 'DIRECTOR',  '1981-05-01',3850.12,NULL, 30);
INSERT INTO EMPLEADOS VALUES (7782,'MARTINEZ','DIRECTOR',  '1981-06-09',2450,   NULL, 10);
INSERT INTO EMPLEADOS VALUES (7499,'ALONSO',   'VENDEDOR', '1981-02-23',1400,   0.04,30);
INSERT INTO EMPLEADOS VALUES (7521,'LOPEZ',   'EMPLEADO',  '1981-05-08',1350.50,NULL,10);      
INSERT INTO EMPLEADOS VALUES (7654,'MARTIN',  'VENDEDOR',  '1981-09-28',1500,   0.16, 30);
INSERT INTO EMPLEADOS VALUES (7844,'CALVO',   'VENDEDOR',  '1981-09-08',1800,   0,    30);
INSERT INTO EMPLEADOS VALUES (7876,'GIL',     'ANALISTA',  '1982-05-06',3350,   NULL, 20);
INSERT INTO EMPLEADOS VALUES (7900,'JIMENEZ', 'EMPLEADO',  '1983-03-24',1400,   NULL, 20);	

-- CLIENTES
INSERT INTO CLIENTES VALUES (101, 'DISTRIBUCIONES GOMEZ', 'MADRID', 7499, 0,0,5000);
INSERT INTO CLIENTES VALUES (102, 'LOGITRONICA S.L', 'BARCELONA', 7654,0,0,5000);
INSERT INTO CLIENTES VALUES (103, 'INDUSTRIAS LACTEAS S.A.', 'LAS ROZAS', 7844,0,0, 10000);
INSERT INTO CLIENTES VALUES (104, 'TALLERES ESTESO S.A.', 'SEVILLA', 7654, 0, 0, 5000);
INSERT INTO CLIENTES VALUES (105, 'EDICIONES SANZ', 'BARCELONA', 7499, 0,0,5000);
INSERT INTO CLIENTES VALUES (106, 'SIGNOLOGIC S.A.', 'MADRID', 7654,0,0,5000);
INSERT INTO CLIENTES VALUES (107, 'MARTIN Y ASOCIADOS S.L.', 'ARAVACA' , 7844,0,0, 10000);
INSERT INTO CLIENTES VALUES (108, 'MANUFACTURAS ALI S.A.', 'SEVILLA', 7654, 0, 0, 5000);

-- PRODUCTOS
INSERT INTO PRODUCTOS VALUES(10,'MESA DESPACHO MOD. GAVIOTA', 550, 50);
INSERT INTO PRODUCTOS VALUES (20, 'SILLA DIRECTOR MOD. BUFALO', 670, 25);
INSERT INTO PRODUCTOS VALUES (30, 'ARMARIO NOGAL DOS PUERTAS', 460, 20);
INSERT INTO PRODUCTOS VALUES (40, 'MESA MODELO UNI?N',340, 15);
INSERT INTO PRODUCTOS VALUES (50, 'ARCHIVADOR CEREZO',1050, 20);
INSERT INTO PRODUCTOS VALUES (60, 'CAJA SEGURIDAD MOD B222', 280, 15);
INSERT INTO PRODUCTOS VALUES (70, 'DESTRUCTORA DE PAPEL A3',450, 25);
INSERT INTO PRODUCTOS VALUES (80, 'MODULO ORDENADOR MOD. ERGOS', 550, 25);

--PEDIDOS
INSERT INTO PEDIDOS VALUES(1000, 20, 103, 3, '1999-10-06');
INSERT INTO PEDIDOS VALUES(1001, 50, 106, 2, '1999-10-06');
INSERT INTO PEDIDOS VALUES(1002, 10, 101, 4, '1999-10-07');
INSERT INTO PEDIDOS VALUES(1003, 20, 105, 4, '1999-10-16');
INSERT INTO PEDIDOS VALUES(1004, 40, 106, 8, '1999-10-20');
INSERT INTO PEDIDOS VALUES(1005, 30, 105, 2, '1999-10-20');
INSERT INTO PEDIDOS VALUES(1006, 70, 103, 3, '1999-11-03');
INSERT INTO PEDIDOS VALUES(1007, 50, 101, 2, '1999-11-06');
INSERT INTO PEDIDOS VALUES(1008, 10, 106, 6, '1999-11-16');
INSERT INTO PEDIDOS VALUES(1009, 20, 105, 2, '1999-11-26');
INSERT INTO PEDIDOS VALUES(1010, 40, 102, 3, '1999-12-08');
INSERT INTO PEDIDOS VALUES(1011, 30, 106, 2, '1999-12-15');
INSERT INTO PEDIDOS VALUES(1012, 10, 105, 3, '1999-12-06');
INSERT INTO PEDIDOS VALUES(1013, 30, 106, 2, '1999-12-06');
INSERT INTO PEDIDOS VALUES(1014, 20, 101, 4, '2000-01-07');
INSERT INTO PEDIDOS VALUES(1015, 70, 105, 4, '2000-01-16');
INSERT INTO PEDIDOS VALUES(1017, 20, 105, 6, '2000-01-20');
;

SELECT * FROM DEPARTAMENTOS;
SELECT * FROM EMPLEADOS;
SELECT * FROM CLIENTES
SELECT * FROM PRODUCTOS;
SELECT * FROM PEDIDOS;

-- Listar clientes de Madrid o Barcelona con credito mayor de 5000
SELECT * FROM Clientes
WHERE Credito = 5000
AND (Localidad='Madrid' OR Localidad='Barcelona');


--**************************************************************************
-- IN
--**************************************************************************
-- Seleccionar los clientes que tienen como ciudad Madrid o Barcelona
SELECT * FROM Clientes
WHERE Localidad IN ('Madrid', 'Barcelona');


-- Seleccionar los clientes que no tienen como ciudad Valencia, Alicante o Sevilla
SELECT * FROM Clientes
WHERE Localidad NOT IN ('Valencia', 'Alicante', 'Sevilla' );


--**************************************************************************
--BETWEEN
--**************************************************************************
-- Productos cuyo precio est? entre 400 y 600 euros:
SELECT * FROM Productos WHERE PrecioActual BETWEEN 400 AND 600;

-- Productos cuyo precio no est? entre 200 y 400 euros:
SELECT * FROM Productos WHERE PrecioActual NOT BETWEEN 200 AND 400;

--**************************************************************************
--LIKE
--**************************************************************************
-- Listar los clientes que sean S.L
	SELECT * FROM CLIENTES WHERE NOMBRE LIKE('%S.L%')

--**************************************************************************
--ORDER 
--**************************************************************************

SELECT * FROM Clientes
WHERE Localidad IN ('Madrid', 'Barcelona')
ORDER BY LOCALIDAD ;

SELECT * FROM Clientes
ORDER BY Localidad,  Nombre;

SELECT  DISTINCT Localidad FROM Clientes
WHERE Credito = 5000
ORDER BY Localidad DESC;


--**************************************************************************
--TOP
--**************************************************************************

-- Devuelve el 50% de los clientes que coincida con el mismo comercial ordenados
-- por localidad.

SELECT TOP(50) PERCENT
Idcliente, Nombre
FROM Clientes
WHERE IDComercial = '7654'
ORDER BY Localidad;


-- Devuelve  los datos de los que tengan el mismo comercial.
-- Pero si coinciden en el campo de ORDER, saca los que sean iguales
-- comprobar que pasa con 3 con TIES (saca 4)y con 3 sin TIES saca 3.

SELECT TOP(3) WITH TIES
idcliente, Nombre, IDComercial, Localidad
FROM Clientes
WHERE IDComercial = '7654'
ORDER BY Localidad;

-- Por ejemplo, si dos filas adicionales coinciden con los valores de las
-- columnas ORDER BY en la fila 5, es decir, coincide con el apellido del
-- 5?, el conjunto de resultados contendr? 7 filas.

--**************************************************************************
--ALIAS
--**************************************************************************

-- Alias Columnas

-- Sin Alias
SELECT  nombre
FROM empleados
WHERE nombre = 'Lopez';

-- Con Alias
SELECT  nombre  AS Empleado
FROM empleados
WHERE nombre = 'Lopez';

-- 
