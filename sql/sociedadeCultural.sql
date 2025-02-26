USE master;
GO

DROP   database IF EXISTS a23anxobo_sociedade_cultural_2025;

/****** CREACI?N DA BD SOCIEDADE_CULTURAL******/

CREATE DATABASE a23anxobo_sociedade_cultural_2025;
GO

USE a23anxobo_sociedade_cultural_2025;
GO

/****** CREACI?N DE T?BOAS ******/

--T?BOA COTA
CREATE TABLE COTA(
	codigo    tinyint NOT NULL,
	nome      varchar(20) NOT NULL,
	importe   decimal(7, 2) NOT NULL,
 CONSTRAINT PK_COTA_codigo PRIMARY KEY (codigo),
 CONSTRAINT UQ_COTA_nome UNIQUE (nome)
);
GO

INSERT INTO COTA (codigo, nome, importe) VALUES (11, 'DE HONRA', 100.00);
INSERT INTO COTA (codigo, nome, importe) VALUES (12, 'FAMILIAR', 30.00);
INSERT INTO COTA (codigo, nome, importe) VALUES (13, 'HABITUAL', 50.00);
INSERT INTO COTA (codigo, nome, importe) VALUES (99, 'GRATUITA', 0.00);

GO

--T?BOA AULA
CREATE TABLE AULA(
	numero int NOT NULL,
	descricion varchar(30) NOT NULL,
	superficie int NOT NULL,
	estado char(1) NOT NULL,
 CONSTRAINT PK_AULA_numero PRIMARY KEY (numero),
 CONSTRAINT UQ_AULA_descricion UNIQUE (descricion),
);
GO

INSERT INTO AULA (numero, descricion, superficie, estado) VALUES (1, 'PISTA DE TENIS', 270, 'B');
INSERT INTO AULA (numero, descricion, superficie, estado) VALUES (2, 'COCI�A', 100, 'R');
INSERT INTO AULA (numero, descricion, superficie, estado) VALUES (3, 'AULA TALLER', 150, 'B');
INSERT INTO AULA (numero, descricion, superficie, estado) VALUES (4, 'AULA SUR', 80, 'M');
INSERT INTO AULA (numero, descricion, superficie, estado) VALUES (5, 'AULA NORTE', 50, 'B');

GO

--T?BOA PROVINCIA
CREATE TABLE PROVINCIA(
	codigo varchar(2) NOT NULL,
	nome varchar(50) NOT NULL,
	CONSTRAINT PK_PROVINCIA_codigo PRIMARY KEY (codigo),
	CONSTRAINT UQ_PROVINCIA_nome UNIQUE (nome)
	);

GO

INSERT INTO PROVINCIA (codigo, nome) VALUES ('01', '�lava');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('02', 'Albacete');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('03', 'Alacante');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('04', 'Almer?a');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('05', '�vila');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('06', 'Badajoz');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('07', 'Illes Balears');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('08', 'Barcelona');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('09', 'Burgos');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('10', 'C�ceres');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('11', 'C�diz');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('12', 'Castell�n');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('13', 'Ciudad Real');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('14', 'C�rdoba');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('15', 'A Coru�a');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('16', 'Cuenca');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('17', 'Girona');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('18', 'Granada');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('19', 'Guadalajara');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('20', 'Guip�zcoa');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('21', 'Huelva');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('22', 'Huesca');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('23', 'Ja�n');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('24', 'Le�n');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('25', 'Lleida');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('26', 'La Rioja');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('27', 'Lugo');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('28', 'Madrid');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('29', 'M�laga');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('30', 'Murcia');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('31', 'Navarra');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('32', 'Ourense');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('33', 'Asturias');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('34', 'Palencia');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('35', 'Las Palmas');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('36', 'Pontevedra');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('37', 'Salamanca');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('38', 'Santa Cruz de Tenerife');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('39', 'Cantabria');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('40', 'Segovia');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('41', 'Sevilla');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('42', 'Soria');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('43', 'Tarragona');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('44', 'Teruel');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('45', 'Toledo');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('46', 'Valencia');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('47', 'Valladolid');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('48', 'Vizcaya');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('49', 'Zamora');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('50', 'Zaragoza');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('51', 'Ceuta');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('52', 'Melilla');
INSERT INTO PROVINCIA (codigo, nome) VALUES ('99', 'No espa?ola');

