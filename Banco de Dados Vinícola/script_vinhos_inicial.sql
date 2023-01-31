DROP TABLE região, vinícola, vinho;

CREATE TABLE região
(
	região_id serial PRIMARY KEY,
	nome_região varchar(60),
	mapa_região varchar(20),
	descrição_região varchar(255)
);

CREATE TABLE vinícola
(
	vinícola_id serial PRIMARY KEY,
	nome_vinícola varchar(60),
	descricao_vinícola varchar(255),
	fone_vinícola varchar(10),
	fax_vinícola varchar(10),
	região_id integer REFERENCES região(região_id)
);

CREATE TABLE vinho
(
	vinho_id serial PRIMARY KEY,
	nome_vinho varchar(60),
	tipo_vinho varchar(60),
	ano_vinho integer,
	descrição_vinho varchar (255),
	preço_vinho double precision,
	vinícola_id integer  REFERENCES vinícola(vinícola_id)
);

INSERT INTO região (nome_região,mapa_região,descrição_região) values ('Toscana','mapa 1','No centro da Itália é cortado pelos Apeninos, uma cadeia montanhosa que se estende por todo o comprimento do território italiano.');
INSERT INTO região (nome_região,mapa_região,descrição_região) values ('Marche','mapa 2','No centro da Itália é cortado pelos Apeninos, uma cadeia montanhosa que se estende por todo o comprimento do território italiano.');

INSERT INTO vinícola (nome_vinícola,região_id) values ('Coltibuono',1); 
INSERT INTO vinícola (nome_vinícola,região_id) values ('Antinori',1);
INSERT INTO vinícola (nome_vinícola,região_id) values ('Macerata',2);

INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (10,'Amanda','tinto',100.00,1);
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (09,'Belinha','branco',200.00,1); 
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (05,'Camila','rosê',300.00,1); 
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (15,'Daniela','branco',250.00,2); 
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (27,'Eduarda','branco',150.00,2);
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (48,'Fernanda','tinto',7.00,2); 
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (13,'Gabriela','tinto',397.00,3); 
INSERT INTO vinho (vinho_id,nome_vinho,tipo_vinho,preço_vinho,vinícola_id) VALUES (12,'Helena','branco',333.00,3); 


SELECT * FROM região;

SELECT região_id, nome_região FROM região WHERE nome_região LIKE 'M%' AND região_id >= 2 AND
mapa_região IS NOT NULL;

SELECT preço_vinho
FROM vinho
WHERE tipo_vinho = 'tinto'
UNION
SELECT preço_vinho
FROM vinho
WHERE tipo_vinho = 'branco';


SELECT nome_vinícola, nome_região
FROM vinícola, região
WHERE vinícola.região_id = região.região_id;




