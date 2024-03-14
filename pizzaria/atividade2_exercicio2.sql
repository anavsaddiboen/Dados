CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE IF NOT EXISTS tb_categorias (
    ID_CATEGORIA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    DESCRICAO VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_pizzas (
    ID_PIZZA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    VALOR DECIMAL(8, 2) NOT NULL,
    INGREDIENTES VARCHAR(255),
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES tb_categorias(ID_CATEGORIA)
);

INSERT INTO tb_categorias (NOME, DESCRICAO) VALUES 
('Salgadas', 'Pizzas com ingredientes salgados'),
('Doces', 'Pizzas com ingredientes doces'),
('Vegetarianas', 'Pizzas sem carne, apenas vegetais'),
('Especiais', 'Pizzas com ingredientes especiais'),
('Tradicionais', 'Pizzas com ingredientes tradicionais');

INSERT INTO tb_pizzas (NOME, VALOR, INGREDIENTES, ID_CATEGORIA) VALUES
('Margherita', 35.00, 'Molho de tomate, queijo muçarela, manjericão fresco', 5),
('Calabresa', 40.00, 'Molho de tomate, queijo muçarela, calabresa fatiada, cebola fatiada', 1),
('Quatro Queijos', 45.00, 'Molho de tomate, queijo muçarela, queijo gorgonzola, queijo parmesão, queijo catupiry', 5),
('Chocolate com Morango', 55.00, 'Chocolate ao leite, morangos frescos', 2),
('Portuguesa', 42.00, 'Molho de tomate, queijo muçarela, presunto, ovos, cebola, ervilha, azeitona', 1),
('Frango com Catupiry', 50.00, 'Molho de tomate, queijo muçarela, frango desfiado, catupiry', 4),
('Vegetariana', 45.00, 'Molho de tomate, queijo muçarela, tomate, cebola, pimentão, champignon, azeitona', 3),
('Pepperoni', 48.00, 'Molho de tomate, queijo muçarela, pepperoni', 5);

SELECT * FROM tb_pizzas WHERE VALOR > 45.00;

SELECT * FROM tb_pizzas WHERE VALOR BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE NOME LIKE '%M%';

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_pizzas p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA;

SELECT p.*, c.NOME AS CATEGORIA 
FROM tb_pizzas p 
INNER JOIN tb_categorias c 
ON p.ID_CATEGORIA = c.ID_CATEGORIA
WHERE c.NOME = 'Doces';