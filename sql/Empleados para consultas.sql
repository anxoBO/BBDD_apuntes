--Descricion:
	--Os Campos son os seguintes:
	
	--Taboa  TCENTR(Centro)

	--NUMCE (N?mero do Centro de traballo)
	--NOMCE (Nome do Centro de traballo)
	--SE?AS (Direcci?n do Centro de traballo)


	--T?boa TDEPTO (Departamento)

	--	NUMDE (N?mero de departamento)
	--	NUMCE (N?mero de centro ? que esta asignado)
	--	DIREC (N?mero de empregado que o dirixe)
	--	TIDIR (Tipo de director codificado P:Permanente, F:En Funci?ns)
	--	PRESU (Presuposto anual do departamento, millones de pesetas)
	--	DEPDE (N?mero do departamento do que depende)
	--	NOMDE (Nome enteiro do departamento)


	--T?boa TEMPLE(empregados)

	--	NUMEM (N?mero de empregado)
	--	NUMDE (N?mero de departamento ao que pertence)
	-- 	EXTEL (Extensi?n telef?nica)
	-- 	FECNA (Fecha de Nacemento)
	-- 	FECIN (Fecha de inicio na empresa)
	-- 	SALAR (Salario, miles de pesetas)
	-- 	COMIS (Comisi?ns, miles de pesetas)
	-- 	NUMHI (N?mero de fillos)
	-- 	NOMEM (Nome do empregado)

--O SALARIO ref?rese a columna SALAR, mentres que o SOLDO ou SALARIO TOTAL, ? suma de SALAR m?is COMIS.


--Creaci?n:


-- DataBase

		drop DATABASE a23anxobo_empleados_2025;
		GO
-- 
		USE a23anxobo_empleados_2025;


-- Tables



		CREATE TABLE TCENTR (
		  NUMCE INT			NOT NULL,
		  NOMCE VARCHAR(255)	NULL,
		  SE�AS VARCHAR(255)	NULL,
		  PRIMARY KEY (NUMCE)
		);


		CREATE TABLE TDEPTO (
		  NUMDE INT			NOT NULL,
		  NUMCE INT			NULL,
		  DIREC INT			NULL,    ---Es una FK, que no pongo pues aun no tengo creada la tabla.
		  TIDIR VARCHAR(1)	NULL,
		  PRESU DECIMAL(19, 4)	NULL,
		  DEPDE INT			NULL,
		  NOMDE VARCHAR(50)	NULL,
		  PRIMARY KEY (NUMDE),

		);





		CREATE TABLE TEMPLE (
		  NUMEM INT				NOT NULL,
		  NUMDE INT				NULL,
		  EXTEL INT				NULL,
		  FECNA DATE		NULL,
		  FECIN DATE		NULL,
		  SALAR DECIMAL(19, 4)	NULL,
		  COMIS DECIMAL(19, 4)	NULL,
		  NUMHI TINYINT			NULL,
		  NOMEM VARCHAR(255)	NULL,
		  PRIMARY KEY (NUMEM),
		  
		  );


 
-- INSERT


-- CENTROS			      NUMCE  NOMCE 					    SE?AS 
--------------------------------------------------------------------------------------------
INSERT INTO TCENTR VALUES (10, 	'SEDE CENTRAL',				'C. ALCALA, 820, MADRID');
INSERT INTO TCENTR VALUES (20, 	'RELACION CON CLIENTES', 	'C. ATOCHA, 405, MADRID');

select * from tcentr

-- DEPARTAMENTOS	     NUMDE NUMCE DIREC TIDIR PRESU    DEPDE   NOMDE
--------------------------------------------------------------------------------------------
INSERT INTO TDEPTO VALUES (110,  20, 180,  'P',   15,	   100,  'DIRECC. COMERCIAL');
INSERT INTO TDEPTO VALUES (122,  10, 350,  'P',   6, 	   120,  'PROCESO DE DATOS');
INSERT INTO TDEPTO VALUES (100,  20, 260,  'P',   12,      NULL, 'DIRECCION GENERAL');
INSERT INTO TDEPTO VALUES (111,  20, 180,  'F',   11,	   110,  'SECTOR INDUSTRIAL');
INSERT INTO TDEPTO VALUES (112,  20, 270,  'P',   9, 	   110,  'SECTOR SERVICIOS');
INSERT INTO TDEPTO VALUES (120,  10, 150,  'F',   3, 	   100,  'ORGANIZACI?N');
INSERT INTO TDEPTO VALUES (121,  10, 150,  'P',   2, 	   120,  'PERSONAL');
INSERT INTO TDEPTO VALUES (130,  10, 310,  'P',   2, 	   100,  'FINANZAS');
INSERT INTO TDEPTO VALUES (140,  10, NULL,  NULL, NULL,	   100,	 'MARKETING');

-- Cuidado al insertar la Direccion General primero y luego todos sus dependientes.
select * from TDEPTO


