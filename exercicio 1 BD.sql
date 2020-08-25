-- 1
select * from categoria where valor_dia >= 100 and valor_dia <=200;
-- 2
select * from categoria where nome ilike '%luxo%';
-- 5
select * from categoria where cod_cat in (1, 2, 3, 11, 34, 54, 24, 12);
-- 6
select * from categoria where nome ilike 'luxo%';
-- 7 
select count(num) from apartamento;
-- 8
select sum(valor_dia) from categoria;
-- 9
select avg(valor_dia) from categoria;
-- 10
select max(valor_dia) from categoria;
-- 11
select min(valor_dia) from categoria;
-- 12
select avg(valor_dia), hpd.nome from hospedagem as hpg
natural join apartamento as ap natural join categoria as ca
join hospede as hpd on hpd.cod_hosp = hpg.cod_hosp group by hpd.cod_hosp
-- 13
select ap.cod_cat, count(ap.num) from apartamento ap NATURAL join categoria ca group by ap.cod_cat
-- 14
select ap.cod_cat, count(num) from apartamento ap natural join categoria ca group by ap.cod_cat having count(ap.cod_cat) >= 2 
-- 15
select nome from hospede where hospede.dt_nascimento > '1970-01-01'
select nome from hospede where extract(year from hospede.dt_nascimento) >= 1970 and extract(day from hospede.dt_nascimento) > 1
-- 16
select count(cod_hosp) from hospede
-- 17
select num from apartamento ap natural join hospedagem group by num having count(num) >= 2 order by num
-- 18
alter table hospede 
add nacionalidade varchar(100)
-- 19
select hpd.nacionalidade, count(hpd.nacionalidade) from hospede hpd group by hpd.nacionalidade order by count(hpd.hospede.nacionalidade)