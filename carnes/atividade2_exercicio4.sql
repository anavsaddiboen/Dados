CREATE DATABASE IF NOT EXISTS db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE IF NOT EXISTS tb_categorias (
    ID_CATEGORIA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    DESCRICAO VARCHAR(255),
    TIPO VARCHAR(50),
    ORIGEM VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS tb_produtos (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    PRECO DECIMAL(8, 2) NOT NULL,
    UNIDADE_MEDIDA VARCHAR(20),
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES tb_categorias(ID_CATEGORIA)
);

INSERT INTO tb_categorias (NOME, DESCRICAO, TIPO, ORIGEM) VALUES 
('Carnes Bovinas', 'Cortes de carne de boi', 'Carnes', 'Nacional'),
('Carnes Suínas', 'Cortes de carne de porco', 'Carnes', 'Nacional'),
('Aves', 'Diversos tipos de aves', 'Carnes', 'Nacional'),
('Frutas', 'Frutas frescas', 'Vegetais', 'Nacional'),
('Verduras', 'Verduras frescas', 'Vegetais', 'Nacional');

INSERT INTO tb_produtos (NOME, PRECO, UNIDADE_MEDIDA, ID_CATEGORIA) VALUES
('Picanha', 70.00, 'kg', 1),
('Costela Suína', 55.00, 'kg', 2),
('Peito de Frango', 25.00, 'kg', 3),
('Maçã Gala', 5.00, 'kg', 4),
('Alface Crespa', 3.50, 'unidade', 5),
('Contrafilé', 65.00, 'kg', 1),
('Bacon', 40.00, 'kg', 2),
('Coxinha da Asa', 30.00, 'kg', 3);

SELECT * FROM tb_produtos WHERE PRECO > 50.00;

SELECT * FROM tb_produtos WHERE PRECO BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE NOME LIKE '%C%';

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA;

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_produtos p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA
WHERE c.NOME IN ('Aves', 'Frutas');