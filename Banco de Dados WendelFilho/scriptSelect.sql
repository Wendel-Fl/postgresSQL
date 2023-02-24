SELECT cl.nome, SUM(item.valor_unitario * item_venda.qtde) AS valor_total
FROM cliente cl
LEFT JOIN venda ON cl.codigo = venda.codigo_cliente
LEFT JOIN item_venda ON venda.codigo_venda = item_venda.codigo_venda
LEFT JOIN item ON item_venda.codigo_item = item.codigo_item
GROUP BY cl.nome
ORDER BY cl.nome ASC