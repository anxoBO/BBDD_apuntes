use a23anxobo_EMPRESA;

--1. Nome de todos os fabricantes dos que se fixeron pedidos.
select distinct f.nome
from FABRICANTE f inner join PEDIDO p on f.codigo=p.cod_fabricante

--2. Nome de todos os fabricantes con ou sen pedidos.
--Se tiveron pedidos aparecer? o n?mero de pedido.
--Se non ten pedidos aparecer? como n?mero de pedido 99.
select f.nome,isnull(p.id_produto,99)as id_producto
from FABRICANTE f left join PEDIDO p on f.codigo=p.cod_fabricante

--3. Nome de todos os fabricantes con ou sen pedidos.
--Se tiveron pedidos aparecer? o n?mero de pedido.
--Se non ten pedidos aparecer? 'Sen pedidos'.
select f.nome,convert(varchar(20),isnull(p.id_produto,'sen pedidos'))as id_producto
from FABRICANTE f left join PEDIDO p on f.codigo=p.cod_fabricante


--4. C?digo dos produtos (cod_fabricante-id_produto) en unha columna e
--a descrici�n,  solo de los  produtos que non foron pediDOS
select p.cod_fabricante+'-'+p.identificador as productos
from PRODUTO p left join PEDIDO pe
on p.cod_fabricante=pe.cod_fabricante and p.identificador=pe.id_produto
where pe.numero is null

--5. Produto cartesiano entre a t?boa de 
--sucursais e a de empregados, con os nomes completos dos 
--empregados en unha columna. 
select *
from  SUCURSAL s cross join EMPREGADO p

--6. N�mero e nome completo de todos os empregados, 
--as? como a cidade da sucursal que dirixen. 
--Nos empregados que non son directores de sucursais, 
--aparecer? 'Non ? director.'.
select e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome completo",ISNULL(s.cidade,'Non e director') as ciudad
from EMPREGADO e left join SUCURSAL s on e.numero=s.num_empregado_director


--7. N?mero e nome completo dos empregados que te�en xefe, 
--co n�mero do seu xefe nunha segunda columna. 
select e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome completo",em.numero
from EMPREGADO e left join EMPREGADO em on e.num_empregado_xefe=em.numero

--8, N�mero e nome completo dos empregados que te�en xefe, 
--co n?mero e nome do seu xefe nunha segunda columna. 
select e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome completo",convert(varchar(10),em.numero)+' '+em.nome as "empregado xefe"
from EMPREGADO e left join EMPREGADO em on e.num_empregado_xefe=em.numero

--8a, N�mero e nome completo de todos os empregados, dos que te�en xefe, 
--co n�mero e nome do seu xefe nunha segunda columna. e si non te�en xefe que po�a: 'Xefe por designar.'
select e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome completo",isnull(convert(varchar(10),em.numero)+' '+em.nome,'xefe por designar') as "empregado xefe"
from EMPREGADO e left join EMPREGADO em on e.num_empregado_xefe=em.numero

--9. Nome completo de todos os empregados co 
--nome dos clientes que te�en asignado, as� como os dos clientes
--ainda que non tiveran empregado. 
SELECT e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome empregado",c.nome
FROM EMPREGADO e FULL JOIN CLIENTE c ON e.numero=c.num_empregado_asignado

--10. Escolle unha das t�as soluci�ns das consultas propostas 
--nas que empregaches un LEFT JOIN, e modif?caa usando RIGHT JOIN.
select e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome completo",isnull(convert(varchar(10),em.numero)+' '+em.nome,'xefe por designar') as "empregado xefe"
from EMPREGADO em right join EMPREGADO e on e.num_empregado_xefe=em.numero


--use a23anxobo_sociedade_cultural_2025
--alter table ACTIVIDADE
--	 alter column num_aula int null

--insert into ACTIVIDADE (identificador,nome,data_ini,data_fin,num_prazas,prezo, observacions,num_profesorado_imparte,num_aula)
--values (99,'PROBA PARA FULL JOIN','12-02-2015 16:30','12-02-2015 16:30',99,9.990,'fila para proba full join',300,null)


use a23anxobo_sociedade_cultural
select au.*,a.nome,a.prezo,a.num_aula
from ACTIVIDADE a right join AULA au on a.num_aula=au.numero


select s.ape1+' '+s.ape2+', '+s.nome as nome_completo
from SOCIO s inner join SOCIO_REALIZA_ACTI sa on sa.num_socio=s.numero
where sa.pagada='N'
order by nome_completo