GO

--TABOA SOCIO
CREATE TABLE SOCIO(
	numero	 int NOT NULL,
	nif		 char(9) NULL,
	nss		 char(12) NULL,
	nome	 varchar(30) NOT NULL,
	ape1	 varchar(30) NOT NULL,
	ape2	 varchar(30) NULL,
	telefono1 char(9) NULL,
	telefono2 char(9) NULL,
	data_nac date NOT NULL,
	tipo_via_enderezo	   varchar(6) NOT NULL,
	nome_via_enderezo	   varchar(30) NULL,
	num_casa_enderezo	   varchar(30) NOT NULL,
	piso_enderezo		   varchar(5) NULL,
	localidade_enderezo	   varchar(40) NULL,
	codpostal_enderezo	   char(5) NULL,
	cod_provincia_enderezo varchar(2) NULL,
	tipo				   varchar(30) NOT NULL,
	profesion			   varchar(30) NULL,
	abonada				   char(1) NOT NULL,
	cod_cota			   tinyint NOT NULL,
CONSTRAINT PK_SOCIO_numero PRIMARY KEY (numero),
CONSTRAINT UQ_SOCIO_nif UNIQUE (nif)
);
GO

INSERT INTO SOCIO (numero, nif, nss, nome, ape1, ape2, telefono1, telefono2, 
                   data_nac, tipo_via_enderezo, nome_via_enderezo, num_casa_enderezo, piso_enderezo, 
				   localidade_enderezo, codpostal_enderezo, cod_provincia_enderezo, 
				   tipo, profesion, abonada, cod_cota) 
VALUES (1000, '11111112A', '111111111112', 'MAR�A', 'GRA�A', 'UMIA', '981111112', NULL, 
		'5-5-1975', 'R?A', 'DO OLVIDO', '3', '2?A', 
		'FERROL', '15011', '15', 'HONOR?FICO', NULL, 'S', 11);

INSERT INTO SOCIO (numero, nif, nss, nome, ape1, ape2, telefono1, telefono2, 
                   data_nac, tipo_via_enderezo,nome_via_enderezo, num_casa_enderezo, piso_enderezo, 
				   localidade_enderezo, codpostal_enderezo, cod_provincia_enderezo, 
				   tipo, profesion, abonada, cod_cota) 
VALUES (1001, '22222223B', '222222222223', 'MANUEL', 'SIEIRO', 'CAMPOS', '981222223', '639222223', 
		'10-10-1950', 'R?A','SAN ROQUE', '15', NULL, 
		'A CORU?A', '15025', '15', 'FAMILIAR', 'CARTEIRO', 'N', 12);

INSERT INTO SOCIO (numero, nif, nss, nome, ape1, ape2, telefono1, telefono2, 
                   data_nac, tipo_via_enderezo, nome_via_enderezo, num_casa_enderezo, piso_enderezo, 
				   localidade_enderezo, codpostal_enderezo, cod_provincia_enderezo, 
				   tipo, profesion, abonada, cod_cota) 
VALUES (1002, '33333334C', '333333333334', 'JORGE', 'DEL CARMEN', 'L?REZ', NULL, '639333334', 
		'11-06-1990', 'PRAZA','DE ESPA?A', '25-26', '11?B', 
		'FERROL', '15006', '15', 'COM?N', 'AVOGADO', 'S', 99);

INSERT INTO SOCIO (numero, nif, nss, nome, ape1, ape2, telefono1, telefono2, 
                   data_nac, tipo_via_enderezo, nome_via_enderezo, num_casa_enderezo, piso_enderezo, 
				   localidade_enderezo, codpostal_enderezo, cod_provincia_enderezo, 
				   tipo, profesion, abonada, cod_cota) 
VALUES (1003, '44444445D', '444444444445', 'CARLA', 'VIEITO', 'GIL', NULL, NULL, 
		'12-07-1985', 'R?A', 'SAN ROQUE', '30', 'BAIXO', 
		'A CORU?A', '15006', '15', 'HONOR?FICO', 'ESTUDANTE', 'S', 11);