-- EMPREGADOS	           NUMEM NUMDE EXTEL FECNA		 FECIN		  SALAR COMIS	NUMHI	NOMEM
-----------------------------------------------------------------------------------------------------------
INSERT INTO TEMPLE VALUES (110, 112,  350, '10-11-1929', '15-02-1950', 987,  NULL,   3,     'PONS, CESAR');
INSERT INTO TEMPLE VALUES (120, 112,  840, '09-06-1935', '01-10-1968', 350,  110,    2,     'LASA, MAYO');
INSERT INTO TEMPLE VALUES (130, 112,  810, '09-09-1945', '01-02-1969', 290,  110,    2,     'TEROL, LUCIANO');
INSERT INTO TEMPLE VALUES (150, 121,  340, '10-08-1930', '15-01-1948', 440,  NULL,   0,     'PEREZ, JULIO');
INSERT INTO TEMPLE VALUES (160, 110,  740, '09-07-1939', '11-11-1968', 310,  110,    2,     'AGUIRRE, AUREO');
INSERT INTO TEMPLE VALUES (180, 110,  508, '18-10-1934', '18-03-1956', 480,  50,     2,     'PEREZ, MARCOS');
INSERT INTO TEMPLE VALUES (190, 121,  350, '12-05-1932', '11-02-1962', 300,  NULL,   4,     'VEIGA, JULIANA');
INSERT INTO TEMPLE VALUES (210, 100,  200, '28-09-1940', '22-01-1959', 380,  0,      2,     'GALVEZ, PILAR');
INSERT INTO TEMPLE VALUES (240, 111,  760, '26-02-1942', '24-02-1966', 280,  100,    3,     'SANZ, LAVINIA');
INSERT INTO TEMPLE VALUES (250, 100,  250, '27-10-1946', '01-03-1967', 450,  0,      0,     'ALBA, ADRIANA');
INSERT INTO TEMPLE VALUES (260, 100,  220, '03-12-1943', '12-07-1968', 720,  0,      6,     'LOPEZ, ANTONIO');
INSERT INTO TEMPLE VALUES (270, 112,  800, '21-05-1945', '10-10-1966', 380,  80,     3,     'GARCIA, OCTIAVIO');
INSERT INTO TEMPLE VALUES (280, 130,  410, '11-01-1948', '08-10-1971', 290,  0,      5,     'FLOR, DOROTEA');
INSERT INTO TEMPLE VALUES (285, 122,  620, '25-10-1949', '15-02-1968', 380,  0,      0,     'P0LO, OTILIA');
INSERT INTO TEMPLE VALUES (290, 120,  910, '30-11-1947', '14-02-1968', 270,  0,      3,     'GIL, GLORIA');
INSERT INTO TEMPLE VALUES (310, 130,  480, '21-11-1946', '15-01-1971', 420,  0,      0,     'GARCIA, AUGUSTO');
INSERT INTO TEMPLE VALUES (320, 122,  620, '25-12-1957', '05-02-1978', 405,  0,      2,     'SANZ, CORNELIO');
INSERT INTO TEMPLE VALUES (330, 112,  850, '19-08-1948', '01-03-1972', 280,  90,     0,     'DIEZ, AMELIA');
INSERT INTO TEMPLE VALUES (350, 122,  610, '13-04-1949', '10-09-1984', 450,  0,      1,     'CAMPS, AURELIO');
INSERT INTO TEMPLE VALUES (360, 111,  750, '29-10-1958', '10-10-1968', 250,  100,    2,     'LARA, DORINDA');
INSERT INTO TEMPLE VALUES (370, 121,  360, '22-06-1967', '20-01-1987', 190,  0,      1,     'RUIZ, FABIOLA');
INSERT INTO TEMPLE VALUES (380, 112,  880, '30-03-1968', '01-01-1988', 180,  0,      0,     'MARTIN, MICAELA');
INSERT INTO TEMPLE VALUES (390, 110,  500, '19-02-1966', '08-10-1986', 215,  0,      1,     'MORAN, CARMEN');
INSERT INTO TEMPLE VALUES (400, 111,  780, '18-08-1969', '01-11-1987', 185,  0,      0,     'LARA, LUCRECIA');
INSERT INTO TEMPLE VALUES (410, 122,  660, '14-07-1968', '13-10-1988', 175,  0,      0,     'MU?OZ, AZUCENA');
INSERT INTO TEMPLE VALUES (420, 130,  450, '22-10-1966', '19-11-1988', 400,  0,      0,     'FIERRO, CLAUDIA');
INSERT INTO TEMPLE VALUES (430, 122,  650, '26-02-1967', '19-11-1988', 210,  0,      1,     'MORA, VALERIANA');
INSERT INTO TEMPLE VALUES (440, 111,  760, '26-09-1966', '28-02-1986', 210,  100,    0,     'DURAN, LIVIA');
INSERT INTO TEMPLE VALUES (450, 112,  880, '21-10-1966', '28-02-1986', 210,  100,    0,     'PEREZ, SABINA');
INSERT INTO TEMPLE VALUES (480, 111,  760, '04-04-1965', '28-02-1986', 210,  100,    1,     'PINO, DIANA');
INSERT INTO TEMPLE VALUES (490, 112,  880, '06-06-1964', '01-01-1988', 180,  100,    0,     'TORRES, HORACIO');
INSERT INTO TEMPLE VALUES (500, 111,  750, '08-10-1965', '01-01-1987', 200,  100,    0,     'VAZQUEZ, HONORIA');
INSERT INTO TEMPLE VALUES (506, NULL, 502, '15-02-1980', '12-05-2006', 500,  200,    2,     'Lopez, Antonio');
INSERT INTO TEMPLE VALUES (510, 110,  550, '04-05-1966', '01-11-1986', 200,  0,      1,     'CAMPOS, ROMULO');
INSERT INTO TEMPLE VALUES (550, 111,  780, '10-01-1970', '21-01-1988', 100,  120,    0,     'SANTOS, SANCHO');


--A?adimos la FK de director

		ALTER TABLE TDEPTO  ADD CONSTRAINT  FK_DIREC  FOREIGN KEY (DIREC) REFERENCES TEMPLE(NUMEM);
		alter table TDEPTO add constraint FK_NUMCE Foreign key (NUMCE) references TCENTR(NUMCE);
		ALTER TABLE TEMPLE  ADD CONSTRAINT  FK_NUMDE  FOREIGN KEY (NUMDE) REFERENCES TDEPTO(NUMDE);