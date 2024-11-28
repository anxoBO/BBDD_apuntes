--Microsoft SQL Server
--**************************************************************
-- En esta version omitimos el DC de la tabla Empleados en las dos FK.
-- Tambien omitimos el  DC de la tabla Traballa en las dos FK
--**************************************************************

--Crear BD

--Microsoft SQL Server

--Crear BD

create database a23anxoBO_Mazaricos;

go

use  a23anxoBO_Mazaricos;

-- Creaci?n de la BD de Mazaricos Software.


/*
1.- Crear la BD en Ms Sql Server. 
2.- Introducir Valores.
*/



-- Crear Tablas

	CREATE TABLE DEPARTAMENTO (
		Cod_Dept	CHAR(2) NOT NULL,
		Nome_Dept	VARCHAR(20) NOT NULL,
		CONSTRAINT PKDEPARTAMENTO PRIMARY KEY (Cod_Dept)
		);

	SELECT * FROM DEPARTAMENTO

	CREATE TABLE CATEGORIA (
		Cod_Cat		CHAR(2) NOT NULL,
		Nome_Cat	VARCHAR(30) NOT NULL,
		Soldo		SMALLMONEY NOT NULL,            
		Desconto	FLOAT NOT NULL CONSTRAINT CHKDESCONTO CHECK(Desconto <= 25),
		SReal AS (Soldo - (Soldo*Desconto/100)),
		Prezo_H_Extr SMALLMONEY CONSTRAINT CHKH_EXTRA CHECK (Prezo_H_Extr <= 90)
		CONSTRAINT PKCAT PRIMARY KEY (Cod_Cat)
		);

		
		SELECT * FROM CATEGORIA		
		

		
-- Ahora ya puedo crear empleado referenciando las claves foraneas:


	CREATE TABLE EMPLEADO (
	DNI			CHAR(9) NOT NULL,
	NSS			CHAR(15) NOT NULL,
	Nome_Empreg VARCHAR(30) NOT NULL,
	Enderezo	VARCHAR(100),
	Telefono	CHAR(9),
	Horas_Extr  SMALLINT,
	Cod_Dept    CHAR(2) NOT NULL,
	Cod_Cat     CHAR(2) NOT NULL

	CONSTRAINT PKEMPLEADO PRIMARY KEY (DNI),

	CONSTRAINT FKCDEPA FOREIGN KEY (Cod_Dept) REFERENCES Departamento(Cod_Dept) ON UPDATE CASCADE ON DELETE NO ACTION,

	CONSTRAINT FKCCATE FOREIGN KEY (Cod_Cat) REFERENCES Categoria(Cod_Cat) ON UPDATE CASCADE ON DELETE NO ACTION,
); 
    SELECT * FROM EMPLEADO;	


	CREATE TABLE CLIENTE (
		CIF				CHAR(9) NOT NULL CONSTRAINT PKCIF PRIMARY KEY,
		Nome			VARCHAR(20) NOT NULL, 
		Apellidos		VARCHAR(20) NOT NULL, 
-- A?adimos una columna calculada, en este caso junta dos cadenas con la funcion CONCAT
-- Fijaros que no le damos tama?o.
		NombreCompleto AS CONCAT(Nome, Apellidos),
		Enderezo		VARCHAR(100) SPARSE,-- Sparse da un tratamiento especial a los NULOS
		Telefono		CHAR(9),
		fecha_nac		DATE
);
		
   SELECT * FROM CLIENTE	
		
	CREATE TABLE APLICACION (
		Cod_Aplic	CHAR(4)		NOT NULL,
		Nome_Aplic	VARCHAR(30) NOT NULL,
		CIF			CHAR(9)		NOT NULL  CONSTRAINT DFCIF default 'XXXXXXXXX' ,
		
		CONSTRAINT PKAPLIC PRIMARY KEY (Cod_Aplic),
		CONSTRAINT FKCIF FOREIGN KEY (CIF) REFERENCES CLIENTE(CIF) on update cascade on delete set default
		);
	
	   SELECT * FROM APLICACION;	

	CREATE TABLE PROXECTO (
		Cod_Aplic CHAR(4) NOT NULL, 
		Cod_Proxec CHAR(4) NOT NULL,
		Nome_Proxec VARCHAR(30) NOT NULL,
		Horas_Estimadas INT,
		Horas_reais INT,

		CONSTRAINT PKPROX PRIMARY KEY (Cod_Aplic,Cod_Proxec),
		CONSTRAINT FKAPLI FOREIGN KEY (Cod_Aplic) REFERENCES APLICACION(Cod_Aplic)
		on update cascade on delete cascade 
		);

		   SELECT * FROM PROXECTO;
		

	CREATE TABLE TRABALLA (
		Cod_Aplic CHAR(4)		NOT NULL,
		Cod_Proxec CHAR(4)		NOT NULL,
		DNI CHAR(9)				NOT NULL,
		CONSTRAINT PKTRABALLA PRIMARY KEY (Cod_Aplic,Cod_Proxec,DNI),

		CONSTRAINT FKPROX FOREIGN KEY (Cod_Aplic,Cod_Proxec)  REFERENCES PROXECTO (Cod_Aplic,Cod_Proxec)
		on update no action  on delete no action,
		CONSTRAINT FKEMPL FOREIGN KEY (DNI)	REFERENCES EMPLEADO(DNI) on update cascade on delete cascade
		);

		SELECT * FROM TRABALLA;	

