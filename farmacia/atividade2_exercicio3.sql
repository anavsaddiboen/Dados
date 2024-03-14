CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE IF NOT EXISTS tb_categorias (
    ID_CATEGORIA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    DESCRICAO VARCHAR(255),
    UNIDADE_MEDIDA VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS tb_produtos (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    VALOR DECIMAL(8, 2) NOT NULL,
    DESCRICAO VARCHAR(255),
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES tb_categorias(ID_CATEGORIA)
);

INSERT INTO tb_categorias (NOME, DESCRICAO, UNIDADE_MEDIDA) VALUES 
('Medicamentos', 'Produtos farmacêuticos para tratamento de doenças', 'Unidade'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais', 'Unidade'),
('Higiene', 'Produtos de higiene pessoal e limpeza', 'Unidade'),
('Suplementos', 'Suplementos alimentares e nutricionais', 'Unidade'),
('Bebidas', 'Bebidas diversas', 'Litro');

INSERT INTO tb_produtos (NOME, VALOR, DESCRICAO, ID_CATEGORIA) VALUES
('Paracetamol', 10.00, 'Analgésico e antipirético', 1),
('Shampoo', 15.00, 'Limpeza e cuidado para os cabelos', 2),
('Sabonete', 5.00, 'Sabonete líquido neutro', 3),
('Vitamina C', 30.00, 'Suplemento vitamínico', 4),
('Álcool em Gel', 8.00, 'Antisséptico para as mãos', 3),
('Protetor Solar', 40.00, 'Proteção solar para a pele', 2),
('Creme Hidratante', 20.00, 'Hidratante corporal', 2),
('Água Mineral', 2.50, 'Água mineral sem gás', 5);

SELECT * FROM tb_produtos WHERE VALOR > 50.00;

SELECT * FROM tb_produtos WHERE VALOR BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE NOME LIKE '%C%';

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA;

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA
WHERE c.NOME = 'Cosméticos';