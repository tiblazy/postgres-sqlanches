-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes (nome, lealdade)
VALUES ('Georgia', 0);

-- 2)
INSERT INTO pedidos (status, cliente_id)
VALUES ('Recebido', 6);

-- 3)
INSERT INTO produtos_pedidos (pedido_id, produto_id)
VALUES (6, 1), (6, 2), (6, 6), (6, 8), (6, 8);

-- Leitura

-- 1)
SELECT * FROM clientes cli 
JOIN pedidos ped ON ped.cliente_id = cli.id
JOIN produtos_pedidos prod_ped ON prod_ped.pedido_id = ped.id
JOIN produtos prod ON prod_ped.produto_id = prod.id
WHERE cli.nome = 'Georgia';

-- Atualização

-- 1)
UPDATE clientes SET lealdade = 
(SELECT SUM(pts_de_lealdade) FROM produtos prod
JOIN produtos_pedidos prod_ped ON prod.id = prod_ped.produto_id
JOIN pedidos ped ON prod_ped.pedido_id = ped.id
JOIN clientes cli ON ped.cliente_id = cli.id
WHERE cli.nome = 'Georgia')
WHERE clientes.nome = 'Georgia';

-- Deleção

-- 1)
DELETE FROM clientes WHERE nome = 'Marcelo';