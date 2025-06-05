CREATE DATABASE BD_Agenda;
USE BD_Agenda;


CREATE TABLE Contato(
id_contato INT PRIMARY KEY IDENTITY,
nome VARCHAR(200),
apelido VARCHAR(200),
email VARCHAR(200),
instagram VARCHAR(200),
linkedin VARCHAR(200),
tiktok VARCHAR(200),
dataNascimento DATE,
logradouro VARCHAR(200),
numero VARCHAR(6),
uf VARCHAR(2),
cep VARCHAR(9),
complemento VARCHAR(200),
cidade VARCHAR(200),
bairro VARCHAR(200)
);

CREATE TABLE Telefone(
id_telefone INT PRIMARY KEY IDENTITY,
ddd VARCHAR(2),
numero VARCHAR(11),
tipo VARCHAR(10),
ehWhatsapp BIT,
id_contato INT FOREIGN KEY REFERENCES Contato(id_contato)
);

