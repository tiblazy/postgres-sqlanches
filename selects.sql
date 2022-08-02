-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT * FROM pedidos ped
JOIN produtos_pedidos prod_ped ON prod_ped.pedido_id = ped.id
JOIN produtos prod ON prod_ped.produto_id = prod.id;
-- 2)
SELECT ped.id FROM pedidos ped 
JOIN produtos_pedidos prod_ped ON prod_ped.pedido_id = ped.id
JOIN produtos prod ON prod_ped.produto_id = prod.id
WHERE prod.nome = 'Fritas';
-- 3)
SELECT cli.nome FROM clientes cli
JOIN pedidos ped ON cli.id = ped.cliente_id
JOIN produtos_pedidos prod_ped ON prod_ped.pedido_id = ped.id
JOIN produtos prod ON prod_ped.produto_id = prod.id
WHERE prod.nome = 'Fritas';
-- 4)
SELECT SUM(prod.preco) FROM clientes cli
JOIN pedidos ped ON cli.id = ped.cliente_id
JOIN produtos_pedidos prod_ped ON prod_ped.pedido_id = ped.id
JOIN produtos prod ON prod_ped.produto_id = prod.id
WHERE cli.nome = 'Laura';
-- 5)
SELECT prod.nome, COUNT(*) FROM produtos prod 
JOIN produtos_pedidos prod_ped ON prod_ped.produto_id = prod.id
JOIN pedidos ped ON prod_ped.pedido_id = ped.id 
GROUP BY prod.nome ORDER BY prod.nome;