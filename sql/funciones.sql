/* 1- Crear una funci?n que dada una fecha devuelva el nombre del mes en gallego */
use a23anxobo_almacen;

create or alter function numMes(@numero as tinyint)
returns varchar(20)
as 
	begin 
			declare @nombre as varchar(15)='data invalida'
			set @nombre=
				case @numero
				when 1 then 'xaneiro'
				when 2 then 'febreiro'
				when 3 then 'marzo'
				when 4 then 'abril'
				when 5 then 'maio'
				when 6 then 'xuño'
				when 7 then 'xullo'
				when 8 then 'agosto'
				when 9 then 'setembro'
				when 10 then 'outubro'
				when 11 then 'novenbro'
				when 12 then 'decembro'
				else 'data invalida'
				end;
			return @nombre;
			end;

select dbo.numMes(2)


/* 2- Crear una funci?n que dada una fecha devuelva el d?a de las semana en gallego */

create or alter function diaSemana(@numero as tinyint)
returns varchar(15)
as 
	begin
		declare @dia as varchar(15)
		set @dia =
			case @numero
			when 1 then 'luns'
			when 2 then 'martes'
			when 3 then 'mercores'
			when 4 then 'xoves'
			when 5 then 'venres'
			when 6 then 'sabado'
			when 7 then 'domingo'
			else 'data invalida'
		end;
		return @dia
		end;

select dbo.diaSemana(4)
select dbo.diaSemana(7)
select dbo.diaSemana(12)



/* 3- Crear una funci?n que utilizando las definidas en los ejercicios anteriores devuelva la fecha formateada
-- en el cuerpo de la funci?n se analiza si el dato enviado corresponde a una fecha, 
-- si es as?, se devuelve la fecha con el formato Martes, 11 de Maio de 2021; en caso que el valor enviado no corresponda a una fecha,
-- la funci?n retorna la cadena 'Fecha inv?lida'. */

CREATE OR ALTER FUNCTION formatearFechaGalego(@valor VARCHAR(50))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @fecha tinyint;
    DECLARE @resultado VARCHAR(100);

    -- Verificar si el valor es una fecha válida
    BEGIN
        SET @fecha = CAST(@valor AS tinyint);

        SET @resultado = 
            LOWER(dbo.diaSemana(@fecha)) + ', ' +
            CAST(DAY(@fecha) AS VARCHAR) + ' de ' +
            LOWER(dbo.numMes(MONTH(@fecha))) + ' de ' +
            CAST(YEAR(@fecha) AS VARCHAR);
    END 
    BEGIN
        SET @resultado = 'Fecha inválida';
    END;

    RETURN @resultado;
END;
GO


/* 4- Crear una funci?n que devuelva las notas en texto seg?n la siguiente tabla 
	>= 0 < 5	Suspenso
	>= 5 < 6	Aprobado
	>= 6 < 7	Bien
	>= 7 < 9	Notable
	>= 9 <= 10	Sobresaliente
	Cualquier otro valor mostrar mensaje de Nota no v?lida
*/
create or alter function notasClase(@nota as tinyint)
returns varchar(15)
as 
	begin 
		declare @notas as varchar(15)
		set @notas =
		case 
			when @nota>=0 and @nota<5 then 'suspenso'
			when @nota>=5 and @nota<6 then 'aprobado'
			when @nota>=6 and @nota<7 then 'bien'
			when @nota>=7 and @nota<9 then 'notable'
			when @nota>=9 and @nota<=10 then 'sobresaliente'
			else 'nota invalida'
		end;
		return @notas;
		end;

select dbo.notasClase(9)
select dbo.notasClase(8)


/* 6- Para la base de datos almacen, crear una funci?n que devuelva un 1 si existe un departamento que
se le pasa como par?metro y un 0 sino.  */

create or alter function existeDepa(@id as tinyint)
returns char(1)
as
	begin 
		declare @existe as char(1)
		if exists(select* from DEPARTAMENTOS d where d.IDDepartamento=@id)
			begin
				set @existe='1'
			end
		else set @existe='0'
		return @existe
		end;

select dbo.existeDepa(10)
select dbo.existeDepa(100)

/* 7- Para la tabla de empleados, crear una funci?n que devuelva la suma total de los salarios del departamento
que se le pasa como par?metro. Utiliza la funci?n definida en el ejercicio anterior. */

CREATE OR ALTER FUNCTION sumaSalario(@id TINYINT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @total VARCHAR(50)

    IF (SELECT dbo.existeDepa(@id)) = '1'
    BEGIN 
        SET @total = CAST((
            SELECT SUM(e.Salario)
            FROM EMPLEADOS e
            WHERE e.IDDepartamento = @id
        ) AS VARCHAR(50))
    END
    ELSE 
        SET @total = 'non existe o departamento'

    RETURN @total
END;
GO

select dbo.sumaSalario(10)

/* 8 - Crea una funci?n que dado un id de producto, devuelva los datos de pedido de un producto detallando 
su descripci?n, precio, unidades y total */
create or alter function datosPedido
(@id as int)
returns table
as
	return
		(select pe.IDPedido, pe.Fecha_pedido,  pe.Unidades,
		(p.PrecioActual*pe.UNIDADES) as Total  
		from PRODUCTOS p inner join PEDIDOS pe 
		on p.IDProducto=pe.IDProducto
		where pe.IDProducto=@id)


select *
from PEDIDOS

select * from dbo.datosPedido(10)

/* 9- Crear una funci?n de login que devuelva 1 si un usuario est? registrado y su contrase?a es correcta 
	y 0 si la contrase?a es incorrecta.
	Crea primero las tablas y a?ade datos de ejemplo
	La tabla usuarios tendr?: login, password y fechaAcceso con lafecha y hora del ?ltimo acceso correcto; */
