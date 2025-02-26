use a23anxobo_empleados_2025

select NOMDE
from TDEPTO
where PRESU >10
order by NOMDE asc;


select NOMDE
from TDEPTO
where PRESU between 9 and 12
order by NOMDE asc;


select Distinct(t.NUMDE)
from TEMPLE t
where t.SALAR>25;


select distinct convert(varchar,convert(int,comis)*1000)+ ' pts' as COMIS
from TEMPLE t
where t.NUMDE=121;

select convert(varchar,convert(int,comis)*1000)+ ' pts' as COMIS
from TEMPLE t
where t.NUMDE=121;


select convert(varchar,convert(int,isnull(comis,0))*1000)+ ' pts' as COMIS
from TEMPLE t
where t.NUMDE=121;


select NOMEM, SALAR + coalesce(comis,0) as 'sueldo final'
from TEMPLE
order by [sueldo final] asc;


select top 25 t.NOMEM,t.FECNA
from TEMPLE t
order by 1;


select top 10 percent t.NOMEM,t.FECNA
from TEMPLE t
order by 1;


select AVG(t.NUMHI)
from TEMPLE t
where t.NUMDE=112

select count(t.NUMDE)
from TEMPLE t
