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
SELECT cli_nome, cli_telefone
FROM cliente cl
WHERE cl.emp_codigo = 2

-- Nome da empresa, nome do cliente, telefone do cliente, modelo do carro de todos os clientes que alugaram carro da empresa 2 → fazer Join carro com cliente e com a empresa
SELECT emp.emp_nome, cl.cli_nome, cl.cli_telefone, cr.car_modelo
FROM empresa emp, cliente cl
INNER JOIN aluga al ON cl.cli_codigo = al.cli_codigo
INNER JOIN carro cr ON cr.emp_codigo = 2
GROUP BY emp.emp_nome, cl.cli_nome, cl.cli_telefone, cr.car_modelo

SELECT emp.emp_nome, cl.cli_nome, cl.cli_telefone, cr.car_modelo
FROM empresa emp, cliente cl, carro cr
WHERE cr.emp_codigo = 2
GROUP BY emp.emp_nome, cl.cli_nome, cl.cli_telefone, cr.car_modelo

SELECT COUNT(*)
FROM cliente cl
WHERE cl.emp_codigo = 2

-- Listar todas as empresas (todos os dados da empresa) com os dados de suas filiais → Join com empresa filial
SELECT *
FROM empresa emp
INNER JOIN filial fl ON emp.emp_codigo = fl.emp_codigo

-- Listar todos os motoristas (nomes) que dirigiram carros GOL da empresa 1 (chassi, ano e data em que dirigiu) → JOIN motorista dirige e carro
SELECT fn.primeiro_nome, cr.car_chassi, cr.car_chassi, cr.car_ano, dg.data
FROM funcionario fn
INNER JOIN motorista mot ON fn.fun_codigo = mot.fun_codigo
INNER JOIN dirige dg ON mot.fun_codigo = dg.fun_codigo
INNER JOIN carro cr ON cr.car_chassi = dg.car_chassi
WHERE cr.emp_codigo = 1
AND cr.car_modelo = 'Gol'
GROUP BY fn.primeiro_nome, cr.car_chassi, dg.data

-- Listar todos os funcionários secretários (nomes) das empresas 1 e 2 com suas esposas
SELECT primeiro_nome || ' ' || sobrenome AS nome, dep_nome
FROM funcionario f
INNER JOIN dependente dp ON f.fun_codigo = dp.fun_codigo
WHERE f.tipo_funcionario = 'secretario'
AND dp.parentesco = 'esposa'

-- Listar todos os funcionários (nomes) que dirigiram carros GOL da empresa 2 e que não têm dependentes (chassi, ano e data em que dirigiu)
SELECT DISTINCT fn.primeiro_nome, cr.car_chassi, cr.car_ano, dg.data
FROM funcionario fn, carro cr, dirige dg
WHERE cr.car_modelo = 'Gol' 
AND cr.emp_codigo = 2
AND dg.fun_codigo = fn.fun_codigo 
AND dg.car_chassi = cr.car_chassi
AND NOT EXISTS
(SELECT dp.dep_nome
FROM dependente dp
WHERE fn.fun_codigo = dp.fun_codigo)

SELECT DISTINCT fn.primeiro_nome, cr.car_chassi, cr.car_ano, dg.data
FROM funcionario fn
INNER JOIN dirige dg ON fn.fun_codigo = dg.fun_codigo
INNER JOIN carro cr ON cr.emp_codigo = 2
WHERE cr.car_modelo = 'Gol'
AND NOT EXISTS
(SELECT dp.dep_nome
FROM dependente dp
WHERE fn.fun_codigo = dp.fun_codigo)

-- Liste todos os dados das empresas que têm filiais na cidade de Curitiba - resolva a consulta usando IN, usando EXISTS e usando JOIN
SELECT *
FROM empresa emp
WHERE emp.emp_codigo IN
(SELECT fl.emp_codigo
FROM filial fl
 WHERE fl.filial_local = 'Curitiba')

SELECT *
FROM empresa emp
WHERE EXISTS 
(SELECT 1
 FROM filial fl
 WHERE fl.emp_codigo = emp.emp_codigo
 AND filial_local = 'Curitiba')
 
SELECT emp.emp_codigo, emp.emp_nome, emp.emp_endereco, emp.emp_telefone
FROM empresa emp
INNER JOIN filial fl ON fl.emp_codigo = emp.emp_codigo
WHERE fl.filial_local = 'Curitiba'

-- Liste o nome completo dos funcionários que dirigiram todos os carros que o funcionário Paulo Ferreira dirigiu.
SELECT DISTINCT primeiro_nome || ' ' || sobrenome AS nome
FROM funcionario fn
INNER JOIN dirige dg ON dg.fun_codigo = fn.fun_codigo
WHERE dg.data = CURRENT_DATE

-- Liste o código, o nome do funcionário e sua respectiva quantidade de dependentes, para funcionários do sexo masculino que possuam mais do que um dependente.
SELECT f.fun_codigo AS cod, f.primeiro_nome || ' ' || sobrenome AS nome
FROM funcionario f
INNER JOIN dependente dp ON f.fun_codigo = dp.fun_codigo
WHERE f.fun_sexo = 'm'
GROUP BY f.fun_codigo
HAVING COUNT(*) > 1

--Gustavo
SELECT DISTINCT f.fun_codigo, primeiro_nome || ' '||sobrenome AS nome, COUNT(*)
FROM dependente dp
INNER JOIN funcionario f ON f.fun_codigo = dp.fun_codigo
WHERE f.fun_sexo='m'
GROUP BY f.fun_codigo
HAVING COUNT(dp.fun_codigo) > 1

SELECT f.fun_codigo AS cod, f.primeiro_nome || ' ' || sobrenome AS nome, COUNT(dp.fun_codigo)
FROM funcionario f, dependente dp
WHERE f.fun_sexo = 'm'
AND f.fun_codigo = dp.fun_codigo
GROUP BY f.fun_codigo
HAVING COUNT(dp.fun_codigo) > 1