--- Obs?rvese que se introducen valores para t?dos los atributos de cada tabla en el mismo orden
--- en que est?n definidos los atributos en la tabla. Cuando no se sabe un valor, ponemos NULL.

--- Insertar valores en departamento. ---------------------------------------------

--- Si no se ponen los nombres de los campos se debe insertar la informaci?n en el mismo orden en
--- el que se crearon os campos de la t?bla.

		INSERT INTO DEPARTAMENTO values ('PR','Programaci?n');
		INSERT INTO DEPARTAMENTO values ('RH','Rec Humanos');
		INSERT INTO DEPARTAMENTO values ('IN','Intendencia'); -- NO HAY EMPLEADOS
		SELECT * FROM DEPARTAMENTO;

---Si se ponen los nombres de los campos se d?be insertar la informaci?n en el mismo orden en
-- el que se ponen los nombres de los campos en la sentencia.

		INSERT INTO DEPARTAMENTO (Nome_Dept,Cod_Dept)values ('Contabilidade','CT');

--- Insertar valores en categoria MS SqlServer.--------------------------------------

		SELECT * FROM CATEGORIA;

		INSERT INTO CATEGORIA values ('AN','Anal?sta', 2500, 23.57, 90);
		INSERT INTO CATEGORIA values ('PR','Programador', 1500, 13.21, 25);
		INSERT INTO CATEGORIA values ('CT','Contable', 1500, 20, 80);
		INSERT INTO CATEGORIA values ('MT','Tecnico', 1500, 10.5, 65);--NO HAY EMPLEADOS

		INSERT INTO CATEGORIA values ('JE','Jefe', 1500, 30, 65);-- Da error en el check de desconto
		INSERT INTO CATEGORIA values ('JE','Jefe', 1500, 20, 91);-- Da error en el check de hora extra


--- Insertar valores en empregado ---------------------------------------------------



		INSERT INTO EMPLEADO VALUES ('12345678Z', '00/123456789012', 'Manolo Alvarez', 'Rua, 2', NULL, 20, 'PR', 'PR');

		INSERT INTO EMPLEADO (DNI, NSS, Nome_Empreg, Enderezo, Telefono, Cod_Dept,Cod_Cat)
		VALUES ('11111111Z', '00/123456789000', 'Ana Pin', 'Rua,2', '986123456', 'PR', 'AN');

		INSERT INTO EMPLEADO (DNI, NSS, Nome_Empreg, Enderezo, Telefono, Cod_Dept,Cod_Cat)
		VALUES ('22222222B', '00/123456789000', 'Luis Alvarez', 'Calle,2', '986111111', 'RH', 'CT');

		INSERT INTO EMPLEADO (DNI, NSS, Nome_Empreg, Enderezo, Telefono, Cod_Dept,Cod_Cat)
		VALUES ('33333333C', '00/123456789000', 'Juan Solo', 'Villa,2', '986122222', 'RH', 'CT');

		SELECT * FROM Empleado;
	
		
		
--- Insertar valores en cliente ---------------------------------------------------


		SELECT * FROM CLIENTE;
		INSERT INTO CLIENTE VALUES ('A11111111','PEPE','LOPEZ PEREZ', 'Vilar 25','981111111', '07/10/56');
		INSERT INTO CLIENTE VALUES ('A22222222','JUAN','RUIZ PEREZ','Nova 2','981222222', '06/12/60');
		INSERT INTO CLIENTE VALUES ('A33333333','LUISE','ABAL RUIZ',NULL,'981333333', NULL);
		INSERT INTO CLIENTE VALUES ('A44444444','ROSA','VIEITES VEIGA','NULL','981444444', '09/2/59');--No tiene Aplicacion
		SELECT * FROM CLIENTE;