select e.nome
from EMPREGADO e inner join ACTIVIDADE a on a.num_profesorado_imparte=e.numero
where e.cargo='PRF' and a.identificador=20


SELECT so.nome
FROM SOCIO so
INNER JOIN SOCIO_REALIZA_ACTI s ON so.numero=s.num_socio
INNER JOIN ACTIVIDADE a ON s.id_actividade = a.identificador
WHERE a.nome = 'TENIS PARA PRINCIPIANTES';

--Consultas propostas na BD EMPRESA.
use a23anxobo_EMPRESA
-- 1. Empregando unha consulta composta realizar unha listaxe do código do fabricante e identificador daqueles produtos con prezo superior 
--     a 60€ ou que teñan pedidos de cantidade inferior a 5 unidades. O resultado aparecerá ordenado por fabricante e para o mesmo fabricante por produto.
select p.cod_fabricante,p.identificador
from PRODUTO p
where p.prezo<60
union
select p.cod_fabricante,p.id_produto
from PEDIDO p
where p.cantidade<5
order by p.cod_fabricante,p.identificador

-- 2. Empregando unha consulta composta amosar os código dos empregados que non fixeron pedidos. Deberán aparecer primeiro os empregados con código maior.
select e.numero
from EMPREGADO e
except 
select num_empregado
from PEDIDO
order by numero desc
-- 3. Empregando unha consulta composta amosar o código dos clientes que fixeron pedidos e con límite de crédito maior ou igual a 40000. Usa unha diferenza para resolver esta consulta.
select p.num_cliente
from pedido p 
except
select c.numero
from CLIENTE c
where c.limite_de_credito>=40000
order by num_cliente
-- 4. Empregando unha consulta composta amosar os código dos clientes que fixeron pedidos e con límite de crédito maior ou igual a 40000. 
--    Usa unha intersección para resolver esta consulta. Ordena o resultado por código de cliente en orde ascendente.
select p.num_cliente
from pedido p 
intersect
select c.numero
from CLIENTE c
where c.limite_de_credito>=40000
order by num_cliente
-- 5. Empregando unha consulta composta amosar o código dos empregados que son directores dalgunha sucursal ou que teñen unha cota de vendas superior a 250000€. 
select s.num_empregado_director
from SUCURSAL s
union
select e.numero
from EMPREGADO e
where e.cota_de_vendas>250000

select s.num_empregado_director
from SUCURSAL s
union all
select e.numero
from EMPREGADO e
where e.cota_de_vendas>250000

--Debes propoñer dúas solucións: 
-- na primeira só pode aparecer unha vez cada empregado no resultado, e,
-- na segunda se un empregado é director dunha sucursal e ademais ten unha cota superior a 250000€, aparecerá no resultado máis dunha vez.
use a23anxobo_SOCIEDADE_CULTURAL
--1
select e.nome+' '+e.ape1+' '+e.ape2
from EMPREGADO e
where e.salario_mes>(select e.salario_mes*1.5
						  from EMPREGADO e
						  where e.nif='22222222B')

--2
select distinct s.cod_cota
from SOCIO s
where s.cod_cota in (select c.codigo
					from COTA c 
					where c.importe between 50 and 100)


select distinct s.cod_cota
from SOCIO s inner join COTA c
on s.cod_cota=c.codigo
where c.importe between 50 and 100

--3
select e.nif,e.nome,e.ape1,e.ape2
from EMPREGADO e 
where e.numero not in (select a.num_profesorado_imparte
					    from ACTIVIDADE a)

select e.nif,e.nome,e.ape1,e.ape2
from EMPREGADO e left join PROFE_CURSA_ACTI p on e.numero=p.num_profesorado
where e.numero not in (select a.num_profesorado_imparte
					    from ACTIVIDADE a)

--4
select *
from AULA a
where exists (select *
			from AULA a
			where a.estado='B')

--5
select *
from AULA a
where not exists (select *
			from AULA a
			where a.estado='B')


use a23anxobo_EMPRESA
--1
	--Nome de todos os fabricantes dos que hai 
	--produtos na BD. Non se permite usar 
	--combinaci�ns nesta consulta.
	
select f.nome
from FABRICANTE f
where f.codigo in (select p.cod_fabricante
					from PRODUTO p)
--2
	--Nome de todos os fabricantes dos que non hai 
	--produtos na BD. 
	--Non se permite usar combinaci�ns nesta consulta.
select f.nome
from FABRICANTE f
where f.codigo not in (select p.cod_fabricante
						from PRODUTO p)
	
