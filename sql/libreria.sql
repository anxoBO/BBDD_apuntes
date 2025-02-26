create database a23anxobo_Biblioteca;

go

use a23anxobo_Biblioteca;


--1.- Obter o modelo relacional do ER-E adxunto. Pon as restrici?ns referenciais que creas necesarias e explic?ndoas.

-- 1.a.- Para as extensi?ns existentes no modelo, dicir de cada un dos casos, si e aplicable o no e explicar por qu?.
-- Escoller para pasalas, o caso que de menos t?boas. 
 --Especificar aparte cal ser?a o resultado de pasar Amigo polo caso A.


-- El campo Autor de Libro da lugar a dos tablas (Autor y Libro_Autor)ya que es 
-- un atributo multivaluado

-- Para la extension de libro (Mercado/Regalado) disjunta con completitud total
-- de libro (Mercado/Regalado):
-- Se puede pasar por el A, dar? las tablas Libro, Mercado y Regalado.
-- No se puede por el B, es disjunta total pero la superclase tiene relaciones propias.
-- Se puede por el C, es  disjunta y da una unica tabla. Escogemos este caso.
-- No se puede por el D, no es overlay.

-- Para la extension de libro (Fotocopia/Original)  disjunta con completitud total :
-- Se puede pasar por el A, dar? las tablas Libro, Fotocopia y Original.
-- No se puede por el B, es disjunta total pero la superclase tiene relaciones propias.
-- Se puede por el C, es  disjunta y dar?a una unica tabla. Escogemos este caso.
-- No se puede por el D, no es overlay.

-- Para la extension de Amigo overlay con completitud total  (Amigo_Reg, Amigo_Pre):
-- Se puede  pasar por el A, dar? las tablas Amigo, Amigo_Reg y Amigo_Pre.
-- Se puede por el B, ya que la superclase no tiene relaciones  relaciones propias.
-- No es recomendable ya que no es disjunta  y habr? datos de los amigos que
-- se repetirian.
-- No se puede pasar por el C, no es disjunta
-- Se puede pasar por el D ya que es overlay y dar? como resultado una unica tabla. 
-- Escogemos este caso.

-- AMIGO POR EL CASO A:

-- Amigos: Cod_Ami(Primary key), Nome*, Enderezo, Telefono, Antiguedad.
-- Amigo_Reg: Cod_Amigo_Reg(Primary key) FK Amigos UC DC.
-- Amigo_Pre: Cod_Amigo_Pre(Primary key) FK Amigos UC DC.

--  1.b.-Obter o modelo relacional correspondente se?alando todos os elementos 
-- significativos que existan nel.


--***********************
--***Modelo Relacional***
--***********************

-- Amigo: Cod_Ami(PK), Nome*, Enderezo, Telefono*, Antiguedad, Presta(S/N)*,
-- Regala(S/N)*.

-- Libreria: Cod_Lib(PK), Nome*, Enderezo, Telefono*, Persoa_Cont*.

-- Editorial: Cod_Edi(PK), Nome*.  --Creamos la tabla Editorial por codificaci?n.

-- Libro: Cod_Libro(PK), Titulo*, Data_Adq, A?o_Edc, Cod_Edi(FK Editorial, UC/DNA),
-- Fot_Ori(F/O)*, Esp_Can(E/C), Mer_Reg(M/R)*, Prezo, Cod_Ami(FK Amigo, UC/DNA), 
-- Cod_Lib(FK Libreria, UC/DNA).

--** Ninguna FK puede ser Not Null pues Libro/Prestamo y Libro/Merca 
--** no tienen participacion total y de Editorial no nos exigen nada.

--** Fot_Ori(M/R)*, Mer_Reg(M/R)* los hacemos obligatorios pues las dos extensiones
--** tienen completitud total.

-- Autor: Cod_Autor(PK), Nome*.

-- Libro_Autor: (Cod_Autor(FK Autor, UC/DNA), Cod_Libro(FK Libro, UC/DC))(PK).
-- Las restricciones UC por la IR y las DC y DNA ya que las FK forman parte de
-- la PK y la IE de esta.

