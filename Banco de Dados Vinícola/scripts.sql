SELECT *
FROM região;

SELECT região_id, nome_região
FROM região
WHERE nome_região LIKE 'M%'
AND região_id >= 2
AND mapa_região IS NOT NULL;

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

SELECT nome_vinícola, nome_região
FROM vinícola
LEFT OUTER JOIN região ON vinícola.região_id = região.região_id

SELECT nome_vinícola, nome_região, nome_vinho
FROM vinícola, região, vinho
WHERE vinícola.região_id = região.região_id
AND vinho.vinícola_id = vinícola.vinícola_id

SELECT nome_vinícola, nome_região, nome_vinho
FROM vinícola
JOIN região ON vinícola.região_id = região.região_id
JOIN vinho ON vinícola.vinícola_id = vinho.vinícola_id

SELECT
	nome_vinícola AS nome_da_vinícola,
	nome_região AS localizada_na_região,
	nome_vinho AS produz_o_vinho
FROM
	vinícola AS V,
	região AS R,
	vinho AS Vi
WHERE
	V.região_id = R.região_id
AND
	Vi.vinícola_id = V.vinícola_id

-- Liste os dados da relação vinícola. Ordene o resultado pelo nome da vinícola em ordem descendente e pela região da vinícola em ordem ascendente.
SELECT *
FROM vinícola, região
WHERE vinícola.região_id = região.região_id
ORDER BY nome_vinícola DESC, nome_região ASC

-- Qual a médiados preços?
SELECT AVG(preço_vinho)
FROM vinho

-- Qual a soma dos preços?
SELECT SUM(preço_vinho)
FROM vinho

-- Qual o preço mais baixo?
SELECT MIN(preço_vinho)
FROM vinho

-- Qual o preço mais alto?
SELECT MAX(preço_vinho)
FROM vinho

-- Quantos vinhos existem na relação vinho?
SELECT COUNT(vinho_id)
FROM vinho

-- Quantos tipos de vinhos diferentes existem na relação vinho?
SELECT COUNT(DISTINCT tipo_vinho)
FROM vinho

-- Qual o preço mais alto e a média dos preços por tipo de vinho?
SELECT tipo_vinho, MAX(preço_vinho), AVG(preço_vinho)
FROM vinho
GROUP BY tipo_vinho
ORDER BY tipo_vinho

-- Qual o preço mais alto e a média dos preços por tipo de vinho, para as médias de preços superiores a R$ 200,00?
SELECT tipo_vinho, MAX(preço_vinho), AVG(preço_vinho)
FROM vinho
GROUP BY tipo_vinho
HAVING AVG(preço_vinho) > 200
ORDER BY tipo_vinho

