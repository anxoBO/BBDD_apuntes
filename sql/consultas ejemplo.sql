--Consulta de exemplo 1: Amosar nunha soa columna de nome datos_empregados, o n�mero identificador e o nome completo de cada empregado co formato:
--n�mero identificador - apelido1 apelido2, nome
use a23anxobo_SOCIEDADE_CULTURAL
select cast(e.numero as varchar)+' - '+e.ape1+' '+e.ape2+', '+e.nome as 'datos_empregados'
from EMPREGADO e 

--Consulta de exemplo 2: Amosar nunha soa columna o nome de todas as actividades e o d�a que comezan co 
--formato: nome_actividade comeza o data_inicio_da_actividade
select a.nome +' ' + convert(varchar,a.data_ini) as 'actividades'
from ACTIVIDADE a

--Consulta de exemplo 3: Amosar o uso das funci�ns ascii e char para a letra A. 
--A consulta non se fai sobre ningunha t�boa, neste caso, empregamos a instruci�n 
--SELECT s� para amosar o resultado, como se fose un print.
SELECT ASCII('A') AS CodigoASCII, CHAR(65) AS Letra;

--Consulta de exemplo 4: Obter a listaxe abreviada das catro primeiras
--letras dos nomes das actividades.
select left(a.nome,4) as 'actividades'
from ACTIVIDADE a

--Consulta de exemplo 5: Obter o nome e n�mero de caracteres dos nomes dos empregados.
select e.nome,len(e.nome)as 'cantidade letras'
from EMPREGADO e

 --Consulta de exemplo 6: Obter os nomes dos empregados tal como est�n gardados 
 --na BD, e nunha segunda columna os nomes dos empregados en min�sculas.
 select e.nome,lower(e.nome)
 from EMPREGADO e

 --Consulta de exemplo 7: Nomes completos dos socios en min�sculas. 
--Primeiro pasando a min�sculas cada campo, e na segunda columna pasando a 
--min�sculas despois de facer a concatenaci�n dos campos.
select lower(e.nome)+' '+lower(e.ape1)+' '+lower(e.ape2) as 'nome completo',lower(e.nome+' '+e.ape1+' '+e.ape2)
from EMPREGADO e

--Consulta de exemplo 8: Amosar unha cadea con espazos � esquerda na primeira columna, 
--e a mesma cadea sen espazos � esquerda.
SELECT '   Exemplo' AS CadeaConEspazos, LTRIM('   Exemplo') AS CadeaSenEspazos;

--Consulta de exemplo 9: Amosar o car�cter unicode do c�digo 248.
select NCHAR(248)

--Consulta de exemplo 10: Obtersulta nome das actividades e nunha segunda columna o 
--nome das actividades sen acento gr�fico no a.
select a.nome,REPLACE(a.nome,'�','a')
from actividade a

--Consulta de exemplo 11: Nesta consulta obtemos o nome das actividades e nunha segunda 
--columna o nome das actividades sen acento gr�fico en ningunha vogal.
select a.nome,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.nome,'�','a'),'�','e'),'�','i'),'�','o'),'�','u')
from ACTIVIDADE a

--Consulta de exemplo 12: Obter a listaxe abreviada das catro �ltimas 
--letras dos nomes das actividades.
select a.nome,RIGHT(a.nome,4)
from ACTIVIDADE a

--Consulta de exemplo 13: Amosar unha cadea con espazos � dereita na primeira columna, 
--e a mesma cadea sen espazos � dereita. Para poder verificalo engadimos un punto ao 
--final da cadea.
select 'exemplo                        'as 'senEspacios',RTRIM('exemplo                              ')

--Consulta de exemplo 14: Obter os segundo, terceiro, cuarto e quinto 
--caracteres do nome das cotas
select SUBSTRING(c.nome,2,5)
from COTA c

--Consulta de exemplo 15: Amosar o c�digo unicode do s�mbolo �.
select UNICODE('�') as 'unicode'

--Consulta de exemplo 16: Observaci�ns das actividades tal como est�n gardadas 
--e nunha segunda columna as mesmas observaci�ns en mai�sculas.
select a.nome,UPPER(a.nome)
from ACTIVIDADE a

--Consulta de exemplo 17: Amosar a data do sistema empregando as distintas funci�ns.
select SYSDATETIME(),SYSDATETIMEOFFSET(),SYSUTCDATETIME(),GETDATE(),GETUTCDATE()

--Consulta de exemplo 18: Amosar uso da funci�n datename para obter o nome de distintas 
--partes dunha data e hora concreta: nanosegundos, segundos, minutos, hora, d�a, semana, 
--mes e ano da data '20-01-2015 17:28:59.1945901'.
SELECT 
    DATENAME(NANOSECOND, '2015-01-20 17:28:59.1945901') AS Nanosegundos,
    DATENAME(SECOND, '2015-01-20 17:28:59.1945901') AS Segundos,
    DATENAME(MINUTE, '2015-01-20 17:28:59.1945901') AS Minutos,
    DATENAME(HOUR, '2015-01-20 17:28:59.1945901') AS Hora,
    DATENAME(DAY, '2015-01-20 17:28:59.1945901') AS D�a,
    DATENAME(WEEK, '2015-01-20 17:28:59.1945901') AS Semana,
    DATENAME(MONTH, '2015-01-20 17:28:59.1945901') AS Mes,
    DATENAME(YEAR, '2015-01-20 17:28:59.1945901') AS Ano;

--Consulta de exemplo 19: Amosar o uso da funci�n datepart para obter o as distintas 
--partes dunha data e hora concreta: nanosegundos, segundos, minutos, hora, d�a, semana, 
--mes e ano da data '20-01-2015 17:28:59.1945901'.
select 
	DATEPART(NANOSECOND,'20-01-2015 17:28:59.1945901'),
	DATEPART(SECOND,'20-01-2015 17:28:59.1945901'),
	DATEPART(MINUTE,'20-01-2015 17:28:59.1945901'),
	DATEPART(HOUR,'20-01-2015 17:28:59.1945901'),
	DATEPART(DAY,'20-01-2015 17:28:59.1945901'),
	DATEPART(WEEK,'20-01-2015 17:28:59.1945901'),
	DATEPART(MONTH,'20-01-2015 17:28:59.1945901'),
	DATEPART(YEAR,'20-01-2015 17:28:59.1945901')

--Consulta de exemplo 20: Devolver o d�a, mes e ano da data '20-01-2015 17:28:59.1945901'.
select YEAR('20-01-2015 17:28:59.1945901'),MONTH('20-01-2015 17:28:59.1945901'),DAY('20-01-2015 17:28:59.1945901')

--Consulta de exemplo 21: Obter a data de inicio das actividades nunha primeira columna, 
--e nas seguintes amosarase o d�a, mes e ano desa mesma data de inicio.
select a.data_ini,DAY(a.data_ini),MONTH(a.data_ini),YEAR(a.data_ini)
from ACTIVIDADE a