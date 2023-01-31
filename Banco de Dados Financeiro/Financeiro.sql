 DROP TABLE usuarios, lancamentos;

CREATE TABLE usuarios
(
    id integer NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default",
    email character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);

CREATE TABLE lancamentos
(
    id integer NOT NULL,
    usuario_id integer,
    valor numeric(15,2),
    descricao character varying(100) COLLATE pg_catalog."default",
    data date,
    CONSTRAINT lancamentos_pkey PRIMARY KEY (id)
);

insert into usuarios (id,nome,email) values (1,'Laura','lbastos@gmail.com');
insert into usuarios (id,nome,email) values (2,'Marcelo','mrodrigues@hotmail.com');
insert into usuarios (id,nome,email) values (3,'Paula','paula@gmail.com');
insert into usuarios (id,nome,email) values (4,'Pedro','plopes@gmail.com');
insert into usuarios (id,nome,email) values (5,'Roberta','rob@hotmail.com');


insert into lancamentos (id,usuario_id,valor,descricao,data) values (1,1,-100,'pagamento de cartão','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (2,2,-130,'pagamento de cartão','03/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (3,3,-240,'pagamento de cartão','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (4,4,-32,'pagamento de cartão','05/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (5,5,-45,'pagamento de cartão','04/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (6,1,-55,'pagamento de conta','06/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (7,2,-230,'pagamento de conta','12/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (8,3,-500,'pagamento de conta','24/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (9,4,-150,'pagamento de conta','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (10,5,-68,'pagamento de conta','15/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (11,1,900,'transferência recebia','14/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (12,2,1400,'transferência recebia','21/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (13,3,2350,'transferência recebia','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (14,4,-456,'transferência realizada','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (15,5,-700,'transferência realizada','26/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (16,1,100,'recebimento de proventos','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (17,2,390,'recebimento de proventos','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (18,3,2000,'recebimento de proventos','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (19,4,4500,'recebimento de proventos','01/02/2022');
insert into lancamentos (id,usuario_id,valor,descricao,data) values (20,5,6000,'recebimento de proventos','01/02/2022');
