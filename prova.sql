-- Database: prova

-- DROP DATABASE prova;

CREATE DATABASE prova
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	-- 1
	select cl.nome from cliente cl natural join venda v where v.cod_venda in 
	(select v.cod_venda from venda v natural join item_venda natural join produto where 
	valor in (select min(valor) from produto)) 
	-- 2
	select cl.nome, count(v.cod_ven) compras from cliente cl natural join venda v 
	group by cl.nome order by count(v.cod_ven) desc
	-- 3
	-- 4
	select pd.cod_prod, pd.nome from produto pd natural left join item_venda where 
	cod_venda isnull
	-- 5
	select cl.nome from cliente cl natural join venda v join vendedor vd on 
	vd.cod_ven = v.cod_ven where cl.dt_nasc in (select min(dt_nasc) from cliente) 
	and vd.dt_nasc in (select min(dt_nasc) from vendedor)
	-- 6
	select distinct vd.nome from vendedor vd natural join venda v natural join compra ca 
	join item_compra ic on ic.cod_compra = ca.cod_compra join produto pd on 
	pd.cod_prod = ic.cod_prod join item_venda iv on iv.cod_prod = pd.cod_prod
	where pd.valor > 100 and extract(month from ca.dt_compra) = 11 and 
	extract(month from v.dt_venda) = 11 and extract(year from ca.dt_compra) = 2019
	and extract(year from v.dt_venda) = 2019
	
	
	
	
	