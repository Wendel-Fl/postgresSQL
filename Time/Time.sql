DROP TABLE equipe, uniforme, pais, jogador, partida, campo;

CREATE TABLE IF NOT EXISTS public.equipe
(
	nome character varying (100) COLLATE pg_catalog."default",
	nome_tecnico character varying (100) COLLATE pg_catalog."default",
	pais character varying (100) COLLATE pg_catalog."default",
	CONSTRAINT equipe_pkey PRIMARY KEY (nome),
	CONSTRAINT equipe_fkey FOREIGN KEY (pais) REFERENCES pais (nome)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.equipe
	OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.uniforme
(
	numero integer NOT NULL,
	cor_camisa character varying (80) COLLATE pg_catalog."default",
	cor_calcao character varying (10) COLLATE pg_catalog."default",
	cor_meia character varying (10) COLLATE pg_catalog."default",
	equipe character varying (10) COLLATE pg_catalog."default",
	CONSTRAINT uniforme_pkey PRIMARY KEY (numero),
	CONSTRAINT uniforme_fkey FOREIGN KEY (equipe) REFERENCES equipe (nome)	
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.uniforme
	OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.pais
(
	nome character varying (100) COLLATE pg_catalog."default",
	continente character varying (100) COLLATE pg_catalog."default",
	populacao integer NOT NULL,
	condicao character varying (80) COLLATE pg_catalog."default",
	CONSTRAINT pais_pkey PRIMARY KEY (nome)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pais
	OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.jogador
(
	nome character varying (100) COLLATE pg_catalog."default",
	numero integer NOT NULL,
	tipo character varying (10) COLLATE pg_catalog."default",
	equipe character varying (10) COLLATE pg_catalog."default",
	CONSTRAINT jogador_pkey PRIMARY KEY (nome),
	CONSTRAINT jogador_fkey FOREIGN KEY (equipe) REFERENCES equipe (nome)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.jogador
	OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.partida
(
	equipe1 character varying (10) COLLATE pg_catalog."default",
	equipe2 character varying (10) COLLATE pg_catalog."default",
	placar character varying (5) COLLATE pg_catalog."default",
	juiz character varying (100) COLLATE pg_catalog."default",
	nome_campo character varying (80) COLLATE pg_catalog."default",
	CONSTRAINT equipe1_pkey PRIMARY KEY (equipe1),
	CONSTRAINT equipe2_pkey PRIMARY KEY (equipe2),
	CONSTRAINT nome_campo_pkey PRIMARY KEY (nome_campo),
	CONSTRAINT partida_equipe1_fkey FOREIGN KEY (equipe1) REFERENCES equipe (nome),
	CONSTRAINT partida_equipe2_fkey FOREIGN KEY (equipe2) REFERENCES equipe (nome),
	CONSTRAINT partida_nome_campo_fkey FOREIGN KEY (nome_campo) REFERENCES campo (nome_campo)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.partida
	OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.campo
(
	nome_campo character varying (10) COLLATE pg_catalog."default",
	cidade_campo character varying (10) COLLATE pg_catalog."default",
	CONSTRAINT nome_campo_pkey PRIMARY KEY (nome_campo)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.campo
	OWNER to postgres;