--3
	--N�mero de pedido, cantidade e data de pedido para 
	--aqueles pedidos recibidos nos d�as en que un novo 
	--empregado foi contratado. 
select p.numero,p.cantidade,p.data_pedido
from PEDIDO p
where day(p.data_pedido)in(select day(e.data_contrato)
							from EMPREGADO e)
	
--4
	--Cidade e obxectivo das sucursais cuxo obxectivo 
	--supera a media das cotas de todos os vendedores da BD. 
select s.cidade,s.obxectivo
from SUCURSAL s
where s.obxectivo >(select avg(e.cota_de_vendas)
					from EMPREGADO e)

--5
	--N�mero de empregado e cantidade media dos pedidos 
	--daqueles empregados cuxa cantidade media de pedido 
	--� superior � cantidade media global (de todos os pedidos).  
select e.numero,AVG(p.cantidade) as cantidade_media
from EMPREGADO e inner join PEDIDO p on p.num_empregado=e.numero
group by e.numero
having AVG(p.cantidade) >(select AVG(p.cantidade)
						from PEDIDO p)

--6
	--Nome dos clientes que a�nda non fixeron pedidos. 
select c.nome
from CLIENTE c
where c.numero not in(select p.num_cliente
						from PEDIDO p)

--7
	--Nome completo dos empregados cuxas cotas son iguais 
	--ou superiores ao obxectivo da sucursal da cidade de Vigo. 
	--Ten en conta que se a cota dun vendedor (empregado) � nula 
	--debemos considerala como un 0, e do mesmo xeito actuaremos 
	--co obxectivo da sucursal. 
select e.numero,e.ape1+' '+isnull(e.ape2,' ')+', '+e.nome as "nome empregado",e.cota_de_vendas
from EMPREGADO e
where isnull(e.cota_de_vendas,0)>=(select isnull(s.obxectivo,0)
						 from SUCURSAL s
						 where s.cidade='Vigo')

--8
	--Nome dos produtos para os que existe polo menos un pedido 
	--que ten unha cantidade de polo menos 20 unidades. A soluci�n deber� 
	--facerse empregando o predicado EXISTS cunha subconsulta 
	--correlacionada. 
SELECT p.descricion
FROM PRODUTO p
WHERE EXISTS (
    SELECT 1
    FROM PEDIDO od
    WHERE od.id_produto = p.identificador
    AND od.cantidade >= 20
);
--9
	--Cidades das sucursais onde exista alg�n empregado cuxa 
	--cota de ventas represente m�is do 80% do obxectivo da 
	--oficina onde traballa. Para resolver esta consulta deberase 
	--empregar unha subconsulta correlacionada precedida de ANY.
SELECT s.cidade
FROM SUCURSAL s
WHERE s.identificador IN (SELECT e.id_sucursal_traballa
							FROM EMPREGADO e
							WHERE e.cota_de_vendas > ANY (SELECT s.obxectivo * 0.8
															FROM SUCURSAL s
															WHERE s.identificador = e.id_sucursal_traballa)
    GROUP BY e.id_sucursal_traballa
);


--10
	--Nome dos clientes cuxos empregados asignados traballan en 
	--sucursais da rexi�n OESTE. Non se poden usar joins, 
	--s� subconsultas encadeadas.
select c.nome
from CLIENTE c
where c.num_empregado_asignado in (select e.numero
									from EMPREGADO e
									where e.id_sucursal_traballa in (select s.identificador
																		from SUCURSAL s
																		where s.rexion='OESTE'))



/****************************************************/
/******* FUNCIONES AGREGADO Y AGRUPACION ************/
/****************************************************/
use a23anxobo_ALMACEN_25

-- 1. Visualizar todos los Oficios y el n?mero de EMPLEADOS de la empresa que los desempe?an
select e.Oficio,count(e.IDEmpleado) as 'total empleados'
from EMPLEADOS e
group by e.Oficio
-- 2. Visualizar todos los Oficios y el n?mero de EMPLEADOS de la empresa que lo desempe?an,
-- siempre que sean m?s de uno
select e.Oficio,count(e.IDEmpleado) as 'total empleados'
from EMPLEADOS e
group by e.Oficio
having COUNT(e.IDEmpleado)>1

-- 3. Hallar el gasto salarial (salario + comision) anual de la empresa, suponiendo 14 pagas
SELECT SUM((e.Comision + e.Salario) * 14) AS gasto_salarial_total
FROM EMPLEADOS e;

