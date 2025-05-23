CREATE DATABASE db_Produtos;
USE db_Produtos;

CREATE TABLE Departamento(
id_departamento INT PRIMARY KEY IDENTITY,
nome VARCHAR(50) NOT NULL
);

CREATE TABLE Categoria(
id_categoria INT PRIMARY KEY IDENTITY,
nome VARCHAR(50) NOT NULL,
id_departamento INT FOREIGN KEY REFERENCES Departamento(id_departamento)
);

CREATE TABLE Produto(
id_produto INT PRIMARY KEY IDENTITY,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(800) NULL,
estoque INT NOT NULL,
ehLancamento BIT NOT NULL,
preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE ProdutoCategoria(
id_produto_categoria INT PRIMARY KEY IDENTITY,
id_produto INT FOREIGN KEY REFERENCES Produto(id_produto),
id_categoria INT FOREIGN KEY REFERENCES Categoria(id_categoria)
);

INSERT INTO Departamento (nome) VALUES ('Tecnologia');
INSERT INTO Departamento (nome) VALUES ('Vestuário');
INSERT INTO Departamento (nome) VALUES ('Alimentação');
INSERT INTO Departamento (nome) VALUES ('Esportes');
INSERT INTO Departamento (nome) VALUES ('Móveis');

SELECT * FROM Departamento;

INSERT INTO Categoria (nome, id_departamento) VALUES ('Smartphones', 1);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Notebooks', 1);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Televisores', 1);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Roupas Esportivas', 2);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Calçados', 2);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Alimentos Saudáveis', 3);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Laticínios', 3);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Futebol', 4);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Bicicletas', 4);
INSERT INTO Categoria (nome, id_departamento) VALUES ('Cadeiras', 5);

SELECT * FROM Categoria;

INSERT INTO Produto VALUES ('iPhone 14 Pro', 'Smartphone da última geração com câmera 48MP', 50, 1, 9999);
INSERT INTO Produto VALUES ('MacBook Pro', 'Notebook potente com chip M1', 30, 1, 14999);
INSERT INTO Produto VALUES ('Smart TV 55" 4K', 'Televisor com resolução 4K e Smart Tv', 20, 0, 4499);
INSERT INTO Produto VALUES ('Camisa de Futebol', 'Camiseta oficial para prática de esportes', 150, 0, 199);
INSERT INTO Produto VALUES ('Tênis de Corrida', 'Tênis leve e resistente para corrida', 80, 1, 499);
INSERT INTO Produto VALUES ('Leite Integral', 'Leite fresco integral de alta qualidade', 200, 0, 5.99);
INSERT INTO Produto VALUES ('Bicicleta Mountain', 'Bicicleta resistente para trilhas', 15, 0, 2999);
INSERT INTO Produto VALUES ('Cadeira de Escritório', 'Cadeira ergonômica com ajuste de altura', 100, 1, 899);

SELECT * FROM Produto;

INSERT INTO ProdutoCategoria VALUES (1, 1);
INSERT INTO ProdutoCategoria VALUES (1, 2);
INSERT INTO ProdutoCategoria VALUES (1, 3);
INSERT INTO ProdutoCategoria VALUES (1, 4);
INSERT INTO ProdutoCategoria VALUES (1, 5);

INSERT INTO ProdutoCategoria VALUES (2, 1);
INSERT INTO ProdutoCategoria VALUES (2, 2);
INSERT INTO ProdutoCategoria VALUES (2, 3);

INSERT INTO ProdutoCategoria VALUES (3, 2);
INSERT INTO ProdutoCategoria VALUES (3, 3);
INSERT INTO ProdutoCategoria VALUES (3, 4);

INSERT INTO ProdutoCategoria VALUES (4, 4);
INSERT INTO ProdutoCategoria VALUES (4, 8);

INSERT INTO ProdutoCategoria VALUES (5, 4);
INSERT INTO ProdutoCategoria VALUES (5, 5);

INSERT INTO ProdutoCategoria VALUES (6, 7);

INSERT INTO ProdutoCategoria VALUES (7, 9);

INSERT INTO ProdutoCategoria VALUES (8, 10);

SELECT * FROM ProdutoCategoria;