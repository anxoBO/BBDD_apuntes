use a23anxobo_sociedade_cultural_2025;

--1º
select nome
from ACTIVIDADE

--2º
select nome,prezo
from ACTIVIDADE

--3º
select *
from COTA

--4º
select nome, prezo, num_prazas
from ACTIVIDADE
where prezo<100

--5º
select nome, prezo, num_prazas
from ACTIVIDADE
where prezo<100
order by prezo desc

--6º
select nome, prezo, num_prazas
from ACTIVIDADE
where prezo<100
order by num_prazas desc,nome asc

--7º
select tipo
from SOCIO

--8º
select nome, ape1, ape2, (salario_mes*0.79)as salario_neto
from EMPREGADO

--9º
select nome, importe
from COTA
where 2*importe>90

--10º
select nome+' '+ape1+' '+ape2 as "nome completo"
from EMPREGADO

--11º
select numero,nome+' '+ape1+' '+ape2 as "nome completo"
from EMPREGADO

--12º
select nome+ ' comeza o'+convert(varchar(15),data_ini,108)
from ACTIVIDADE

--13º
select nome,importe
from COTA
where importe>0

--14º
select nome
from SOCIO
where profesion is null
order by ape1, ape2, nome

--15º
select nome
from SOCIO
where profesion is not null
order by ape1, ape2, nome

--16º
select nome, importe
from COTA
where importe between 50 and 200

--17º
select nome, importe
from COTA
where importe not between 50 and 200

--18º
select nif, nome+' '+ape1+' '+ape2+' '+nome_via_enderezo
from SOCIO
where nome_via_enderezo like 'SAN %'

--19º
select a.numero,convert(varchar(5),a.superficie)+' '+a.estado as superficie_estado
from AULA a
where  a.descricion like 'AULA___R'

--20º
select nif,nome,ape1+' '+ape2 as apelidos
from SOCIO
where ape1 like '[C-G]%'

--21º
select nif,nome,ape1+' '+ape2 as apelidos
from SOCIO
where ape1 like '[^C-G]%'

--22º
select nome, CONVERT(varchar(15),data_ini,103) as data_ini,observacions
from ACTIVIDADE
where observacions like '%\_%' escape '\'

--23º
select nome, prezo
from ACTIVIDADE
where prezo=50 or prezo=80

--25º
select descricion, superficie, estado
from AULA
where estado !='B' and estado!='R'

--26º
select identificador,nome,num_prazas
from ACTIVIDADE
where num_profesorado_imparte=100 or num_aula=2

--27º
select nome,  CONVERT(varchar(15),data_ini,103) as data_ini, CONVERT(varchar(15),data_fin,103) as data_fin
from ACTIVIDADE
where num_prazas>=10 and observacions is null

--Ejercicios Pr�cticas:
--Consultas  BD SOCIEDADE_CULTURAL.

