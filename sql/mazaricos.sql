create database a23anxoBO_Mazaricos
go
use a23anxoBO_Mazaricos
-- Tabla: Departamento
CREATE TABLE Departamento (
    Codigo_Departamento INT PRIMARY KEY,
    Nome_Departamento VARCHAR(255) NOT NULL
);

-- Tabla: Categoría
CREATE TABLE Categoria (
    Cod_Categoria INT PRIMARY KEY,
    Nome_Categoria VARCHAR(255) NOT NULL,
    Soldo DECIMAL(10, 2) NOT NULL,
    Desconto DECIMAL(5, 2) NOT NULL,
    Prezo_H_Extra DECIMAL(10, 2) NOT NULL
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    CIF CHAR(9) PRIMARY KEY,
    Nome_Cliente VARCHAR(255) NOT NULL,
    Enderezo VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);

-- Tabla: Aplicación
CREATE TABLE Aplicacion (
    Cod_Aplicacion INT PRIMARY KEY,
    Nome_Aplicacion VARCHAR(255) NOT NULL
);

-- Tabla: Empregado
CREATE TABLE Empregado (
    DNI CHAR(9) PRIMARY KEY,
    NSS CHAR(12) NOT NULL UNIQUE, 
    Nome_Empregado VARCHAR(255) NOT NULL,
    Enderezo VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Horas_Extra INT NOT NULL,
    Codigo_Departamento INT NOT NULL,
    Cod_Categoria INT NOT NULL,
    FOREIGN KEY (Codigo_Departamento) REFERENCES Departamento(Codigo_Departamento),
    FOREIGN KEY (Cod_Categoria) REFERENCES Categoria(Cod_Categoria)
);

-- Tabla: Proxecto
CREATE TABLE Proxecto (
    Cod_Proxecto INT PRIMARY KEY,
    Nome_Proxecto VARCHAR(255) NOT NULL,
    Horas_Asignadas INT NOT NULL,
    Horas_Reais INT NOT NULL,
    Cod_Aplicacion INT NOT NULL,
    
    FOREIGN KEY (Cod_Aplicacion) REFERENCES Aplicacion(Cod_Aplicacion),
);

-- Relación: Empregado trabaja en Proxecto
CREATE TABLE Traballa (
    DNI CHAR(9) NOT NULL,
    Cod_Proxecto INT NOT NULL,
    PRIMARY KEY (DNI, Cod_Proxecto),
    FOREIGN KEY (DNI) REFERENCES Empregado(DNI),
    FOREIGN KEY (Cod_Proxecto) REFERENCES Proxecto(Cod_Proxecto)
);

-- Relación: Cliente encarga Aplicación
CREATE TABLE Encarga (
    CIF_Cliente CHAR(9) NOT NULL,
    Cod_Aplicacion INT NOT NULL,
    PRIMARY KEY (CIF_Cliente, Cod_Aplicacion),
    FOREIGN KEY (CIF_Cliente) REFERENCES Cliente(CIF),
    FOREIGN KEY (Cod_Aplicacion) REFERENCES Aplicacion(Cod_Aplicacion)
);


insert into Departamento(codigo_departamento,nome_departamento)
values
	(1,'I+D'),
	(2,'recursos humanos'),
	(3,'programacion');

select * from Departamento 

insert into Categoria(cod_categoria,Nome_Categoria,Soldo,Desconto,Prezo_H_Extra)
values
	(1,'analista',2500,23.57,90),
	(2,'programador',1500,13.21,25),
	(3,'contable',1500,20,80),
	(4,'tecnico',1500,10.5,65);

select * from Categoria

insert into Empregado(DNI,NSS,Nome_Empregado,Enderezo,Telefono,Horas_Extra,Codigo_Departamento,Cod_Categoria)
values
	('56789012E', '33456789012','Luis Martínez','Santiago',654321098,8,1,2),
	('46294852S','12345678912','anxo','Santiago',656460790,12,1,1),
	('28436753A','12453124632','nico','Milladoiro',123596743,12,1,1),
	('12345678A', '1234587912','Juan Pérez','Sigueiro',987654321,10,2, 3);


select * from Empregado
