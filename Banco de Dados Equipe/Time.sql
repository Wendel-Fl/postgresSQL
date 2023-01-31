DROP TABLE pais, equipe, uniforme, jogador, campo, partida;

CREATE TABLE pais
(
	nome character varying (80),
	continente character varying (80),
	populacao integer NOT NULL,
	condicao character varying (80),
	CONSTRAINT pais_pkey PRIMARY KEY (nome)
);

CREATE TABLE equipe
(
	nome character varying (80),
	nome_tecnico character varying (80),
	pais character varying (10),
	CONSTRAINT equipe_pkey PRIMARY KEY (nome),
	CONSTRAINT equipe_fkey FOREIGN KEY (pais) REFERENCES pais (nome)
);

CREATE TABLE uniforme
(
	numero integer NOT NULL,
	cor_camisa character varying (10),
	cor_calcao character varying (10),
	cor_meia character varying (10),
	equipe character varying (10),
	CONSTRAINT uniforme_pkey PRIMARY KEY (numero),
	CONSTRAINT uniforme_fkey FOREIGN KEY (equipe) REFERENCES equipe (nome)	
);

CREATE TABLE jogador
(
	nome character varying (80),
	numero integer NOT NULL,
	tipo character varying (10),
	equipe character varying (10),
	CONSTRAINT jogador_pkey PRIMARY KEY (nome),
	CONSTRAINT jogador_fkey FOREIGN KEY (equipe) REFERENCES equipe (nome)
);

CREATE TABLE campo
(
	nome_campo character varying (80),
	cidade_campo character varying (10),
	CONSTRAINT nome_campo_pkey PRIMARY KEY (nome_campo)
);

CREATE TABLE partida
(
	equipe1 character varying (10),
	equipe2 character varying (10),
	placar character varying (5),
	juiz character varying (10),
	nome_campo character varying (80),
	CONSTRAINT equipe1_pkey PRIMARY KEY (equipe1,equipe2, nome_campo),
	CONSTRAINT partida_equipe1_fkey FOREIGN KEY (equipe1) REFERENCES equipe (nome),
	CONSTRAINT partida_equipe2_fkey FOREIGN KEY (equipe2) REFERENCES equipe (nome),
	CONSTRAINT partida_nome_campo_fkey FOREIGN KEY (nome_campo) REFERENCES campo (nome_campo)
);