-- ********************************************************************************
--Explicar que diferencia hay entre las dos IR: DC e DNA en la relacion Libro_Autor
--*********************************************************************************


-- Prestamo: (Cod_Ami_Pre(FK Amigo, UC/DC), Cod_Libro(FK Libro, UC/DC), Data_Pre)(PK),  Data_Dev.
-- Las restricciones UC por la IR y las DC ya que las FK forman parte de la PK y la IE de esta.

-- Indice: (Cod_Libro(FK Libro, UC/DC), Cod_Tit)(PK), Texto_Tit*, Paxina*, (Cod_LPai, 
-- Cod_TPai)(FK Indice, UC/DSN o DNA).

-- FK Libro, UC/DC: La restriccion UC por la IR y las DC ya que la FK forma parte de la PK
-- debido a la debilidad por identidad y la IE de esta.
-- FK Indice, UC/DSNo DNA La restriccion UC por la IR y las DSN tambien por la IR




-- * Campos obligatorios

--2.-  Creaci?n da BD  nome :<nome de usuario>_Biblio_2025.
--2.a.- Crear as taboas con las restrici?ns resultantes do modelo ER_E .

			-- UC y DC en las tablas: Indice, Prestamo y LibrosAutores.

			-- En indice determinada por por la debilidad por identidad.
            -- En Prestamo y LibrosAutores por su condici?n de relacionar unos con otros,
			-- si uno desaparece tiene que desaparecer la relaci?n por IE.

			-- En libros Cod_Editorial, Cod_Amigo que regala y Cod_Libreria UC y
			-- Delete No Action. Siguiendo la politica de nuestros ejercicios.


-- El valor enderezo de la tabla amigos tome por defecto el valor 'Desco?ecido'?.
-- A?adir mascaras a los telefonos.
--



create table Amigos 	(
			Cod_Ami		tinyint,
			Nome		varchar(25)  not null,
			Enderezo	varchar(30)  default 'Desco?ecido',
			Telefono	char(9)      not null,
			Presta		bit			 not null, 
			Regala		bit			 not null,
			Fec_Ini		date     
			CONSTRAINT PK_AMIGOS primary key	(Cod_Ami)
			);

-- Prestador y regalador si el valor es uno.
-- Cambio Fec_Ini por Antig?edad para tener la posibilidad de tenerlos
-- siempre actualizado.

create table Librerias (
			Cod_Lib	    smallint			identity,
			Nome		varchar(25)			not null,
			Enderezo	varchar(35),
			Telefono	char(10)			not null  CONSTRAINT CH_TELEFONO CHECK (TELEFONO
											LIKE ('[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9]')),
			Persoa		varchar(15)		Not Null,
			CONSTRAINT PK_Librerias primary Key	(Cod_Lib)
			);

CREATE TABLE Editorial (
			Cod_edi			tinyint,
			Nome			varchar(50)  Not Null,
			CONSTRAINT PK_EDITORIAL PRIMARY KEY(Cod_edi),
);
 
 -- Poner una librer?a por defecto  que ser?  la 99.
create table Libros 	(
			Cod_Libro	 smallint not null,
			Titulo		 varchar(100) not null,
			Data_Adq	 date CHECK (DATA_ADQ >= '01-01-2000' and Data_Adq <= getdate()),
			Ano_Edc		 char(4) ,
			Cod_edi		 tinyint,
			Prezo		 decimal(5,2),
			Fot_Ori		 bit		Not null  , --Completitude total
			Mer_Reg		 bit		Not null,   --Completitude total
			Esp_Can		 bit,
			Cod_Ami 	 tinyint,
			Cod_Lib      smallint	CONSTRAINT DF_Libros_Cod_Libreria default 99 ,	

			CONSTRAINT PK_lIBROS primary key	(Cod_Libro),

			CONSTRAINT FK_Libros_Edi foreign key (Cod_edi) references  Editorial(Cod_edi)
			 on update cascade,    -- ON DNA,
			CONSTRAINT FK_Libros_Amigo foreign key	(Cod_Ami) references Amigos (Cod_Ami)
			 on update cascade,    -- ON DNA
			CONSTRAINT FK_Libros_Libreria foreign key (Cod_Lib) references Librerias (Cod_Lib)
			 on update cascade     -- ON DNA 
			);
