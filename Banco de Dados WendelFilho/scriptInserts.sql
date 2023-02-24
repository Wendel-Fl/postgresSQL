DROP TABLE cliente, vendedor, venda, item, item_venda, item_avaliacao, cliente_avaliacao;

CREATE TABLE cliente(
	codigo INTEGER,
	nome VARCHAR(20),
	cpf VARCHAR(11),
	PRIMARY KEY (codigo)
);

CREATE TABLE vendedor(
	codigo INTEGER,
	nome VARCHAR(20),
	cpf VARCHAR(11),
	PRIMARY KEY (codigo)
);

CREATE TABLE venda(
	codigo_venda INTEGER,
	codigo_cliente INTEGER,
	data DATE,
	codigo_vendedor INTEGER,
	PRIMARY KEY (codigo_venda),
	FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo),
	FOREIGN KEY (codigo_vendedor) REFERENCES vendedor(codigo)
);

CREATE TABLE item(
	codigo_item INTEGER,
	nome_item VARCHAR(15),
	valor_unitario DOUBLE PRECISION,
	PRIMARY KEY (codigo_item)
);

CREATE TABLE item_venda(
	codigo_venda INTEGER,
	codigo_item INTEGER,
	qtde INTEGER,
	FOREIGN KEY (codigo_venda) REFERENCES venda (codigo_venda),
	FOREIGN KEY (codigo_item) REFERENCES item (codigo_item)
);

CREATE TABLE item_avaliacao(
	codigo_avaliacao INTEGER,
	codigo_item INTEGER,
	PRIMARY KEY (codigo_avaliacao),
	FOREIGN KEY (codigo_item) REFERENCES item(codigo_item)
);

CREATE TABLE cliente_avaliacao(
	codigo_avaliacao INTEGER,
	codigo_cliente INTEGER,
	nota INTEGER,
	FOREIGN KEY (codigo_avaliacao) REFERENCES item_avaliacao(codigo_avaliacao),
	FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo)
);

INSERT INTO cliente VALUES (001, 'José Marcos', '12345678900');
INSERT INTO cliente VALUES (002, 'Carlos Alberto', '84895551522');
INSERT INTO cliente VALUES (003, 'Marta Medeiros', '45465666655');

INSERT INTO vendedor VALUES (001, 'Lucas Ferrari', '99393939399');
INSERT INTO vendedor VALUES (002, 'Luana Piovani', '54456655555');

INSERT INTO venda VALUES (001, 001, TO_DATE('10/01/2021', 'MM/DD/YYYY'), 001);
INSERT INTO venda VALUES (002, 002, TO_DATE('10/20/2021', 'MM/DD/YYYY'), 001);
INSERT INTO venda VALUES (003, 001, TO_DATE('11/01/2021', 'MM/DD/YYYY'), 002);
INSERT INTO venda VALUES (004, 003, TO_DATE('11/02/2021', 'MM/DD/YYYY'), 001);

INSERT INTO item VALUES (123, 'SABONETE', 5.00);
INSERT INTO item VALUES (124, 'SHAMPOO', 15.00);
INSERT INTO item VALUES (125, 'CONDICIONADOR', 16.00);
INSERT INTO item VALUES (126, 'CREMDE DENTAL', 6.00);

INSERT INTO item_venda VALUES (001, 123, 5);
INSERT INTO item_venda VALUES (001, 124, 2);
INSERT INTO item_venda VALUES (001, 125, 1);
INSERT INTO item_venda VALUES (002, 123, 2);
INSERT INTO item_venda VALUES (002, 126, 2);

INSERT INTO item_avaliacao VALUES (001, 123);
INSERT INTO item_avaliacao VALUES (002, 124);
INSERT INTO item_avaliacao VALUES (003, 125);
INSERT INTO item_avaliacao VALUES (004, 123);
INSERT INTO item_avaliacao VALUES (005, 126);

INSERT INTO cliente_avaliacao VALUES (001, 001, 9);
INSERT INTO cliente_avaliacao VALUES (002, 001, 7);
INSERT INTO cliente_avaliacao VALUES (003, 001, 8);
INSERT INTO cliente_avaliacao VALUES (004, 002, 6);
INSERT INTO cliente_avaliacao VALUES (005, 002, 9);