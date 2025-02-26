create database a23anxobo_empresa;
go
use a23anxobo_empresa;
go

-- Crear tabla Departamento
CREATE TABLE Departamento (
    coddepto INT IDENTITY(1,1) PRIMARY KEY,
    depto NVARCHAR(100) NOT NULL,         
    codjefe INT NULL,                      
    presupuesto DECIMAL(12, 2) DEFAULT 0   
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    codemp INT IDENTITY(1,1) PRIMARY KEY,       
    nombre NVARCHAR(100) NOT NULL,               
    apellido1 NVARCHAR(100) NOT NULL,            
    apellido2 NVARCHAR(100) NULL,               
    direccion NVARCHAR(255) NULL,               
    provincia NVARCHAR(100) DEFAULT 'Pontevedra', 
    dni CHAR(9) NOT NULL CHECK (dni LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
    coddepto INT NOT NULL,                       
    salario DECIMAL(12, 2) DEFAULT 800,          
    fecalta DATE not null DEFAULT GETDATE(), 
    dto DECIMAL(5, 2) CHECK (dto BETWEEN 0 AND 100),
    FOREIGN KEY (coddepto) REFERENCES Departamento(coddepto) 
);

-- Crear tabla Horas_extra
CREATE TABLE Horas_extra (
    codemp INT NOT NULL,                       
    fecha DATE NOT NULL,                      
    num_horas INT NOT NULL CHECK (num_horas > 0), 
    PRIMARY KEY (codemp, fecha),              
    FOREIGN KEY (codemp) REFERENCES Empleado(codemp)
);

ALTER TABLE Empleado
ADD importe_horas_extra DECIMAL(12, 2);

ALTER TABLE Empleado
DROP COLUMN importe_horas_extra;

ALTER TABLE Departamento
ADD importe_horas_extra DECIMAL(12, 2);

ALTER TABLE Empleado
ADD fecalta_temp DATE DEFAULT GETDATE();

UPDATE Empleado
SET fecalta_temp = TRY_CONVERT(DATE, fecalta, 103); 

ALTER TABLE Empleado
DROP COLUMN fecalta;

ALTER TABLE Empleado
ALTER COLUMN dni CHAR(9) NOT NULL;

