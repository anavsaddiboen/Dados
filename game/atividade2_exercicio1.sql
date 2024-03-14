CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
CLASSE VARCHAR (40),
DESCRICAO VARCHAR(250));

CREATE TABLE tb_personagens (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_CLASSES INT,
NOME VARCHAR (40),
ATAQUE INT,
DEFESA INT,
AGILIDADE INT,
FOREIGN KEY (ID_CLASSES) REFERENCES tb_classes(ID));

INSERT INTO tb_classes  (CLASSE, DESCRICAO) VALUES
('Guerreiro', 'Essa classe é a principal responsável por desempenhar o papel de tank devido a alta resistência.'),
('Arqueiro', 'Combate a distância com arco e flecha (às vezes com vários tipos de flechas como fogo, gelo, prata, etc)'),
('Mago', 'Combate a distância com magias de variados elementos (fogo, gelo, terra, raios, sombra, etc).'),
('Assassino', 'Combate corporal com adagas, katares, punhais e outras armas de punho'),
('Clérigo','Combate a distância com magias de luz ou da natureza. Às vezes podem usar maças para atacar de perto.');

INSERT INTO tb_personagens (ID_CLASSES, NOME, ATAQUE,DEFESA, AGILIDADE) VALUES
(3, 'Gandalf', 3500, 3500, 800),
(1, 'Aragorn', 1500, 2100, 2500),
(2, 'Legolas', 2500, 500, 3000),
(1, 'Frodo', 800, 800, 800),
(1, 'Gimli', 850, 1000, 1100),
(4, 'Gollum', 750, 500, 3500),
(3, 'Sauron', 5000, 5000, 5000),
(5, 'Galadriel', 1700, 3800, 700);
 
 SELECT * FROM tb_personagens WHERE ATAQUE>2000;
 
 SELECT * FROM tb_personagens WHERE DEFESA >= 1000 AND DEFESA <=2000;
 
 SELECT * FROM tb_personagens WHERE NOME LIKE('%C%');
 
 SELECT * FROM tb_personagens  
 INNER JOIN tb_classes ON tb_personagens.ID_CLASSES = tb_classes.ID;

 SELECT * FROM tb_personagens  
 INNER JOIN tb_classes ON tb_personagens.ID_CLASSES = tb_classes.ID 
 WHERE tb_classes.ID = 2;
 
 


 