--** Ninguna FK puede ser Not Null pues Libro_Prestamo y Libro_Merca 
--** no tienen participacion total y de Editorial  no nos exigen nada.


 


create table Autores	(
			Cod_Aut	    char(3),
			Nome		varchar(20) not null,
			CONSTRAINT PK_AUTORES primary key	(Cod_Aut)
			);

create table LibrosAutores (
			Cod_Libro	smallint,
			Cod_Aut	char(3),
			CONSTRAINT PK_LIBROAUTOR primary key	(Cod_Libro, Cod_Aut),
			foreign key	(Cod_Libro) references Libros (Cod_Libro) on update cascade on 
			delete cascade,
			foreign key	(Cod_Aut) references Autores  (Cod_Aut)   on update cascade on 
			delete cascade
			);
 


create table Prestamos (
			Cod_Ami		tinyint,
			Cod_Lib		smallint,
			DataPrest	date,
			DataDev		date,
			CONSTRAINT PK_PRESTAMOS primary Key	(Cod_Ami, Cod_Lib, DataPrest),

			CONSTRAINT FK_Prestamos_Amigo foreign key	(Cod_Ami) references Amigos (Cod_Ami)
			ON update cascade on delete cascade,

			CONSTRAINT FK_Prestamos_Libro foreign key	(Cod_Lib) references Libros (Cod_Libro)
			--on update cascade on delete cascade. Esto da error de ciclos.
			); 


create table Indice 	(
			Cod_Libro		smallint not null,
			Cod_Tit			smallint not null,
			Texto_Tit		varchar(30) not null,
			Paxina			int  not null,
			Cod_LPai		smallint,
			Cod_TPai		smallint,
			
			CONSTRAINT PK_INDICE primary key	(Cod_Libro, Cod_Tit),
			CONSTRAINT FK_Indice_Libro foreign key	(Cod_Libro) 
			references Libros(Cod_Libro) on update cascade on delete cascade,
			CONSTRAINT FK_Indice_SubIndice foreign key	(Cod_LPai, Cod_TPai) 
			references indice(Cod_Libro, Cod_Tit) 
			--ON UPDATE CASCADE ON DELETE SET NULL. Esto da error de ciclos.
			);


GO

select * from Editorial			
select * from Autores
select * from Librerias
select * from Libros
select * from Amigos
select * from Indice
select * from Prestamos
select * from LibrosAutores




      	



--4.- Actualizaci?n de datos usando SQL:
--4.a.- Cargar todas as t?boas cas tuplas dadas.

select * from autores

insert into Autores (Cod_Aut, Nome)values ( 1, 'V?ctor Martinez')
insert into Autores (Cod_Aut, Nome)values ( 2, 'Luis Perez')
insert into Autores (Cod_Aut, Nome)values ( 3, 'Juan Fernandez')


select * from amigos
-- Dejo con Fecha de Inicio en NULL.

insert into Amigos(Cod_Ami, Nome, Telefono, Presta, Regala, Enderezo) values (1, 'Pepe', '981111111', 0,1, 'Vigo') --Regalador
insert into Amigos (Cod_Ami, Nome, Telefono, Presta, Regala, Enderezo)values (2, 'Luis', '981222222', 1,0, 'Lugo') --Prestador
insert into Amigos(Cod_Ami, Nome, Telefono, Presta, Regala, Enderezo) values (3, 'Jose', '981333333', 1,1, 'Vigo') --Regalador y Prestador
insert into Amigos(Cod_Ami, Nome, Telefono, Presta, Regala, Enderezo) values (4, 'Ana', '981444444', 0,0, 'Vigo') --No deber?a entrar. 
--Es erroneo, ya que la extension tiene completitude total.

select * from Editorial;

