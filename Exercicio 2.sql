-- Database: bancoEstudos

-- DROP DATABASE "bancoEstudos";

CREATE DATABASE "bancoEstudos"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

    
	alter table hospede add nascionalidade varchar(50)
	-- 1
	select nome, dt_nasc from hospede order by nome asc, dt_nasc desc
	-- 2
	select nome as Categoria from categoria order by nome asc
	-- 3 
	select valor_dia, num from categoria natural join apto order by valor_dia desc 
	-- 4 
	select nome from categoria where cod_cat in (
	select ca.cod_cat from categoria ca natural join apto ap
	group by cod_cat having count(num) = 1)
	-- 5 
	select nome, extract(month from dt_nasc) as mes, extract(year from dt_nasc) as ano
	from hospede where nascionalidade ilike 'Brasil' order by ano asc, nome asc 
	-- 6
	select nome, num, count(nome) from hospede natural join hospedagem
	group by nome, num order by count(nome) desc 
	select * from hospede
	-- 7
	select nome from categoria where length(nome) > 15
	-- 8
	select num, nome from hospedagem hg natural join apto ap natural join categoria ca
	where extract(year from dt_ent) = 2017
	-- 9 ERRO
	-- 10
	select * from funcionario
	alter table funcionario add salario int
	-- 11
	select nome, salario+(10*count(hg.cod_hospeda)) salario from hospedagem hg right join 
	funcionario f on hg.cod_func = f.cod_func group by 
	nome, salario
	-- 12
	select nome, num from categoria ca left join apto ap on ca.cod_cat = ap.cod_cat
	order by nome, num
	-- 13
	select nome, coalesce(cast(num as varchar), 'não possui apartamento') from categoria ca 
	left join apto ap on ca.cod_cat = ap.cod_cat order by nome, num
	-- 14
	select nome from funcionario where nome in 
	(select f.nome from hospede h natural join hospedagem hg natural join apto ap join 
	funcionario f on f.cod_func = hg.cod_func join categoria ca on ca.cod_cat = ap.cod_cat
	 where h.nome ilike 'joão' or ca.nome ilike 'luxo')
	or nome in (select f.nome from hospede h natural join reserva re natural join apto ap join 
	funcionario f on f.cod_func = re.cod_func join categoria ca on ca.cod_cat = ap.cod_cat
	 where h.nome ilike 'joão' or ca.nome ilike 'luxo')
	-- 15
	select cod_hospeda from hospedagem natural join hospede where dt_nasc in
	(select min(dt_nasc) from hospedagem natural join hospede where num in 
	 (select num from apto natural join categoria where valor_dia in 
	  (select max(valor_dia) from categoria)))
	-- 16
	select h2.nome from hospede h1 join hospede h2 on h1.cod_hosp != h2.cod_hosp
	where h1.cod_hosp = 2 and h2.dt_nasc = h1.dt_nasc
	-- 17
	select nome from hospede where dt_nasc in (select min(dt_nasc) from hospede natural join 
	hospedagem where cod_hospeda in (select cod_hospeda from hospedagem natural join apto
									 natural join categoria where extract(year from dt_ent)
									 = 2017 and valor_dia in (select max(valor_dia) from 
															categoria)))
	-- 18
	select nome from categoria where cod_cat in 
	(select ca.cod_cat from hospede h natural join reserva re natural join apto ap join 
	categoria ca on ca.cod_cat = ap.cod_cat where h.nome ilike 'goios') or cod_cat in
	(select ca.cod_cat from hospede h natural join hospedagem hg natural join apto ap join
	categoria ca on ca.cod_cat = ap.cod_cat join funcionario f on f.cod_func = hg.cod_func
	 where h.nome ilike 'neymar' and f.nome ilike 'Lewandowski')
	 -- 19
	 select f.nome, dt_nasc, max(valor_dia) from funcionario f natural left join reserva natural left join 
	 apto ap left join categoria ca on ap.cod_cat = ca.cod_cat group by f.nome, dt_nasc 
	-- 20
	select nome, count(num) from hospede h natural left join hospedagem group by nome, num
	-- 21
	select h.nome, dt_ent, dt_sai, (dt_sai - dt_ent)*valor_dia as total from hospedagem hg
	natural join hospede h natural join apto ap join categoria ca on ca.cod_cat = ap.cod_cat
	where not dt_sai isnull
	-- Não é possivel
	
	
	
	
	
	
	
	
	
	
	
	
	