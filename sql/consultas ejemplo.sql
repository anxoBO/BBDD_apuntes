--Consulta de exemplo 1: Amosar nunha soa columna de nome datos_empregados, o número identificador e o nome completo de cada empregado co formato:
--número identificador - apelido1 apelido2, nome
use a23anxobo_SOCIEDADE_CULTURAL
select cast(e.numero as varchar)+' - '+e.ape1+' '+e.ape2+', '+e.nome as 'datos_empregados'
from EMPREGADO e 

--Consulta de exemplo 2: Amosar nunha soa columna o nome de todas as actividades e o día que comezan co 
--formato: nome_actividade comeza o data_inicio_da_actividade
select a.nome +' ' + convert(varchar,a.data_ini) as 'actividades'
from ACTIVIDADE a

--Consulta de exemplo 3: Amosar o uso das funcións ascii e char para a letra A. 
--A consulta non se fai sobre ningunha táboa, neste caso, empregamos a instrución 
--SELECT só para amosar o resultado, como se fose un print.
SELECT ASCII('A') AS CodigoASCII, CHAR(65) AS Letra;

--Consulta de exemplo 4: Obter a listaxe abreviada das catro primeiras
--letras dos nomes das actividades.
select left(a.nome,4) as 'actividades'
from ACTIVIDADE a

--Consulta de exemplo 5: Obter o nome e número de caracteres dos nomes dos empregados.
select e.nome,len(e.nome)as 'cantidade letras'
from EMPREGADO e

 --Consulta de exemplo 6: Obter os nomes dos empregados tal como están gardados 
 --na BD, e nunha segunda columna os nomes dos empregados en minúsculas.
 select e.nome,lower(e.nome)
 from EMPREGADO e

 --Consulta de exemplo 7: Nomes completos dos socios en minúsculas. 
--Primeiro pasando a minúsculas cada campo, e na segunda columna pasando a 
--minúsculas despois de facer a concatenación dos campos.
select lower(e.nome)+' '+lower(e.ape1)+' '+lower(e.ape2) as 'nome completo',lower(e.nome+' '+e.ape1+' '+e.ape2)
from EMPREGADO e

--Consulta de exemplo 8: Amosar unha cadea con espazos á esquerda na primeira columna, 
--e a mesma cadea sen espazos á esquerda.
SELECT '   Exemplo' AS CadeaConEspazos, LTRIM('   Exemplo') AS CadeaSenEspazos;

--Consulta de exemplo 9: Amosar o carácter unicode do código 248.
select NCHAR(248)

--Consulta de exemplo 10: Obtersulta nome das actividades e nunha segunda columna o 
--nome das actividades sen acento gráfico no a.
select a.nome,REPLACE(a.nome,'á','a')
from actividade a

--Consulta de exemplo 11: Nesta consulta obtemos o nome das actividades e nunha segunda 
--columna o nome das actividades sen acento gráfico en ningunha vogal.
select a.nome,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.nome,'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')
from ACTIVIDADE a

--Consulta de exemplo 12: Obter a listaxe abreviada das catro últimas 
--letras dos nomes das actividades.
select a.nome,RIGHT(a.nome,4)
from ACTIVIDADE a

--Consulta de exemplo 13: Amosar unha cadea con espazos á dereita na primeira columna, 
--e a mesma cadea sen espazos á dereita. Para poder verificalo engadimos un punto ao 
--final da cadea.
select 'exemplo                        'as 'senEspacios',RTRIM('exemplo                              ')

--Consulta de exemplo 14: Obter os segundo, terceiro, cuarto e quinto 
--caracteres do nome das cotas
select SUBSTRING(c.nome,2,5)
from COTA c

--Consulta de exemplo 15: Amosar o código unicode do símbolo ø.
select UNICODE('ø') as 'unicode'

--Consulta de exemplo 16: Observacións das actividades tal como están gardadas 
--e nunha segunda columna as mesmas observacións en maiúsculas.
select a.nome,UPPER(a.nome)
from ACTIVIDADE a

--Consulta de exemplo 17: Amosar a data do sistema empregando as distintas funcións.
select SYSDATETIME(),SYSDATETIMEOFFSET(),SYSUTCDATETIME(),GETDATE(),GETUTCDATE()

--Consulta de exemplo 18: Amosar uso da función datename para obter o nome de distintas 
--partes dunha data e hora concreta: nanosegundos, segundos, minutos, hora, día, semana, 
--mes e ano da data '20-01-2015 17:28:59.1945901'.
SELECT 
    DATENAME(NANOSECOND, '2015-01-20 17:28:59.1945901') AS Nanosegundos,
    DATENAME(SECOND, '2015-01-20 17:28:59.1945901') AS Segundos,
    DATENAME(MINUTE, '2015-01-20 17:28:59.1945901') AS Minutos,
    DATENAME(HOUR, '2015-01-20 17:28:59.1945901') AS Hora,
    DATENAME(DAY, '2015-01-20 17:28:59.1945901') AS Día,
    DATENAME(WEEK, '2015-01-20 17:28:59.1945901') AS Semana,
    DATENAME(MONTH, '2015-01-20 17:28:59.1945901') AS Mes,
    DATENAME(YEAR, '2015-01-20 17:28:59.1945901') AS Ano;

--Consulta de exemplo 19: Amosar o uso da función datepart para obter o as distintas 
--partes dunha data e hora concreta: nanosegundos, segundos, minutos, hora, día, semana, 
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

--Consulta de exemplo 20: Devolver o día, mes e ano da data '20-01-2015 17:28:59.1945901'.
select YEAR('20-01-2015 17:28:59.1945901'),MONTH('20-01-2015 17:28:59.1945901'),DAY('20-01-2015 17:28:59.1945901')

--Consulta de exemplo 21: Obter a data de inicio das actividades nunha primeira columna, 
--e nas seguintes amosarase o día, mes e ano desa mesma data de inicio.
select a.data_ini,DAY(a.data_ini),MONTH(a.data_ini),YEAR(a.data_ini)
from ACTIVIDADE a