insert into Editorial(Cod_edi, Nome) values (1, 'Anaya')
insert into Editorial(Cod_edi, Nome) values (2, 'Anagrama')
insert into Editorial(Cod_edi, Nome) values (3, 'Norte')



select * from librerias;

insert into librerias(Nome, Enderezo, Telefono, Persoa)values('Follas','Santiago','981-111111','Juan')
insert into librerias(Nome, Enderezo, Telefono, Persoa)values('Abraxas','Santiago','981-222222','Luis')
insert into librerias(Nome, Enderezo, Telefono, Persoa)values('Gonzalez','Santiago','981-444444','Ana')
insert into librerias(Nome, Enderezo, Telefono, Persoa)values('Couceiro','Santiago','981-333333','Rosa')


--A?ado la libreria por defecto que me mandan que sea de codigo 99 y el campo es identity.
--****************************************************************************************
SET IDENTITY_INSERT librerias on

insert into librerias(Cod_lib, Nome, Enderezo, Telefono, Persoa) values(99, 'Follas','Santiago','981-111111','Juan')

select * from Librerias

SET IDENTITY_INSERT librerias off

--Prueba insert en identity despues de apagar el Identity Insert

insert into librerias(Nome, Enderezo, Telefono, Persoa) values('Comercial','Vigo','986-444444','Ana')

select * from Librerias
--***************************************************************************************************


select * from Libros

insert into libros(Cod_Libro,Titulo, Data_Adq, Ano_Edc, Cod_edi, Prezo,
Fot_Ori, Mer_Reg, Esp_Can, Cod_Ami,	Cod_Lib) values
--Cod_Libro,Titulo,    Data_Adq,   Ano_Edc,Cod_edi,Prezo,Fot_Ori,Mer_Reg,Esp_Can,Cod_Ami,Cod_Lib
       (1,  'La rosa', '24/4/2013','1994',     1,   100,     1,     1,      1,    Null,    Null)


insert into libros(Cod_Libro,Titulo, Data_Adq, Ano_Edc, Cod_edi, Prezo,
Fot_Ori, Mer_Reg, Esp_Can, Cod_Ami,	Cod_Lib) values
--Cod_Libro,Titulo,    Data_Adq,   Ano_Edc,Cod_edi,Prezo,Fot_Ori,Mer_Reg,Esp_Can,Cod_Ami,Cod_Lib
     (2,    'Juntos', '24/4/2012',  '1996',    2,   100,    0,      1,     Null,    Null,  '1')  

insert into libros(Cod_Libro,Titulo, Data_Adq, Ano_Edc, Cod_edi, Prezo,
Fot_Ori, Mer_Reg, Esp_Can, Cod_Ami,	Cod_Lib) values
--Cod_Libro,Titulo,    Data_Adq,   Ano_Edc,Cod_edi,Prezo,Fot_Ori,Mer_Reg,Esp_Can,Cod_Ami,Cod_Lib,
    (3,     'Separados','28/6/2010','1993',   2,    Null,    0,     0,      Null, '1',      '1')




insert into libros(Cod_Libro,Titulo, Data_Adq, Ano_Edc, Cod_edi, Prezo,
Fot_Ori, Mer_Reg, Esp_Can, Cod_Ami,	Cod_Lib) values
--Cod_Libro,Titulo,    Data_Adq,   Ano_Edc,Cod_edi,Prezo,Fot_Ori,Mer_Reg,Esp_Can,Cod_Ami,Cod_Lib
      (4,   'Alien', '28/6/2003',   '1993',    2,   Null,   1,      0,      1,     '1',    Null)


insert into libros(Cod_Libro,Titulo, Data_Adq, Ano_Edc, Cod_edi, Prezo,
Fot_Ori, Mer_Reg, Esp_Can, Cod_Ami,	Cod_Lib) values
--Cod_Libro,Titulo,    Data_Adq, Ano_Edc,Cod_edi,Prezo,Fot_Ori,Mer_Reg,Esp_Can,Cod_Ami,Cod_Lib
     (5,    'Alien',  '28/6/2003', '1993',    2,   200,   1,      1,      1,     Null,    Null)


