CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    produto_id INT REFERENCES produtos(id),
    quantidade INT,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (nome, preco, estoque) VALUES 
('Notebook Gamer', 4500.00, 10),
('Mouse Sem Fio', 50.00, 50),
('Teclado Mecânico', 250.00, 20);

CREATE VIEW -- Tabela de Produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    produto_id INT REFERENCES produtos(id),
    quantidade INT,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (nome, preco, estoque) VALUES 
('Notebook Gamer', 4500.00, 10),
('Mouse Sem Fio', 50.00, 50),
('Teclado Mecânico', 250.00, 20);

CREATE VIEW vw_vendas_detalhadas AS
SELECT
    p.nome AS nome_produto,
    v.quantidade,
    p.preco AS preco_unitario,
    (v.quantidade * p.preco) AS valor_total
FROM vendas v
JOIN produtos p ON p.id = v.produto_id;

select * from vw_vendas_detalhadas;

CREATE VIEW vw_estoque_critico AS 
SELECT 
	p.estoque
FROM produtos p 
WHERE (p.estoque < 15);

SELECT * FROM vw_estoque_critico;