
drop table equipe;
 create table equipe (
    id numeric,
     codigo numeric,
     nome varchar (255) not null,
     ano numeric (4),
     pais_id numeric,
     primary key (id));

drop table piloto;
 create table piloto (
    id numeric,
    nome varchar (255),
    data date,
    cpf varchar (11),
    idade numeric,
    equipe_id numeric,
    pais_id numeric,
    categoria_id numeric,
    primary key (id));

drop table pais;
    create table pais (
    id numeric,
    sigla varchar (3),
    nome varchar (255),
    primary key (id));

drop table corrida;
    create table corrida (
    id numeric,
    duracao numeric,
    pais_id numeric,
    data date,
    primary key (id));

drop table circuito;
    create table circuito (
    id numeric,
    cod numeric,
    nome varchar (255));

drop table categoria;
    create table categoria (
    id numeric,
    cat varchar(50),
    primary key (id));


insert into equipe (id, codigo, nome, ano, pais_id) values (1, 123, 'redbull', 2022, 5);
insert into equipe (id, codigo, nome, ano, pais_id) values (2, 456, 'ferrari', 2019, 4);
insert into equipe (id, codigo, nome, ano, pais_id) values (3, 789, 'astonMartin', 2018, 5);
insert into equipe (id, codigo, nome, ano, pais_id) values (4, 101, 'mercedes', 2017, 5);
insert into equipe (id, codigo, nome, ano, pais_id) values (5, 112, 'renault', 2016, 8);
insert into equipe (id, codigo, nome, ano, pais_id) values (6, 131, 'haas', 2015, 2);
insert into equipe (id, codigo, nome, ano, pais_id) values (7, 415, 'mclaren', 2014, 5);
insert into equipe (id, codigo, nome, ano, pais_id) values (8, 161, 'alfaRomeo', 2013, 16);
insert into equipe (id, codigo, nome, ano, pais_id) values (9, 718, 'alphatauri', 2012, 4);
insert into equipe (id, codigo, nome, ano, pais_id) values (10, 191, 'williams', 2011, 5);

insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (1, 'verstappen', '1984-03-11', '00000000001', 'principal', 38, 1, 11);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (2, 'leclerc', '1994-05-24', '00000000002', 'principal', 28, 2, 4);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (3, 'hamilton', '1987-06-13', '00000000003', 'principal', 35, 4, 5);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (4, 'norris', '1996-12-12', '00000000004', 'principal', 26, 7, 5);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (5, 'alonso', '1979-10-23', '00000000005', 'principal', 43, 8, 13);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (6, 'vettel', '1981-07-17', '00000000006', 'principal', 41, 9, 9);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (7, 'magnussen', '1991-10-23', '00000000007', 'principal', 31, 6, 15);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (8, 'perez', '1994-10-23', '00000000008', 'secundario', 28, 1, 10);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (9, 'zhou', '1998-10-23', '00000000009', 'principal', 24, 10, 14);
insert into piloto (id, nome, data, cpf, categoria_id, idade, equipe_id, pais_id) values (10, 'sainz', '1982-10-23', '00000000010', 'secundario', 40, 2, 13);

insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();
insert into categoria(id, cat) values ();

insert into pais (id, sigla, nome) values (1, 'BRA', 'Brasil');
insert into pais (id, sigla, nome) values (2, 'EUA', 'Estados Unidos');
insert into pais (id, sigla, nome) values (3, 'POR', 'Portugal');
insert into pais (id, sigla, nome) values (4, 'ITA', 'Italia');
insert into pais (id, sigla, nome) values (5, 'ING', 'Inglaterra');
insert into pais (id, sigla, nome) values (6, 'BEL', 'Belgica');
insert into pais (id, sigla, nome) values (7, 'JAP', 'Japao');
insert into pais (id, sigla, nome) values (8, 'FRA', 'Franca');
insert into pais (id, sigla, nome) values (9, 'ALE', 'Alemanha');
insert into pais (id, sigla, nome) values (10, 'MEX', 'Mexico');
insert into pais (id, sigla, nome) values (11, 'HOL', 'Holanda');
insert into pais (id, sigla, nome) values (12, 'MON', 'Monaco');
insert into pais (id, sigla, nome) values (13, 'ESP', 'Espaha');
insert into pais (id, sigla, nome) values (14, 'CHI', 'China');
insert into pais (id, sigla, nome) values (15, 'DIN', 'Dinamarca');
insert into pais (id, sigla, nome) values (16, 'SUI', 'Suíça');

insert into corrida (id, duracao, data) values (1, 60, '2022-01-25');
insert into corrida (id, duracao, data) values (2, 60, '2022-02-15');
insert into corrida (id, duracao, data) values (3, 60, '2022-03-17');
insert into corrida (id, duracao, data) values (4, 60, '2022-04-05');
insert into corrida (id, duracao, data) values (5, 60, '2022-05-20');
insert into corrida (id, duracao, data) values (6, 60, '2022-06-07');
insert into corrida (id, duracao, data) values (7, 60, '2022-07-11');
insert into corrida (id, duracao, data) values (8, 60, '2022-08-13');
insert into corrida (id, duracao, data) values (9, 60, '2022-09-09');
insert into corrida (id, duracao, data) values (10, 60, '2022-10-03');

insert into circuito (id, cod, nome) values (1, 1, 'interlagos');
insert into circuito (id, cod, nome) values (2, 2, 'monaco');
insert into circuito (id, cod, nome) values (3, 3, 'leMans');
insert into circuito (id, cod, nome) values (4, 4, 'silverstone');
insert into circuito (id, cod, nome) values (5, 5, 'monteCarlo');


/*
    pilotos participam corrida
    classificação corrida
    tabela pont
*/

