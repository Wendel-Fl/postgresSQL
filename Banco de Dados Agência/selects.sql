SELECT * FROM empresa

SELECT * FROM funcionario WHERE emp_codigo = 1 ORDER BY fun_codigo

SELECT * FROM funcionario WHERE emp_codigo in  (1,2) ORDER BY fun_codigo

SELECT * FROM funcionario WHERE emp_codigo = 1 AND cod_supervISor IS null

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario = 'motorista'

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario LIKE 'secret%'

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario = 'motorista' AND fun_salario > 1000

SELECT * FROM funcionario WHERE emp_codigo = 1 AND tipo_funcionario = 'motorista' AND fun_salario > 1000 AND fun_sexo = 'm'

--todos os motoristas com suas carteiras e classe
SELECT primeiro_nome, sobrenome, num_carteira, classe FROM funcionario fun, motorista mot
WHERE fun.fun_codigo = mot.fun_codigo
AND emp_codigo = 1 AND tipo_funcionario = 'motorista' --AND classe = 'D'

--todos os motoristas com suas carteiras e classe D
SELECT primeiro_nome, sobrenome, num_carteira, classe FROM funcionario fun
INNER JOIN motorista mot ON fun.fun_codigo = mot.fun_codigo
WHERE emp_codigo = 1 AND tipo_funcionario = 'motorista' AND classe = 'D'

--total de motoristas da classe D
SELECT COUNT(*) FROM funcionario fun
INNER JOIN motorista mot ON fun.fun_codigo = mot.fun_codigo
WHERE emp_codigo = 1 AND tipo_funcionario = 'motorista' AND classe = 'D'

--agrupar por classe
SELECT classe, COUNT(*) FROM funcionario fun
INNER JOIN motorista mot ON fun.fun_codigo = mot.fun_codigo
WHERE emp_codigo = 1 AND tipo_funcionario = 'motorista' GROUP BY classe

--agrupar por classe de todas as empresas
SELECT classe, COUNT(*) FROM funcionario fun
INNER JOIN motorista mot ON fun.fun_codigo = mot.fun_codigo
WHERE tipo_funcionario = 'motorista' GROUP BY classe

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

-- Nome e telefone de todos os clientes que alugaram carro na empresa 2
SELECT cli_nome, cli_telefone FROM cliente
WHERE emp_codigo = 2
/*SELECT cli_nome, cli_telefone FROM cliente cl, empresa emp
WHERE cl.emp_codigo = emp.emp_codigo
AND cl.emp_codigo = 2*/

-- Nome da empresa, nome do cliente, telefone do cliente, modelo do carro de todos os clientes que alugaram carro da empresa 2
SELECT emp_nome, cli_nome, cli_telefone, car_modelo
FROM empresa emp
INNER JOIN cliente cl ON emp.emp_codigo = cl.emp_codigo
INNER JOIN aluga al ON cl.cli_codigo = al.cli_codigo
INNER JOIN carro cr ON al.car_chassi = cr.car_chassi
WHERE emp.emp_codigo = 2

SELECT COUNT(*)
FROM cliente cl
WHERE cl.emp_codigo = 2