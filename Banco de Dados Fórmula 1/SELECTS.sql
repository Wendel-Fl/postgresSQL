SELECT

        P.NOME as "NOME PILOTO",
        E.NOME as "NOME EQUIPE",
        C.NOME as "PAIS PILOTO",
        PA.NOME as "PAIS EQUIPE"



  FROM PILOTO P,
       EQUIPE E,
       PAIS C,
       PAIS PA

WHERE E.id = P.equipe_id
AND C.id = P.PAIS_ID
AND PA.id = E.PAIS_ID

ORDER BY E.nome, P.nome

-----------------------------------------------------------------------------------------------------
SELECT

        P.NOME as "NOME PILOTO"

  FROM PILOTO P

WHERE categoria = :categoria
AND p.pais_id = :paramen

-----------------------------------------------------------------------------------------------------

SELECT MAX(DATA)
FROM PILOTO
WHERE DATA < (SELECT MAX(DATA)
                 FROM PILOTO)
				 
-----------------------------------------------------------------------------------------------------

SELECT
--COUNT (*)
*
FROM PAIS
WHERE SUBSTRING(NOME FROM 1 FOR 1)  'B'

-----------------------------------------------------------------------------------------------------

SELECT *
FROM PAIS
WHERE UPPER(NOME) LIKE '%'||:TEST||'%'

-----------------------------------------------------------------------------------------------------

SELECT
          SUM (P.IDADE) AS SOMA,
          COUNT(*) AS TOTAL,
        E.NOME as "NOME EQUIPE"



  FROM PILOTO P,
       EQUIPE E

WHERE E.id = P.equipe_id

       group BY E.NOME

       ORDER BY 3

