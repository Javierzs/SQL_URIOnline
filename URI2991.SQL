--*URI 2991*

Select distinct
 depart.nome as "Nombre Departamento",
 (select count(*) from empregado where lotacao = depart.cod_dep) as "Numero Empleados",
ROUND(((select sum(cod_valor) from (select e.nome,
sum( COALESCE(v.valor,0) ) as cod_valor
from empregado e
left join emp_venc ed
on e.matr  = ed.matr
left join vencimento v
on v.cod_venc = ed.cod_venc
where lotacao = depart.cod_dep
group by e.nome)  as tdasd)

-
(select sum(descont) from 
(select e.nome,
	coalesce(sum(dc.valor),0) as descont
	from empregado e
	left join emp_desc ed 
	on ed.matr = e.matr
	left join desconto dc
	on dc.cod_desc = ed.cod_desc
	where e.lotacao = depart.cod_dep
	group by e.nome) as desconto)) / (select count(*) from empregado where lotacao = depart.cod_dep ),2 ) 
as "Salario Promedio",
round(max(totalSalario),2) as "Mayor Salario",
CASE 
WHEN min(totalSalario) = 0 then min(totalSalario)
else Round(min(totalSalario),2)
end 
as "Menor Salario"
from 
(select distinct 
d.nome,
d.cod_dep,
COALESCE(
(SUM((select distinct coalesce(valor,0) from vencimento where cod_venc = ev.cod_venc)))
-
(COALESCE((select  distinct sum( coalesce(valor,0)) from desconto d left join emp_desc ed 
	 on ed.cod_desc = d.cod_desc
	 where ed.matr = e.matr),0)),0) as totalSalario
from empregado e
LEFT join emp_venc ev
on ev.matr = e.matr
left join departamento d
on d.cod_dep = e.lotacao 
group by e.nome,e.matr,d.nome,d.cod_dep
) dados inner join 
departamento depart 
on depart.cod_dep = dados.cod_dep
group by depart.nome,depart.cod_dep
order by "Salario Promedio" desc