-- 4. Obtener el n?mero de EMPLEADOS que hay por cada Oficio en cada departamento de la empresa
select d.Nombre,count(e.IDEmpleado)as 'total empleados'
from EMPLEADOS e right join DEPARTAMENTOS d 
on e.IDDepartamento=d.IDDepartamento
group by d.Nombre

-- 5. Calcular el n?mero de Oficios distintos que hay en el departamento 30 de la tabla de EMPLEADOS
select count(e.Oficio) as 'total oficios'
from EMPLEADOS e right join DEPARTAMENTOS d 
on e.IDDepartamento=d.IDDepartamento
where d.IDDepartamento=30
-- 6. Obtener los salarios medios por departamento
select d.Nombre,AVG(e.Salario) as 'media salarios'
from EMPLEADOS e right join DEPARTAMENTOS d 
on e.IDDepartamento=d.IDDepartamento
group by d.Nombre
-- 7. Obtener para cada departamento, cuantos DIRECTORES hay.
select distinct d.Nombre,count(e.Director)
from DEPARTAMENTOS d left join EMPLEADOS e 
on d.IDDepartamento=e.IDDepartamento
group by d.Nombre

-- 8. Obtener, para cada departamento, cuantos DIRECTORES hay en ese departamento y cual es su salario medio.
select d.Nombre,e.Director,AVG(e.Salario)
from DEPARTAMENTOS d left join EMPLEADOS e 
on d.IDDepartamento=e.IDDepartamento
group by d.Nombre,e.Director
 
-- 9. Obtener el total de euros que hay invertidos entre todos los productos disponibles
select sum(p.PrecioActual)as 'total euros'
from PRODUCTOS p
--10. Visualizar las unidades totales vendidas de cada producto a cada cliente, 
--mostrando el n?mero de producto, el n?mero de cliente y la suma de las unidades
 select count(p.Unidades),pr.IDProducto,c.IDCliente
 from (PEDIDOS p inner join PRODUCTOS pr 
 on p.IDProducto=pr.IDProducto)inner join CLIENTES c 
 on c.IDCliente=p.IDCliente
 group by pr.IDProducto,c.IDCliente
--11. Obtener las fechas de pedido de los productos, del pedido m?s antiguo y el m?s reciente de cada producto, 
--mostrando tambi?n el n?mero de producto correspondiente
SELECT pr.IDProducto,MIN(p.Fecha_pedido) AS Fecha_Pedido_Antiguo,MAX(p.Fecha_pedido) AS Fecha_Pedido_Reciente
FROM PEDIDOS p INNER JOIN PRODUCTOS pr ON p.IDProducto = pr.IDProducto
GROUP BY pr.IDProducto;

--12. Obtener los n?meros de cliente de los dos clientes con mayor n?mero de pedidos, 
--indicando tambi?n cuantos pedidos han hecho.
select  top 2 c.IDCliente,count(p.IDPedido)as 'total pedidos'
from CLIENTES c left join PEDIDOS p 
on c.IDCliente=p.IDCliente
group by c.IDCliente
order by [total pedidos]desc
--13. Obtener las localidades en las que haya m?s de un cliente, visulizando cuantos clientes hay.
 select c.Localidad,count(c.IDCliente) as 'total clientes'
 from CLIENTES c
 group by c.Localidad
 having COUNT(c.IDCliente)>1


--14. Listar los n?meros de cliente que tengan m?s de dos pedidos, ordenado por cantidad de pedidos
 

--15. Obtener los datos de los 4 productos de los que m?s unidades se han vendido, 
--visualizando el n?mero de producto y las unidades vendidas
 

--16. Obtener el total de unidades por producto que hay entre todos los pedidos, 
-- visualizando el n?mero de producto, la descripci?n y la suma de todas las unidades.
 

--17. Obtener los salarios medios por departamento, ordenados descendentemente por dicho importe, 
-- cuando dichos salarios medios sean inferiores a 3000 euros
 

--18. Obtener los salarios medios por DEPARTAMENTOS de los vendedores y cu?ntos hay en cada departamento, 
--siempre que ese salario medio sea mayor de 1.200
 

--19. Obtener el n?mero de departamento con mayor salario medio de sus EMPLEADOS, 
--visualizando tambi?n el valor del salario medio correspondiente.
 

--20. Obtener aquellos IDs de productos de los que se ha realizado m?s de un pedido 
--con la fecha de pedido anterior a 1 de enero del 2017.
 
  
 

/****************************************************/
/*************** SUBCONSULTAS ***********************/
/****************************************************/

--1. Listar los nombres y c?digos de los DEPARTAMENTOS en los que haya EMPLEADOS.
 