GO

--T?BOA EMPREGADO
CREATE TABLE EMPREGADO(
	numero int NOT NULL,
	nif char(9) NOT NULL,
	nss char(12) NOT NULL,
	nome varchar(30) NOT NULL,
	ape1 varchar(30) NOT NULL,
	ape2 varchar(30) NULL,
	tipo_via_enderezo varchar(6) NOT NULL,
	nome_via_enderezo varchar(30) NULL,
	num_casa_enderezo varchar(30) NOT NULL,
	piso_enderezo varchar(5) NULL,
	localidade_enderezo varchar(40) NULL,
	codpostal_enderezo char(5) NULL,
	cod_provincia_enderezo varchar(2) NULL,
	tel_fixo char(9) NULL,
	tel_mobil char(9) NULL,
	salario_mes decimal(18, 2) NULL,
	cargo char(3) NOT NULL,
 CONSTRAINT PK_EMPREGADO_numero PRIMARY KEY (numero),
 CONSTRAINT UQ_EMPREGADO_nif UNIQUE (nif),
 CONSTRAINT UQ_EMPREGADO_nss UNIQUE (nss)
);
GO

INSERT INTO EMPREGADO (numero, nif, nss, nome, ape1, ape2, tipo_via_enderezo, nome_via_enderezo, 
					  num_casa_enderezo, piso_enderezo, localidade_enderezo, codpostal_enderezo,
					  cod_provincia_enderezo, tel_fixo, tel_mobil, salario_mes, cargo) 
VALUES (100, '11111111A', '121212121212', 'MAR�A', 'GARC�A', 'P�REZ', 'R�A', 'NOVA', 
		'10', '3�', 'SANTIAGO DE COMPOSTELA', '15125', 
		'15', '981111111', '639111111', 900.00, 'PRF');
INSERT INTO EMPREGADO (numero, nif, nss, nome, ape1, ape2, tipo_via_enderezo, nome_via_enderezo, 
					  num_casa_enderezo, piso_enderezo, localidade_enderezo, codpostal_enderezo,
					  cod_provincia_enderezo, tel_fixo, tel_mobil, salario_mes, cargo) 
VALUES (200, '22222222B', '131313131313', 'CARLOS', 'REGO', 'PENA', 'PRAZA','DA CONSTITUCI�N', 
		'30', '4�', 'A CORU�A', '15002', 
		'15', '981222222', '639222222', 800.00, 'PRF');
INSERT INTO EMPREGADO (numero, nif, nss, nome, ape1, ape2, tipo_via_enderezo, nome_via_enderezo, 
					  num_casa_enderezo, piso_enderezo, localidade_enderezo, codpostal_enderezo,
					  cod_provincia_enderezo, tel_fixo, tel_mobil, salario_mes, cargo) 
VALUES (300, '33333333C', '141414141414', 'JUANA', 'POSE', 'VARELA',  'AV.', 'DE CASTELA', 
		'100', '5�D', 'FERROL', '15104', '15', '981333333', '639333333', 1500.90, 'PRF');
INSERT INTO EMPREGADO (numero, nif, nss, nome, ape1, ape2, tipo_via_enderezo, nome_via_enderezo, 
					  num_casa_enderezo, piso_enderezo, localidade_enderezo, codpostal_enderezo,
					  cod_provincia_enderezo, tel_fixo, tel_mobil, salario_mes, cargo) 
VALUES (400, '44444444D', '151515151515', 'JOS�', 'GONZ�LEZ', '�NSUA', 'R�A', 'MAIOR', 
		'25', '1�IZQ', 'SANTIAGO', '15145', '15', '981444444', '639444444', 600.00, 'ADM');

GO

--T?BOA PROFESORADO
CREATE TABLE PROFESORADO(
	num_prof int NOT NULL,
	especialidade varchar(50) NOT NULL,
 CONSTRAINT PK_PROFESORADO_num_prof PRIMARY KEY (num_prof)
);
GO

INSERT INTO PROFESORADO (num_prof, especialidade) VALUES (100, 'DEPORTES');
INSERT INTO PROFESORADO (num_prof, especialidade) VALUES (200, 'COCI�A');
INSERT INTO PROFESORADO (num_prof, especialidade) VALUES (300, 'INFORM�TICA');

