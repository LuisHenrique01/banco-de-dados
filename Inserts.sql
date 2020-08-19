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
	
insert into categoria values(3, 'simples', 'Cama ruim', 50);
insert into categoria values(1, 'luxo', 'E dinheiro', 250),
(2, 'media', 'Da pro gasto', 150);
select * from hospede

insert into apto values(101, 1, 'Cobertura');
insert into apto values(102, 1, 'Terreo'), 
(103, 2, 'Terreo'),
(104, 2, 'Terreo'),
(105, 3, 'Terreo');

insert into hospede values(1, 'Douglas Costas', '1995-01-11'), 
(2, 'Goios', '1989-09-09'),
(3, 'Neymar', '1990-09-19'),
(4, 'Lucas Mugyne', '1996-10-22'), 
(5, 'Negueba', '1998-01-02'),
(6, 'Alex Muralha', '1988-07-24'),
(7, 'Ronaldinho', '1985-08-13');


insert into funcionario values(1, 'Lewandovis', '2001-10-11'), 
(2, 'Szczęsny', '1990-09-09'),
(3, 'Lewandowski', '1996-02-19'),
(4, 'Rranck Ribéry', '1994-12-22'),
(5, 'Reus', '1997-11-09');

insert into hospedagem(dt_ent, cod_func, num, cod_hosp, cod_hospeda) values
('2019-09-07', 1, 101, 2, 2);
insert into hospedagem(dt_ent, cod_func, num, cod_hosp, cod_hospeda, dt_sai) values
('2019-09-07', 2, 101, 1, 3, '2019-09-11');
insert into hospedagem(dt_ent, cod_func, num, cod_hosp, cod_hospeda, dt_sai) values
('2019-09-06', 4, 104, 4, 4, '2019-09-11');
insert into hospedagem(dt_ent, cod_func, num, cod_hosp, cod_hospeda, dt_sai) values
('2019-07-07', 3, 105, 5, 5, '2019-08-11');

select * from hospedagem;

insert into reserva values
('2019-09-07', '2019-09-06', 1, 101, 2, 2),
('2018-04-12', '2018-04-14', 5, 104, 4, 3),
('2019-11-21', '2019-12-01', 4, 102, 2, 4),
('2017-02-28', '2018-03-04', 3, 103, 3, 5)






