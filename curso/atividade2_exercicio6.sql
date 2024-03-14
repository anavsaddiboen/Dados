CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE IF NOT EXISTS tb_categorias (
    ID_CATEGORIA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    DESCRICAO VARCHAR(255),
    NIVEL_DIFICULDADE VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS tb_cursos (
    ID_CURSO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    VALOR DECIMAL(8, 2) NOT NULL,
    DURACAO INT,
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES tb_categorias(ID_CATEGORIA)
);

INSERT INTO tb_categorias (NOME, DESCRICAO, NIVEL_DIFICULDADE) VALUES 
('Programação', 'Cursos relacionados a programação de software', 'Intermediário'),
('Design', 'Cursos relacionados a design gráfico e web design', 'Avançado'),
('Negócios', 'Cursos relacionados a empreendedorismo e gestão empresarial', 'Básico'),
('Idiomas', 'Cursos de idiomas estrangeiros', 'Avançado'),
('Saúde', 'Cursos relacionados a saúde e bem-estar', 'Intermediário');

INSERT INTO tb_cursos (NOME, VALOR, DURACAO, ID_CATEGORIA) VALUES
('Java Programming', 600.00, 60, 1),
('Photoshop Essentials', 550.00, 45, 2),
('Business Management Fundamentals', 700.00, 30, 3),
('Advanced English Conversation', 800.00, 90, 4),
('Nutrition and Dietetics', 650.00, 75, 5),
('JavaScript Development', 850.00, 50, 1),
('Digital Marketing Strategies', 900.00, 60, 3),
('Graphic Design Principles', 750.00, 45, 2);

SELECT * FROM tb_cursos WHERE VALOR > 500.00;

SELECT * FROM tb_cursos WHERE VALOR BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE NOME LIKE '%J%';

SELECT c.*, cat.NOME AS CATEGORIA 
FROM tb_cursos c 
INNER JOIN tb_categorias cat 
ON c.ID_CATEGORIA = cat.ID_CATEGORIA;

SELECT c.*, cat.NOME AS CATEGORIA 
FROM tb_cursos c 
INNER JOIN tb_categorias cat 
ON c.ID_CATEGORIA = cat.ID_CATEGORIA
WHERE cat.NOME = 'Programação';