--1. Nome e apelidos (cada un nunha columna) de todos os empregados.
select nome,ape1,ape2
from EMPREGADO
--2. N�mero, nome e apelidos (cada un nunha columna) de todos empregados.
select numero,nome,ape1,ape2
from EMPREGADO
--3. N�mero, nome e apelidos (cada un nunha columna) de todos os empregados por orde alfab�tica de apelidos e nome.
select numero,nome,ape1,ape2
from EMPREGADO
order by ape1,ape2,nome
--4. N�mero, nome e apelidos (cada un nunha columna) de todos os empregados por orde alfab�tica de apelidos e nome. Os nomes das columnas no resultado ser�n: num_socio, nome_socio, apelido1, apelido2.
select numero as num_socio,nome as nome_socio,ape1 as apelido1,ape2 as apelido2
from EMPREGADO
order by ape1,ape2,nome
--5. N�mero, nome completo (os 4 campos nunha �nica columna, de nome socio, co formato numero - ape1 ape2, nome) e salario de todos os empregados. No resultado deber�n aparecer primeiro os que m�is cobran.
select convert(varchar(4),numero)+' - '+ ape1+' '+ape2+', '+nome as "nome_socio"
from EMPREGADO
order by salario_mes desc
--6. N�mero, nome completo (os 4 campos nunha �nica columna, de nome socio, co formato numero - ape1 ape2, nome) e salario de todo o profesorado. No resultado deber�n aparecer primeiro os que m�is cobran. O campo cargo cont�n PRF para o profesorado, e ADM se � un ou unha administrativo.
select convert(varchar(4),numero)+' - '+ ape1+' '+ape2+', '+nome as "nome_socio"
from EMPREGADO
where cargo='PRF'
order by salario_mes desc
--7. N�mero identificador do profesorado que imparte clases. Como � l�xico, se un profesor imparte m�is dunha actividade, o seu n�mero s� pode aparecer unha vez.
select e.numero
from EMPREGADO e,ACTIVIDADE a
where e.cargo='PRF' and a.num_profesorado_imparte=e.numero
--8. N�mero identificador das actividades �s que asiste profesorado, � dicir, cursadas por profesorado. 
select p.num_profesorado
from  PROFE_CURSA_ACTI p
--9. Nome, importe, e importe rebaixado un 20%, da actividade de nome xadrez.
select nome,prezo,prezo*0.8 as rebaixa
from ACTIVIDADE
where nome='xadrez'
--10. NIF, nome e apelidos dos socios dos que non temos tel�fono gardado.
select nif,nome,ape1,ape2
from SOCIO
where telefono1 is null
--11. NIF, nome, apelidos e data de nacemento dos socios nados entre 1980 e 1990, ambos inclu�dos.
select nif, nome,ape1,ape2,data_nac
from SOCIO
where YEAR(data_nac)between 1980 and 1990
--12. Todos os datos das actividades cuxo nome cont�n a letra T.
select *
from ACTIVIDADE
where nome like'%t%'
--13. Nome e importe das cotas cun custo de 30 ou 100 euros.
select nome, importe
from COTA
where importe=30 or importe=100
--14. Nome e n�mero de prazas das actividades que non te�en nin 15 nin 20 prazas.
select nome,num_prazas
from ACTIVIDADE
where num_prazas not in (15,20)

--Seleccionamos a BD EMPRESA_XG
USE a23anxobo_EMPRESA_XG;

-- Enunciados consultas resumen.
--1. Media de unidades vendidas por vendedor.
select avg(e.cota_de_vendas)
from EMPREGADO e

--2. Prezo m�is barato de produto, prezo m�is caro,
--prezo medio, suma de todos os prezos 
--e n�mero de produtos distintos existentes.
select min(prezo)as minimo,max(prezo)as maximo,sum(prezo)as suma,count(distinct identificador) as total
from PRODUTO

--3. N�mero de pedidos realizados polo cliente 1103.
select count(p.numero) as pedidos1103
from PEDIDO p
where p.num_cliente=1103

--4. N�mero de pedidos realizados por cada cliente.
select count(p.cantidade)as cantidade,p.num_cliente
from PEDIDO p
group by p.num_cliente

--5. N�mero de pedidos realizados por cada cliente
--s� para os clientes que fixeran m�is de 2 pedidos.
select count(p.cantidade)as cantidade,p.num_cliente
from PEDIDO p
group by p.num_cliente
having count(p.cantidade)>2
--6. N�mero de pedidos realizados por cada cliente
--s� para os clientes que fixeran m�is de 2 pedidos
--e que ademais te�en unha media de unidades 
--mercadas (cantidade) inferior a 10.
select count(p.cantidade)as cantidade,p.num_cliente
from PEDIDO p
group by p.num_cliente
having count(p.cantidade)>2 and avg(p.cantidade)<10

--7. Cantidade total de sucursais que hai por rexi�n. 
--Aparecer� o nome da rexi�n e na mesma columna 
--separado por un gui�n, a cantidade de sucursais
--situadas nesa rexi�n.
select s.rexion+' - '+convert(varchar(6),count(s.identificador))as "sucursal por rexion"
from SUCURSAL s
group by s.rexion