select * from Libros -- Para comprobar que pusimos todos los datos congruentes


select * from prestamos;
 
insert into prestamos(Cod_Ami,Cod_Lib,DataPrest,DataDev) values('1','1', '28/6/2010','28/8/2010')
insert into prestamos(Cod_Ami,Cod_Lib,DataPrest,DataDev) values('1','2', '28/9/2010','28/10/2010')
insert into prestamos(Cod_Ami,Cod_Lib,DataPrest,DataDev) values('3','1', '28/6/2012','28/8/2012')
insert into prestamos(Cod_Ami,Cod_Lib,DataPrest,DataDev) values('3','1', '28/8/2012', Null)
insert into prestamos(Cod_Ami,Cod_Lib,DataPrest,DataDev) values('3','1', '28/8/2011','28/4/2014')
insert into prestamos(Cod_Ami,Cod_Lib,DataPrest,DataDev) values('3','3', '28/8/2011','28/4/2014')




select * from LibrosAutores
insert into LibrosAutores(Cod_Libro,	Cod_Aut) values('1', '1')
insert into LibrosAutores(Cod_Libro,	Cod_Aut) values('1', '3')
insert into LibrosAutores(Cod_Libro,	Cod_Aut) values('2', '1')
insert into LibrosAutores(Cod_Libro,	Cod_Aut) values('2', '3')


select * from indice

insert into indice(Cod_Libro,Cod_Tit,Texto_Tit,Paxina,Cod_LPai,	Cod_TPai)values(1,1,'Cap.1',1,Null,Null)
insert into indice(Cod_Libro,Cod_Tit,Texto_Tit,Paxina,Cod_LPai,Cod_TPai) values(1,2,'Cap.11',2,1,1)
insert into indice(Cod_Libro,Cod_Tit,Texto_Tit,Paxina,Cod_LPai,Cod_TPai) values(1,3,'Cap.12',5,1,1)
insert into indice(Cod_Libro,Cod_Tit,Texto_Tit,Paxina,Cod_LPai,Cod_TPai) values(1,4,'Cap.121',6,1,3)
insert into indice(Cod_Libro,Cod_Tit,Texto_Tit,Paxina,Cod_LPai,Cod_TPai) values(1,5,'Cap.2',7,Null,Null)
insert into indice(Cod_Libro,Cod_Tit,Texto_Tit,Paxina,Cod_LPai,	Cod_TPai)values(2,1,'Cap.1',8,Null,Null)




--4.b.- Inserta un amigo, que utilizando a propiedade DEFAULT, poa o valor por defecto no campo Enderezo. 

			select * from Amigos;


-- Si pongo DEFAULT   pone el valor por defecto
			insert into Amigos (Cod_Ami,	Nome, Enderezo,	 Telefono,	  Presta,	Regala,	Fec_Ini)
            values				 (10,   'Federico', Default, '981555555',     0,       1,     '2000');

-- Si pongo NULL y admite NUll lo pone
			insert into Amigos (Cod_Ami,	Nome,Enderezo,	 Telefono,	  Presta,	Regala,	Fec_Ini)
            values				 (12,  'Federico', Null, '981555555',     0,       1,     '2000');

-- Si no pongo nada pone el valor por defecto
			insert into Amigos (Cod_Ami,	Nome,	 Telefono,	  Presta,	Regala,	Fec_Ini)
            values				 (13,  'Federico',  '981555555',     0,       1,     '2000');







--4.d.- Engadir unha librer?a con c?digo 25.
--create table Librerias (
--			Cod_Lib	    smallint identity,
--			Nome		varchar(25)		not null,
--			Enderezo	varchar(35),
--			Telefono	char(9)			not null,
--			Persoa		varchar(15)		not null,
--			primary Key	(Cod_Lib)
--			);

set identity_insert librerias on;

insert into Librerias(cod_lib, nome, enderezo, telefono, persoa) values(
28,'Rosita',Default, '989-888888', 'Juan');

set identity_insert librerias off;
