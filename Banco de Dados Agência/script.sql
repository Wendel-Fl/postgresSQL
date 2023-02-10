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

		-- Usando WHERE
		SELECT emp.emp_nome, cl.cli_nome, cl.cli_telefone, cr.car_modelo
		FROM empresa emp, cliente cl, carro cr
		WHERE cr.emp_codigo = 2
		GROUP BY emp.emp_nome, cl.cli_nome, cl.cli_telefone, cr.car_modelo

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

-- Liste todos os dados das empresas que têm filiais na cidade de Curitiba - resolva a consulta usando IN, usando EXISTS e usando JOIN
		
		-- Usando IN
		SELECT *
		FROM empresa emp
		WHERE emp.emp_codigo IN
		(SELECT fl.emp_codigo
		FROM filial fl
		 WHERE fl.filial_local = 'Curitiba')

		-- Usando EXISTS
		SELECT *
		FROM empresa emp
		WHERE EXISTS 
		(SELECT 1
		 FROM filial fl
		 WHERE fl.emp_codigo = emp.emp_codigo
		 AND filial_local = 'Curitiba')

		-- Usando JOIN
		SELECT emp.emp_codigo, emp.emp_nome, emp.emp_endereco, emp.emp_telefone
		FROM empresa emp
		INNER JOIN filial fl ON fl.emp_codigo = emp.emp_codigo
		WHERE fl.filial_local = 'Curitiba'

-- Liste o nome completo dos funcionários que dirigiram todos os carros que o funcionário Paulo Ferreira dirigiu.
-- letra a
SELECT primeiro_nome || ' ' || sobrenome AS nome
FROM funcionario fn
INNER JOIN dirige dg ON dg.fun_codigo = fn.fun_codigo
WHERE dg.data = CURRENT_DATE

-- letra b
SELECT primeiro_nome || ' ' || sobrenome AS nome
FROM funcionario fn
INNER JOIN dirige dg ON dg.fun_codigo = fn.fun_codigo
WHERE dg.data = CURRENT_DATE

-- letra c
SELECT DISTINCT primeiro_nome || ' ' || sobrenome AS nome
FROM funcionario fn
INNER JOIN dirige dg ON dg.fun_codigo = fn.fun_codigo
WHERE dg.data = CURRENT_DATE

-- Liste o código, o nome do funcionário e sua respectiva quantidade de dependentes, para funcionários do sexo masculino que possuam mais do que um dependente.
SELECT f.fun_codigo AS cod, f.primeiro_nome || ' ' || sobrenome AS nome, COUNT(*) AS qtd_dep
FROM dependente dp
INNER JOIN funcionario f ON f.fun_codigo = dp.fun_codigo
WHERE f.fun_sexo = 'm'
GROUP BY f.fun_codigo
HAVING COUNT(*) > 1









