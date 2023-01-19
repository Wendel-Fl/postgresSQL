CREATE TABLE IF NOT EXISTS public.equipe
(
	id integer NOT NULL;
	nome_tecnico character varying (100) COLLATE pg_catalog."default",
	CONSTRAINT equipe_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.equipe;
	OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.uniforme
(
	id integer NOT NULL;
	cor_camisa character varying (80) COLLATE pg_catalog."default",
	cor_calcao character varying (80) COLLATE pg_catalog."default",
	cor_meia character varying (80) COLLATE pg_catalog."default",
	CONSTRAINT uniforme_pkey (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.uniforme;
	OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.pais
(
	id integer NOT NULL,
	nome character varying (100) COLLATE pg_catalog."default",
	continente character varying (100) COLLATE pg_catalog."default",
	populacao integer,
	condicao character varying (80) COLLATE pg_catalog."default"
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pais;

CREATE TABLE IF NOT EXISTS public.jogador;
(
	id integer NOT NULL;
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.jogador;

CREATE TABLE IF NOT EXISTS public.partida
(
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.partida;

CREATE TABLE IF NOT EXISTS public.campo
(
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.campo;