--2. Listar los nombres y c?digos de los DEPARTAMENTOS en los que no haya EMPLEADOS.
 

--3-. Obtener los datos del pedido m?s reciente.
 

--4. Pare el departamento de COMERCIAL, visualizar para cada Oficio la suma de los salarios de los EMPLEADOS
 

--5. Obtener un listado con el n?mero y nombre de los clientes atendidos por el vendedor con nombre 'CALVO'.
 

--6. Obtener un listado con los n?meros de pedido, n?meros de producto y fecha de los pedidos 
--realizados por el cliente con nombre 'EDICIONES SANZ'.
 

--7. Visualizar los datos del producto m?s caro.
 
--8. Obtener los vendedores(comerciales) con dos o m?s clientes asignados.
 

--9. Seleccionar aquellos EMPLEADOS cuyo salario sea menor a la media de los salarios de su departamento.


--10. Obtener los nombres y las localidades de los clientes que tengan realizado pedidos.
 

--11. Visualizar los vendedores con clientes que no tengan ning?n pedido.
 


--12. Conseguir el nombre y Oficios de los EMPLEADOS del departamento 10 cuyo Oficio sea id?ntico al de cualquiera de los EMPLEADOS 
-- del departamento de COMERCIAL.


	
--13. Seleccionar el departamento en el que trabaja el empleado con mayor salario, visualizando el nombre del departamento.



--14. Obtener los datos del producto con m?s unidades en los pedidos de los clientes.
 

/****************************************************/
/********** CONSULTAS MULTITABLA ********************/
/****************************************************/

--1. Obtener un listado de clientes, indicando el n?mero de cliente y su nombre, y el n?mero y nombre de sus vendedores.
 

--2. Listar todos los pedidos realizados con la descripci?n del producto y el nombre del cliente en lugar de sus n?meros.
 

--3. Obtener una lista de los pedidos con la descripci?n del producto y el nombre del cliente de los clientes de MADRID.
 

--4. Visualizar el nombre del departamento, la fecha de alta, el apellido, el oficio y el nombre de localidad de aquellos trabajadores 
--que est?n en un departamento ubicado en una localidad que no contenga ninguna C en su nombre.
 

--5. Obtener una lista de los nombres de los clientes con el importe acumulado de sus pedidos.



--6. Obtener una lista de los pedidos con la descripci?n del producto y el nombre del cliente clasificados por el n?mero del cliente.



--7. Obtener los nombres de los EMPLEADOS y los nombres de sus DEPARTAMENTOS, 
--para aquellos EMPLEADOS que no son del departamento COMERCIALES y que entraron en la empresa despu?s del 1 de enero de 82.


--8. Obtener una lista de los apellidos de los vendedores con el importe acumulado de sus pedidos.


--9. Realizar un listado de los EMPLEADOS cuyo oficio es EMPLEADO, que incluir? su id de empleado, el nombre y el salario anual,
-- sabiendo que el salario anual es el salario multiplicado por 14, e incluyendo en este listado el nombre del director del empleado.


--10. Visualizar los productos con el n?mero total de pedidos, las unidades totales vendidas, y el precio unidad de cada uno de ellos incluyendo los que no tienen pedidos (en este caso se mostrar? un 0 en el total unidades vendidas)


--11. Obtener el n?mero de pedidos por producto, visualizando el n?mero de producto, su descripci?n y el n?mero de pedidos correspondiente.


--12. Visualizar los nombres de los clientes y la cantidad de pedidos realizados, incluyendo los que no hayan realizado ning?n pedido.



--13. Realizar un listado de todos los productos con su descripci?n y el importe total (unidades totales por el precio unidad) de cada uno de ellos. Deben mostrarse todos los productos incluidos los que no tiene pedidos y en este caso en importe total se mostrar? un 0.


--14. Visualizar los apellidos de los EMPLEADOS y el n?mero de clientes que tienen, visualizando todos los EMPLEADOS de la empresa tengan o no clientes asignados

----
 use a23anxobo_EMPRESA

 select p.descricion,p.existencias,
	case 
		when p.existencias>20 then 'suficientes'
		else 'insuficientes'
		end as 'cantidade'
from PRODUTO p 

----
select p.numero,pr.descricion,pr.prezo*p.cantidade as 'total',
	case
		when p.cantidade>20 then 'grande'
		when p.cantidade<20 and p.cantidade>10 then 'normal'
		when cantidade<10 and p.cantidade>0 then 'pequeño' 
		else 'error'
		end as 'tipo'
from PEDIDO p inner join PRODUTO pr on pr.identificador=p.id_produto

