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
	
	-- 1
	select cod_cat, nome from categoria where valor_dia between 100 and 200;
	-- 2
	select cod_cat, nome from categoria where nome ilike '%Luxo%' 
	-- 3
	select cod
	-- 4 
	select num from hospedagem where dt_sai isnull 
	-- 5
	select num from apto natural join categoria where cod_cat in (1, 2, 3, 11, 34, 54, 24, 12)
	-- 6
	select num from apto natural join categoria where nome ilike '%luxo%'
	-- 7 
	select count(num) from apto
	-- 8 
	select sum(valor_dia) from categoria
	-- 9 
	select avg(valor_dia) from categoria
	-- 10
	select max(valor_dia) from categoria 
	-- 11
	select min(valor_dia) from categoria 
	-- TESTE
	select valor_dia, count(num) from apto natural join categoria group by valor_dia
	-- 12 
	select h.nome, avg(valor_dia) from categoria cat natural join apto ap
	natural join hospedagem hg join hospede h on h.cod_hosp = hg.cod_hosp group by h.nome  
	-- 13
	select nome, count(num) from apto natural join categoria group by nome
	-- 14
	select nome from apto natural join categoria group by nome having count(num) >= 2
	-- 15 
	select nome from hospede where dt_nasc >= '1970-01-01'
	-- 16
	select count(cod_hosp) from hospede	
	-- 17 
	select num from hospedagem group by num having count(num) >= 2
	-- 18
	alter table hospede add nascionalidade varchar(50)
	-- 19
	select h.nascionalidade, count(h.cod_hosp) from hospede h group by h.nascionalidade
	-- 20 
	select min(dt_nasc) from hospede
	-- 21 
	select max(dt_nasc) from hospede
	-- 22
	update categoria
	set valor_dia = valor_dia*0.1 + valor_dia
	select * from categoria
	-- 23
	insert into categoria(cod_cat, nome, descr, valor_dia)
	values(4, 'ultra', 'Sonhar...', 500)
	select distinct nome from categoria c left join apto ap on ap.cod_cat = c.cod_cat where num isnull
	-- 24
	insert into apto(cod_cat, num, localiz)
	values(2, 106, 'Terreo')
	select distinct ap.num from apto ap left join hospedagem hg on ap.num = hg.num 
	where hg.cod_hospeda isnull
	-- 25
	select num from hospede h natural join hospedagem hg natural join apto ap 
	join categoria ca on ca.cod_cat = ap.cod_cat where h.nome = 'Goios'
	and valor_dia in (select max(valor_dia) from hospede h natural join
					  hospedagem hg natural join apto ap 
					  join categoria ca on ca.cod_cat = ap.cod_cat
					  where h.nome = 'Goios') 
	
	insert into hospedagem(dt_sai, dt_ent, cod_func, num, cod_hosp, cod_hospeda)
	values('2019-03-13', '2019-03-09', 2, 104, 2, 6)
	select * from hospedagem
	select * from hospede
	select * from apto
	select * from categoria
	-- 26
	select nome from hospedagem hg natural join apto ap natural join hospede h
	where ap.num != 101 and h.cod_hosp not in 
	(select cod_hosp from hospedagem where num = 101)
	-- 27
	select h.nome from hospedagem hg natural join apto ap natural join hospede h
	join categoria ca on ca.cod_cat = ap.cod_cat
	where ca.nome not ilike 'luxo' and h.cod_hosp not in 
	(select cod_hosp from categoria ca natural join apto natural join hospedagem 
	where ca.nome ilike 'luxo')
	-- 28 
	select nome from hospede where cod_hosp in 
	(select cod_hosp from hospedagem natural join apto ap 
	 join categoria ca on ca.cod_cat = ap.cod_cat where nome ilike 'luxo') or
	 cod_hosp in ( select cod_hosp from reserva natural join apto ap join 
				 categoria ca on ca.cod_cat = ap.cod_cat where nome ilike 'luxo')
	
	insert into reserva(dt_prev_ent, dt_res, cod_func, num, cod_hosp, cod_res)
	values('2019-12-12', '2019-12-13', 3, 101, 5, 1)
	
	-- 29
	select h.nome from hospede h natural join hospedagem hg natural join apto ap
	join categoria ca on ca.cod_cat = ap.cod_cat where ca.nome ilike 'luxo' and 
	hg.cod_hosp not in (select cod_hosp from reserva re natural join apto ap
					   natural join categoria ca where ca.nome ilike 'luxo')
					   
	-- 30
	select nome from hospede where cod_hosp in 
	(select cod_hosp from hospedagem hg natural join apto ap natural join
	categoria ca where ca.nome ilike 'luxo') and cod_hosp in 
	(select cod_hosp from reserva re natural join apto ap natural join
	categoria ca where ca.nome ilike 'luxo')
	
	
	
	