GO

--T?BOA ADMINISTRATIVO
CREATE TABLE ADMINISTRATIVO(
	num_adm int NOT NULL,
	horas_extras tinyint NOT NULL,
 CONSTRAINT PK_ADMINISTRATIVO_num_adm PRIMARY KEY (num_adm)
);
GO

INSERT INTO ADMINISTRATIVO (num_adm, horas_extras) VALUES (400, 50);
GO

--T?BOA ACTIVIDADE
CREATE TABLE ACTIVIDADE(
	identificador int NOT NULL,
	nome varchar(50) NOT NULL,
	data_ini datetime NOT NULL,
	data_fin datetime NOT NULL,
	num_prazas tinyint NOT NULL,
	prezo decimal(7, 2) NOT NULL,
	observacions varchar(100) NULL,
	num_profesorado_imparte int NOT NULL,
	num_aula int NOT NULL,
 CONSTRAINT PK_ACTIVIDADE_identificador PRIMARY KEY (identificador),
 CONSTRAINT UQ_ACTIVIDADE_num_aula UNIQUE (num_aula),
 CONSTRAINT UQ_ACTIVIDADE_nome UNIQUE (nome)
);

GO

INSERT INTO ACTIVIDADE (identificador, nome, data_ini, data_fin, num_prazas, prezo, observacions, num_profesorado_imparte, num_aula) 
VALUES (10, 'TENIS PARA PRINCIPIANTES', '10-02-2014 16:00', '10-10-2014 20:00', 15, 301.55, 'Prec�sase raqueta e 1 bote de pelotas', 100, 1);
INSERT INTO ACTIVIDADE (identificador, nome, data_ini, data_fin, num_prazas, prezo, observacions, num_profesorado_imparte, num_aula) 
VALUES (20, 'REPOSTAR?A', '15-02-2015 17:00', '15-03-2015 19:00', 20, 50.00, NULL, 200, 2);
INSERT INTO ACTIVIDADE (identificador, nome, data_ini, data_fin, num_prazas, prezo, observacions, num_profesorado_imparte, num_aula) 
VALUES (30, 'XADREZ', '20-03-2014 16:30', '20-06-2014 17:30', 10, 80.00, NULL, 100, 4);
INSERT INTO ACTIVIDADE (identificador, nome, data_ini, data_fin, num_prazas, prezo, observacions, num_profesorado_imparte, num_aula) 
VALUES (40, 'INICIACI�N � INFORM�TICA', '01-03-2015 16:30','01-05-2015 17:30', 20, 0.00, 'Impartirase SW_libre', 300, 3);

GO

--T?BOA SOCIO_REALIZA_ACTI
CREATE TABLE SOCIO_REALIZA_ACTI(
	num_socio int NOT NULL,
	id_actividade int NOT NULL,
	pagada char(1) NOT NULL,
 CONSTRAINT PK_SOCIO_REALIZA_ACTI PRIMARY KEY (num_socio, id_actividade)
);
GO

INSERT INTO SOCIO_REALIZA_ACTI (num_socio, id_actividade, pagada) 
VALUES (1000, 10, 'S');
INSERT INTO SOCIO_REALIZA_ACTI (num_socio, id_actividade, pagada) 
VALUES (1001, 10, 'N');
INSERT INTO SOCIO_REALIZA_ACTI (num_socio, id_actividade, pagada) 
VALUES (1001, 30, 'S');
INSERT INTO SOCIO_REALIZA_ACTI (num_socio, id_actividade, pagada) 
VALUES (1002, 40, 'N');
INSERT INTO SOCIO_REALIZA_ACTI (num_socio, id_actividade, pagada) 
VALUES (1003, 30, 'S');
GO

--T?BOA PROFE_CURSA_ACTI
CREATE TABLE PROFE_CURSA_ACTI(
	num_profesorado int NOT NULL,
	id_actividade int NOT NULL,
 CONSTRAINT PK_PROFE_CURSA_ACTI PRIMARY KEY (num_profesorado, id_actividade)
);
GO
INSERT INTO PROFE_CURSA_ACTI (num_profesorado, id_actividade) VALUES (100, 40);
INSERT INTO PROFE_CURSA_ACTI (num_profesorado, id_actividade) VALUES (200, 30);


