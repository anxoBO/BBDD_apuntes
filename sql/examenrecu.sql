create database a23anxobo_peregrinos;
go
use a23anxobo_peregrinos;


CREATE TABLE Camino (
    Cod_Camino INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tiempo_Calculado DECIMAL(10, 2),
    Km_Calculado DECIMAL(10, 2)
);

CREATE TABLE Comunidad (
    Cod_Comu INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Extension DECIMAL(10, 2)
);

CREATE TABLE Localidad (
    Cod_Loca INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Cod_Post VARCHAR(20),
    Cod_Comu INT,
    FOREIGN KEY (Cod_Comu) REFERENCES Comunidad(Cod_Comu)
);

CREATE TABLE Etapa (
    Cod_Etapa INT PRIMARY KEY,
    Km DECIMAL(10, 2),
    Tiempo DECIMAL(10, 2),
    Cod_Camino INT,
    FOREIGN KEY (Cod_Camino) REFERENCES Camino(Cod_Camino)
);

CREATE TABLE Albergue (
    Cod_Alb INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Capacidad INT,
    Cod_Loca INT,
    FOREIGN KEY (Cod_Loca) REFERENCES Localidad(Cod_Loca)
);


CREATE TABLE Precio (
    Fecha DATE,
    Precio DECIMAL(10, 2),
    Cod_Alb INT,
    PRIMARY KEY (Fecha, Cod_Alb),
    FOREIGN KEY (Cod_Alb) REFERENCES Albergue(Cod_Alb)
);

CREATE TABLE Edificios (
    Cod_Edificio INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tamaño DECIMAL(10, 2),
    Capacidad INT,
    Servicios VARCHAR(255),
    Cod_Alb INT,
    FOREIGN KEY (Cod_Alb) REFERENCES Albergue(Cod_Alb)
);

CREATE TABLE Org_Patro (
    Cod_Org INT PRIMARY KEY,
    Nom_Org VARCHAR(100),
    Ambito VARCHAR(100)
);


CREATE TABLE Privados (
    DNI_Dueno VARCHAR(20) PRIMARY KEY,
    Cod_Alb INT,
    FOREIGN KEY (Cod_Alb) REFERENCES Albergue(Cod_Alb)
);

CREATE TABLE Publico (
    Cod_Alb INT PRIMARY KEY,
    FOREIGN KEY (Cod_Alb) REFERENCES Albergue(Cod_Alb)
);

CREATE TABLE Peregrino (
    Numero INT PRIMARY KEY,
    DNI VARCHAR(20),
    Nombre VARCHAR(100),
    Direccion VARCHAR(255)
);


CREATE TABLE Ciclistas (
    Numero INT PRIMARY KEY,
    Pais_Ori VARCHAR(100),
    FOREIGN KEY (Numero) REFERENCES Peregrino(Numero)
);


ALTER TABLE Etapa ADD Salida INT;
ALTER TABLE Etapa ADD Llegada INT;
ALTER TABLE Etapa ADD FOREIGN KEY (Salida) REFERENCES Localidad(Cod_Loca);
ALTER TABLE Etapa ADD FOREIGN KEY (Llegada) REFERENCES Localidad(Cod_Loca);

CREATE TABLE Recorre (
    Numero INT,
    Cod_Camino INT,
    Fecha DATE,
    Estado VARCHAR(20),
    PRIMARY KEY (Numero, Cod_Camino, Fecha),
    FOREIGN KEY (Numero) REFERENCES Peregrino(Numero),
    FOREIGN KEY (Cod_Camino) REFERENCES Camino(Cod_Camino)
);

CREATE TABLE Patrocinio (
    Cod_Org INT,
    Cod_Alb INT,
    Tipo CHAR(1),
    PRIMARY KEY (Cod_Org, Cod_Alb, Tipo),
    FOREIGN KEY (Cod_Org) REFERENCES Org_Patro(Cod_Org),
    FOREIGN KEY (Cod_Alb) REFERENCES Albergue(Cod_Alb)
);

--drop database a23anxobo_peregrinos