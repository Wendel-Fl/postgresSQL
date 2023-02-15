DROP TABLE pessoa, funcionario_vendedor, cliente, cliente_parcelas_pendentes, funcionario_vendedor_conta,
venda, loja, funcionario_gerente, funcionario_gerente_conta, funcionario_vendedor_comissao, estoque,
estoque_historico, estoque_historico_resp, produto, venda_garantia, produto_estoque;

CREATE TABLE public.pessoa(
	CPF VARCHAR(11),
	nome VARCHAR(30),
	telefone VARCHAR(11),
	endereco VARCHAR(100),
	data_de_nascimento DATE,
	PRIMARY KEY (CPF)
);

CREATE TABLE public.funcionario_vendedor(
	CPF_pessoa VARCHAR(11),
	data_contrato DATE,
	FOREIGN KEY(CPF_pessoa) REFERENCES pessoa(CPF),
	PRIMARY KEY(CPF_pessoa)
);

CREATE TABLE public.cliente(
	CPF_pessoa VARCHAR(11),
	CPF_vendedor_responsavel VARCHAR(11),
	FOREIGN KEY(CPF_pessoa) REFERENCES pessoa(CPF),
	FOREIGN KEY(CPF_vendedor_responsavel) REFERENCES funcionario_vendedor(CPF_pessoa),
	PRIMARY KEY(CPF_pessoa)
);

CREATE TABLE public.cliente_parcelas_pendentes(
	CPF_pessoa VARCHAR(11),
	parcelas_pendetes INT,
	FOREIGN KEY(CPF_pessoa) REFERENCES pessoa(CPF),
	PRIMARY KEY(CPF_pessoa)
);

CREATE TABLE public.funcionario_vendedor_conta(
	CPF_vendedor VARCHAR(11),
	login VARCHAR (20),
	senha VARCHAR (20),
	FOREIGN KEY(CPF_vendedor) REFERENCES funcionario_vendedor(CPF_pessoa),
	PRIMARY KEY(CPF_vendedor)
);

CREATE TABLE public.venda(
	CPF_cliente VARCHAR(10),
	forma_pagamento VARCHAR (20),
	CPF_vendedor VARCHAR (11),
	FOREIGN KEY(CPF_cliente) REFERENCES cliente(CPF_pessoa),
	FOREIGN KEY(CPF_vendedor) REFERENCES funcionario_vendedor(CPF_pessoa),
	PRIMARY KEY(CPF_cliente)
);

CREATE TABLE public.loja(
	CNPJ VARCHAR(14),
	nome VARCHAR(100),
	endereco VARCHAR(100),
	CPF_gerente VARCHAR(11),
	PRIMARY KEY(CNPJ),
	FOREIGN KEY(CPF_gerente) REFERENCES pessoa(CPF)
);

CREATE TABLE public.funcionario_gerente(
	CPF_pessoa VARCHAR(11),
	CNPJ_trabalha VARCHAR(14),
	data_contrato DATE,
	data_promocao DATE,
	PRIMARY KEY(CPF_pessoa),
	FOREIGN KEY(CPF_pessoa) REFERENCES pessoa(CPF),
	FOREIGN KEY(CNPJ_trabalha) REFERENCES loja(CNPJ)
);

CREATE TABLE public.funcionario_gerente_conta(
	CPF_pessoa VARCHAR(11),
	login VARCHAR(15),
	senha VARCHAR(12),
	PRIMARY KEY(CPF_pessoa),
	FOREIGN KEY(CPF_pessoa) REFERENCES funcionario_gerente(CPF_pessoa)
);

CREATE TABLE public.funcionario_vendedor_comissao(
	CPF_pessoa VARCHAR(11),
	comissao INT,
	CNPJ_trabalha VARCHAR(14),
	PRIMARY KEY(CPF_pessoa),
	FOREIGN KEY(CPF_pessoa) REFERENCES pessoa(CPF),
	FOREIGN KEY(CNPJ_trabalha) REFERENCES loja(CNPJ)
);

CREATE TABLE public.estoque(
	CNPJ_loja VARCHAR(14),
	status VARCHAR(5),
	CPF_gerente VARCHAR(11),
	PRIMARY KEY(CNPJ_loja),
	FOREIGN KEY(CNPJ_loja) REFERENCES loja(CNPJ),
	FOREIGN KEY(CPF_gerente) REFERENCES funcionario_gerente(CPF_pessoa)
);

CREATE TABLE public.estoque_historico(
	CNPJ_loja VARCHAR(14),
	protocolo VARCHAR(20),
	data DATE,
	PRIMARY KEY(CNPJ_loja),
	FOREIGN KEY(CNPJ_loja) REFERENCES loja(CNPJ)
);

CREATE TABLE public.estoque_historico_resp(
	CNPJ_loja VARCHAR(14),
	descricao_atividade VARCHAR(20),
	responsavel VARCHAR(30),
	PRIMARY KEY(CNPJ_loja),
	FOREIGN KEY(CNPJ_loja) REFERENCES loja(CNPJ)
);

CREATE TABLE public.produto(
	codigo_produto INT,
	nome VARCHAR(30),
	marca VARCHAR(30),
	preco REAL,
	descricao VARCHAR(10),
	PRIMARY KEY(codigo_produto)
);

CREATE TABLE public.venda_garantia(
	codigo_produto INT,
	numero_NF INT,
	data DATE,
	comprovante_garantia VARCHAR(10),
	PRIMARY KEY(codigo_produto, numero_NF),
	FOREIGN KEY(codigo_produto) REFERENCES produto(codigo_produto)
);

CREATE TABLE public.produto_estoque(
	codigo_produto INT,
	quantidade_estoque INT,
	CNPJ_estoque VARCHAR(14),
	PRIMARY KEY(codigo_produto),
	FOREIGN KEY(codigo_produto) REFERENCES produto(codigo_produto),
	FOREIGN KEY(CNPJ_estoque) REFERENCES estoque(CNPJ_loja)
);
