-- Tabela de clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco NUMERIC(10,2) NOT NULL
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    forma_pagamento VARCHAR(50) NOT NULL,

    endereco_entrega TEXT,

    status VARCHAR(50) DEFAULT 'Em preparo',
    
    CHECK (status IN ('Em preparo', 'Pronto', 'Entregue', 'Cancelado'))
);

-- Tabela de itens do pedido
CREATE TABLE itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id),
    produto_id INT REFERENCES produtos(id),
    quantidade INT NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL
);


-- Clientes
INSERT INTO clientes (nome, telefone)
VALUES 
('Vivian Maria', '88999999999'),
('Maria', '88988888888'),
('M. Vivian Gomes', '88988888888');

-- Produtos
INSERT INTO produtos (nome, preco)
VALUES
('Hambúrguer', 15.00),
('Batata Frita', 10.00),
('Refrigerante', 6.00);

-- Pedido com pagamento e entrega
INSERT INTO pedidos (cliente_id, forma_pagamento, endereco_entrega, status)
VALUES 
(1, 'Pix', 'Rua das Flores, 123', 'Em preparo');

-- Itens do pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, subtotal)
VALUES
(1, 1, 2, 30.00),
(1, 2, 1, 10.00),
(1, 3, 2, 12.00);


SELECT 
    p.id AS pedido,
    c.nome AS cliente,
    p.forma_pagamento,
    p.endereco_entrega,
    p.status,
    p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;


SELECT 
    pr.nome,
    i.quantidade,
    i.subtotal
FROM itens_pedido i
JOIN produtos pr ON i.produto_id = pr.id
WHERE i.pedido_id = 1;


SELECT 
    p.id,
    SUM(i.subtotal) AS total
FROM pedidos p
JOIN itens_pedido i ON p.id = i.pedido_id
GROUP BY p.id;

SELECT * FROM pedidos
WHERE status = 'Entregue';


