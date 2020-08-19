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
	
	
create table CATEGORIA(
cod_cat int not null primary key,
nome varchar(50) not null,
descr varchar(150) not null,
valor_dia float not null 
);

create table APTO(
num int not null primary key,
cod_cat int not null references CATEGORIA(cod_cat),
localiz varchar(30)
);

create table HOSPEDE(
cod_hosp int not null primary key,
nome varchar(50) not null,
dt_nasc date not null 
);

create table FUNCIONARIO(
cod_func int not null primary key,
nome varchar(50) not null,
dt_nasc date not null
);

create table HOSPEDAGEM(
dt_sai date,
dt_ent date not null,
cod_func int not null,
num int not null,
cod_hosp int not null,
cod_hospeda int not null,
constraint pri_hospedagem primary key(cod_hospeda),
constraint st_hospedagem1 foreign key(cod_func) references FUNCIONARIO(cod_func),
constraint st_hospedagem2 foreign key(num) references APTO(num),
constraint st_hospedagem3 foreign key(cod_hosp) references HOSPEDE(cod_hosp)
);

create table RESERVA(
dt_prev_ent date not null,
dt_res date not null,
cod_func int not null,
num int not null,
cod_hosp int not null,
cod_res int not null,
constraint pri_reserva primary key(cod_res),
constraint st_reserva1 foreign key(cod_func) references FUNCIONARIO(cod_func),
constraint st_reserva2 foreign key(num) references APTO(num),
constraint st_reserva3 foreign key(cod_hosp) references HOSPEDE(cod_hosp)
);

select * from APTO;
