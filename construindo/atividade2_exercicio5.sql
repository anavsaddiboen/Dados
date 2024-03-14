CREATE DATABASE IF NOT EXISTS db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE IF NOT EXISTS tb_categorias (
    ID_CATEGORIA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    DESCRICAO VARCHAR(255),
    UNIDADE_MEDIDA VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS tb_produtos (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    PRECO DECIMAL(8, 2) NOT NULL,
    MARCA VARCHAR(50),
    QUANTIDADE_ESTOQUE INT,
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES tb_categorias(ID_CATEGORIA)
);

INSERT INTO tb_categorias (NOME, DESCRICAO, UNIDADE_MEDIDA) VALUES 
('Ferramentas', 'Produtos relacionados a ferramentas para construção', 'Unidade'),
('Elétrica', 'Produtos relacionados a materiais elétricos', 'Unidade'),
('Hidráulica', 'Produtos relacionados a materiais hidráulicos', 'Unidade'),
('Acabamento', 'Produtos relacionados a materiais de acabamento', 'Unidade'),
('Construção', 'Produtos diversos para construção', 'Unidade');

INSERT INTO tb_produtos (NOME, PRECO, MARCA, QUANTIDADE_ESTOQUE, ID_CATEGORIA) VALUES
('Furadeira', 150.00, 'Makita', 20, 1),
('Fiação Elétrica', 90.00, 'Tigre', 30, 2),
('Torneira', 80.00, 'Deca', 25, 3),
('Tinta Látex', 120.00, 'Suvinil', 15, 4),
('Cimento', 40.00, 'Votorantim', 50, 5),
('Chave de Fenda', 15.00, 'Tramontina', 40, 1),
('Fio Paralelo', 70.00, 'Sil', 35, 2),
('Regulador de Pressão', 110.00, 'Tigre', 10, 3);

SELECT * FROM tb_produtos WHERE PRECO > 100.00;

SELECT * FROM tb_produtos WHERE PRECO BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE NOME LIKE '%C%';

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA;

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA
WHERE c.NOME = 'Hidráulica';