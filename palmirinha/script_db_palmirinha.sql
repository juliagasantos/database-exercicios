CREATE DATABASE db_Palmirinha;

USE db_Palmirinha;

CREATE TABLE Usuario(
id_usuario INT PRIMARY KEY IDENTITY,
nome VARCHAR(150) NOT NULL,
email VARCHAR(150) NOT NULL
);

CREATE TABLE UsuarioAcesso(
login VARCHAR(20) NOT NULL,
senha VARCHAR(50) NOT NULL,
bloqueado BIT NOT NULL,
id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
);

CREATE TABLE GrauDificuldade(
id_grau_dificuldade INT PRIMARY KEY IDENTITY,
nome VARCHAR(15) NOT NULL,
);

CREATE TABLE Receita(
id_receita INT PRIMARY KEY IDENTITY,
nome VARCHAR(50) NOT NULL,
tempoPreparo INT NOT NULL,
modoPreparo VARCHAR(8000) NOT NULL,
quantidadePorcoes TINYINT NOT NULL,
id_grau_dificuldade INT FOREIGN KEY REFERENCES GrauDificuldade(id_grau_dificuldade)
);

CREATE TABLE Avaliacao(
id_avaliacao INT PRIMARY KEY IDENTITY,
nota TINYINT NOT NULL,
comentario VARCHAR(1000) NULL,
data DATE NOT NULL,
id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
id_receita INT FOREIGN KEY REFERENCES Receita(id_receita)
);

CREATE TABLE Ingrediente(
id_ingrediente INT PRIMARY KEY IDENTITY,
nome VARCHAR(50) NOT NULL,
precoSugerido DECIMAL(10,2) NOT NULL,
);

CREATE TABLE ReceitaIngrediente(
id_receita_ingrediente INT PRIMARY KEY IDENTITY,
quantidade INT NOT NULL,
id_receita INT FOREIGN KEY REFERENCES Receita(id_receita),
id_ingrediente INT FOREIGN KEY REFERENCES Ingrediente(id_ingrediente)
);

CREATE TABLE Loja(
id_loja INT PRIMARY KEY IDENTITY,
nome VARCHAR(50) NOT NULL,
logradouro VARCHAR(100) NOT NULL,
numero VARCHAR(10) NOT NULL,
complemento VARCHAR(50) NULL,
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(2) NOT NULL,
cep VARCHAR(9) NOT NULL,
cnpj VARCHAR(18) NOT NULL,
telefone VARCHAR(15) NOT NULL,
);


CREATE TABLE IngredienteLoja(
id_ingrediente_loja INT PRIMARY KEY IDENTITY,
id_ingrediente INT FOREIGN KEY REFERENCES Ingrediente(id_ingrediente),
id_loja INT FOREIGN KEY REFERENCES Loja(id_loja)
);