--- Insertar valores en aplicacion ------------------------------------------------
		SELECT * FROM APLICACION;
		INSERT INTO APLICACION VALUES ('Con1','Xesti?n Empresa Construc.','A11111111');
		INSERT INTO APLICACION VALUES ('Car1','Xesti?n Empresa Carpint.','A22222222');
		INSERT INTO APLICACION VALUES ('Pro1','Xesti?n de Promoci?ns','A22222222');--No tiene Proyecto
		INSERT INTO APLICACION VALUES ('Pro2','Xesti?n de Promoci?ns','A11111111');--No tiene Proyecto
		INSERT INTO APLICACION VALUES ('Pro3','Xesti?n de Promoci?ns','A33333333');--No tiene Proyecto
		
	
--- Insertar valores en proxecto ---------------------------------------------------------
		SELECT * FROM PROXECTO;
		INSERT INTO PROXECTO VALUES ('Con1','Req1','An?lise de Req. de Constru 6',20,25);
		INSERT INTO PROXECTO VALUES ('Con1','ER1','Modelo ER de Constru',30,NULL);
		INSERT INTO PROXECTO VALUES ('Car1','Req1','An?lise de Req. dunha Carpint.',15,5);
		INSERT INTO PROXECTO VALUES ('Car1','Req2','An?lise de Req. dunha Carpint.',15,5);
		INSERT INTO PROXECTO VALUES ('Car1','Req3','An?lise de Req. dunha Carpint.',15,5); -- No tiene TRABALLA

		
		
--- Insertar valores en traballa ------------------------------------------------
		
		SELECT * FROM TRABALLA;

		INSERT INTO TRABALLA VALUES ('Con1','Req1','11111111Z');
		INSERT INTO TRABALLA VALUES ('Con1','ER1', '11111111Z');
		INSERT INTO TRABALLA VALUES ('Car1','Req1','11111111Z');
		INSERT INTO TRABALLA VALUES ('Car1','Req2','11111111Z');
		INSERT INTO TRABALLA VALUES ('Car1','Req1','22222222B');
		INSERT INTO TRABALLA VALUES ('Car1','Req1','33333333C');
		
		SELECT * FROM DEPARTAMENTO
		SELECT * FROM CATEGORIA
		SELECT * FROM EMPLEADO
		SELECT * FROM CLIENTE
		SELECT * FROM APLICACION
		SELECT * FROM PROXECTO
		SELECT * FROM TRABALLA
		
		
		

	

-- Consultas sobre datos de la BD, estos son los Metadatos.


-- Muestra las tablas y vistas de la BD.

		select * from information_schema.TABLES;

-- Muestra todas las constraints (restricciones) de las tablas de la BD

		select CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE  from information_schema.TABLE_CONSTRAINTS ORDER BY CONSTRAINT_NAME;

-- Muestra solo  las LLaves foraneas de la BD.

		
		select * from information_schema.TABLE_CONSTRAINTS;

		select * from information_schema.REFERENTIAL_CONSTRAINTS;

-- Lo mismo, pero preguntando solo por algunas columnas de las claves foraneas.

		select CONSTRAINT_NAME,  UPDATE_RULE, DELETE_RULE from information_schema.REFERENTIAL_CONSTRAINTS; 

		select information_schema.TABLE_CONSTRAINTS.CONSTRAINT_NAME, UPDATE_RULE, DELETE_RULE,TABLE_NAME
		FROM information_schema.TABLE_CONSTRAINTS, information_schema.REFERENTIAL_CONSTRAINTS
		WHERE information_schema.REFERENTIAL_CONSTRAINTS.CONSTRAINT_NAME = information_schema.TABLE_CONSTRAINTS.CONSTRAINT_NAME


-- Muestra las foreign keys que tengo definidas.		
 
--CONSTRAINT_NAME			UPDATE_RULE			DELETE_RULE			TABLENAME
	--FKCDEPA					CASCADE				NO ACTION			EMPLEADO
	--FKCCATE					CASCADE				NO ACTION			EMPLEADO
	--FKCIF						CASCADE				SET DEFAULT			APLICACION
	--FKAPLI					CASCADE				CASCADE				PROXECTO
	--FKPROX					NO ACTION			NO ACTION			TRABALLA
	--FKEMPL					CASCADE				CASCADE				TRABALLA


