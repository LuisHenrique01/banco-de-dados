-- Database: provaFinal

-- DROP DATABASE "provaFinal";

CREATE DATABASE "provaFinal"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	select * from hospedagem order by num
	select * from hospede
	select * from categoria
	select * from apto
	select * from funcionario
	select * from reserva
	-- A
	select num from hospedagem natural join hospede where nome ilike 'Joao' 
	-- B
	select nome, count(cod_hospeda) as qtd_hospedagem from hospedagem natural join apto 
	natural join categoria group by nome 
	-- C
	select ap.num from apto ap natural left join hospedagem where cod_hospeda isnull
	-- D
	select nome from funcionario where cod_func in 
	(select cod_func from funcionario natural join reserva natural join apto ap
	join categoria ca on ap.cod_cat = ca.cod_cat where ca.nome ilike 'luxo') or 
	cod_func in (select cod_func from funcionario natural join hospedagem natural join apto ap
	join categoria ca on ap.cod_cat = ca.cod_cat where ca.nome ilike 'luxo') 
	
	
	
	
	