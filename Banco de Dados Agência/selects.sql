SELECT * FROM empresa

SELECT * FROM funcionario WHERE emp_codigo = 1

SELECT * FROM funcionario WHERE emp_codigo in  (1,2)

SELECT * FROM funcionario WHERE emp_codigo = 1 AND cod_supervISor IS null

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario = 'motorISta'

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario LIKE 'secret%'

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario = 'motorISta' AND fun_salario > 1000

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario = 'motorISta' AND fun_salario > 1000 AND fun_sexo = 'm'

--todos os motorIStas com suas carteiras e classe
SELECT primeiro_nome, sobrenome, num_carteira, classe FROM funcionario fun, motorISta mot
WHERE fun.fun_codigo = mot.fun_codigo
AND emp_codigo = 1 AND tipo_funcionario = 'motorISta'

--todos os motorIStas com suas carteiras e classe D
SELECT primeiro_nome, sobrenome, num_carteira, classe FROM funcionario fun
INNER JOIN motorISta mot ON fun.fun_codigo = mot.fun_codigo
WHERE emp_codigo = 1 AND tipo_funcionario = 'motorISta' AND classe = 'D'

--total de motorIStas da classe D
SELECT COUNT(*) FROM funcionario fun
INNER JOIN motorISta mot ON fun.fun_codigo = mot.fun_codigo
WHERE emp_codigo = 1 AND tipo_funcionario = 'motorISta' AND classe = 'D'

--agrupar por classe
SELECT classe, COUNT(*) FROM funcionario fun
INNER JOIN motorISta mot ON fun.fun_codigo = mot.fun_codigo
WHERE emp_codigo = 1 AND tipo_funcionario = 'motorISta' GROUP BY classe

--agrupar por classe de todas as empresas
SELECT classe, COUNT(*) FROM funcionario fun
INNER JOIN motorISta mot ON fun.fun_codigo = mot.fun_codigo
WHERE tipo_funcionario = 'motorISta' GROUP BY classe

SELECT classe, COUNT(1)
FROM motorista mot
GROUP BY classe

-- toda vez que usar uma função de agregação tem que agrupar pelas duas classes
SELECT emp_codigo, classe, COUNT(1)
FROM motorista mot INNER JOIN funcionario fun
ON mot.fun_codigo = fun.fun_codigo
GROUP BY emp_codigo, classe
ORDER BY emp_codigo

--todos os modelos de carros exIStentes
SELECT DISTINCT(car_modelo) FROM carro

--quantidade de carros por modelos
SELECT car_modelo, COUNT(*) FROM carro GROUP BY car_modelo ORDER BY car_modelo

--mostra todos os funcionários que tem dependentes com seus dependentes
SELECT primeiro_nome || ' ' || sobrenome AS nome, dep_nome
FROM funcionario f INNER JOIN dependente d ON f.fun_codigo = d.fun_codigo ORDER BY nome

--mostra todos os funcionários e os dependentes para aqueles que têm dependentes
SELECT primeiro_nome || ' ' || sobrenome AS nome, dep_nome
FROM funcionario f LEFT JOIN dependente d
ON f.fun_codigo = d.fun_codigo ORDER BY nome

SELECT * FROM funcionario fun
WHERE NOT EXISTS
(SELECT 1 FROM dependente WHERE fun_codigo = fun.fun_codigo)
