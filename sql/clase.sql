CREATE DATABASE a23anxobo_instituto;
GO
USE a23anxobo_instituto;


CREATE TABLE PROFESOR (
    codprof SERIAL PRIMARY KEY,
    DNI CHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    tipocarnet CHAR(2) CHECK (tipocarnet IN ('A1', 'A2', 'B1', 'B2'))
);

CREATE TABLE ALUMNO (
    numexp SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(200),
    fechanac DATE
);

CREATE TABLE MODULO (
    codmod SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codprof INT NOT NULL,
    coddelegado INT,
    ciclo VARCHAR(4) CHECK (ciclo IN ('SMIR', 'ASIR', 'DAM', 'DAW')),
    seguimiento INT CHECK (seguimiento <= 999999),
    FOREIGN KEY (codprof) REFERENCES PROFESOR(codprof)
);

CREATE TABLE MATRICULA (
    codmod INT,
    codalumno INT,
    fecmatricula TIMESTAMP NOT NULL,
    PRIMARY KEY (codmod, codalumno),
    FOREIGN KEY (codmod) REFERENCES MODULO(codmod),
    FOREIGN KEY (codalumno) REFERENCES ALUMNO(numexp)
);

CREATE TABLE TELEFONOS (
    codprof INT,
    numero VARCHAR(15) NOT NULL,
    principal BOOLEAN,
    tipo VARCHAR(8) CHECK (tipo IN ('ALUMNO', 'PROFESOR')),
    PRIMARY KEY (codprof, numero)
);



-- 1. Añadir los campos "apellido1" y "apellido2" a la tabla PROFESOR
ALTER TABLE PROFESOR 
ADD COLUMN apellido1 VARCHAR(100),
ADD COLUMN apellido2 VARCHAR(100);

-- 2. Modificar el campo "fecnac" de la tabla ALUMNO para que pase a llamarse "fechanac"
ALTER TABLE ALUMNO 
RENAME COLUMN fecnac TO fechanac;

-- 3. Cambiar el tipo de dato del número de teléfono en TFNO_PROFE a texto
ALTER TABLE TFNO_PROFE 
ALTER COLUMN numero TYPE VARCHAR(15);

-- 4. Cambiar el nombre de la tabla TFNO_PROFE a TELEFONOS
ALTER TABLE TFNO_PROFE 
RENAME TO TELEFONOS;

-- 5. Eliminar la foreign key que tiene el campo "coddelegado" en MODULO
ALTER TABLE MODULO 
DROP CONSTRAINT modulo_coddelegado_fkey;

-- 6. Añadir el campo "seguimiento" a la tabla MODULO
ALTER TABLE MODULO 
ADD COLUMN seguimiento INT CHECK (seguimiento <= 999999);

-- 7. Modificar el campo MODULO.codprof para que no pueda ser nulo
ALTER TABLE MODULO 
ALTER COLUMN codprof SET NOT NULL;

-- 8. Añadir el campo "tipo" a la tabla TELEFONOS y eliminar la FK en "codprof"
ALTER TABLE TELEFONOS 
ADD COLUMN tipo ENUM('ALUMNO', 'PROFESOR'),
DROP CONSTRAINT telefonos_codprof_fkey;