/**** VALORES POR DEFECTO ****************/
ALTER TABLE SOCIO 
ADD  CONSTRAINT DF_SOCIO_abonada  DEFAULT ('N') FOR abonada;
GO

ALTER TABLE ADMINISTRATIVO 
ADD  CONSTRAINT DF_ADMINISTRATIVO_horas_extras  DEFAULT (0) FOR horas_extras;
GO

ALTER TABLE SOCIO_REALIZA_ACTI 
ADD  CONSTRAINT DF_SOCIO_REALIZA_ACTI_pagada  DEFAULT ('N') FOR pagada;
GO


/**** CHECKS - VERIFICACI?NS ***************/
ALTER TABLE ACTIVIDADE 
ADD  CONSTRAINT CHK_control_datas CHECK  ((data_fin >= data_ini));
GO

/*** CLAVES FOR?NEAS OU ALLEAS ****************/
ALTER TABLE SOCIO   
ADD  CONSTRAINT FK_SOCIO_COTA_cod_cota
    FOREIGN KEY(cod_cota)
	REFERENCES COTA (codigo)
	ON UPDATE CASCADE;
GO

ALTER TABLE SOCIO  
ADD  CONSTRAINT FK_SOCIO_PROVINCIA_cod_provincia_enderezo 
	FOREIGN KEY(cod_provincia_enderezo)
	REFERENCES PROVINCIA (codigo)
	ON UPDATE CASCADE;
GO


ALTER TABLE EMPREGADO  
ADD  CONSTRAINT FK_EMPREGADO_PROVINCIA_cod_provincia_enderezo
	FOREIGN KEY(cod_provincia_enderezo)
	REFERENCES PROVINCIA (codigo)
	ON UPDATE CASCADE;
GO


ALTER TABLE PROFESORADO  
ADD  CONSTRAINT FK_PROFESORADO_EMPREGADO_num_prof 
	FOREIGN KEY(num_prof)
	REFERENCES EMPREGADO (numero);
GO

ALTER TABLE ADMINISTRATIVO 
ADD  CONSTRAINT FK_ADMINISTRATIVO_EMPREGADO_num_adm
	FOREIGN KEY(num_adm)
	REFERENCES EMPREGADO (numero);
GO

ALTER TABLE ACTIVIDADE  
ADD  CONSTRAINT FK_ACTIVIDADE_AULA_num_aula
	FOREIGN KEY(num_aula)
	REFERENCES AULA (numero);
GO

ALTER TABLE ACTIVIDADE  
ADD  CONSTRAINT FK_ACTIVIDADE_PROFESORADO_num_profesorado_imparte
	FOREIGN KEY(num_profesorado_imparte)
	REFERENCES PROFESORADO (num_prof)
	ON UPDATE CASCADE;
GO

ALTER TABLE SOCIO_REALIZA_ACTI 
ADD  CONSTRAINT FK_SOCIO_REALIZA_ACTI_ACTIVIDADE_id_actividade
	FOREIGN KEY(id_actividade)
	REFERENCES ACTIVIDADE (identificador)
	ON UPDATE CASCADE;
GO

ALTER TABLE SOCIO_REALIZA_ACTI  
ADD  CONSTRAINT FK_SOCIO_REALIZA_ACTI_SOCIO_num_socio
	FOREIGN KEY(num_socio)
	REFERENCES SOCIO (numero)
	ON UPDATE CASCADE;
GO

ALTER TABLE PROFE_CURSA_ACTI 
ADD  CONSTRAINT FK_PROFE_CURSA_ACTI_ACTIVIDADE_id_actividade
	FOREIGN KEY(id_actividade)
	REFERENCES ACTIVIDADE (identificador);
GO

ALTER TABLE PROFE_CURSA_ACTI  
ADD  CONSTRAINT FK_PROFE_CURSA_ACTI_PROFESORADO_num_profesorado 
	FOREIGN KEY(num_profesorado)
	REFERENCES PROFESORADO (num_prof);
GO