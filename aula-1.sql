-- comentário de uma linha

/*
 comentário em bloco
*/


/*
 Data Definition Language (DDL)
*/

-- CRIANDO UM NOVO BANCO DE DADOS

CREATE DATABASE BD_ZeDaBike

-- seleciona o banco de dados
USE BD_ZeDaBike

--CRIANDO A TABELA - CLIENTE
CREATE TABLE Cliente(

--nome do campo, tipo, indicação da chave primaria,
--Identity = auto numeração do campo
--NotNull = campo obrigatório... Por padrão é Null Não Obrigatório

id_cliente INT PRIMARY KEY IDENTITY,
nome VARCHAR(150) NOT NULL,
cpf VARCHAR(14) NOT NULL,
endereco VARCHAR(100) NULL,
numero VARCHAR(6) NULL,
complemento VARCHAR(20) NULL,
bairro VARCHAR(100) NULL,
cidade VARCHAR(100) NULL,
uf VARCHAR(2) NULL,
cep VARCHAR(9) NULL,
ddd VARCHAR(2) NOT NULL,
telefone VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL
)

--CRIANDO A TABELA - CHAMADO
CREATE TABLE Chamado(
id_chamado INT PRIMARY KEY IDENTITY,
endereco VARCHAR(100) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(20) NULL,
bairro VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
uf VARCHAR(2) NOT NULL,
cep VARCHAR(9) NOT NULL,
latitude DECIMAL(10,5) NULL,
longitude DECIMAL(10,5) NULL,
descricao VARCHAR(500) NULL,
dataHora DATETIME NOT NULL,
situacao VARCHAR(20) NOT NULL,
motivoRecusa VARCHAR(200) NULL,
id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente)
)

--CRIANDO A TABELA - USUARIO
CREATE TABLE Usuario(
id_usuario INT PRIMARY KEY IDENTITY,
nome VARCHAR(150) NOT NULL,
email VARCHAR(100) NOT NULL,
cpf VARCHAR(14) NOT NULL,
ddd VARCHAR(2) NOT NULL,
telefone VARCHAR(10) NOT NULL,
senha VARCHAR(8) NOT NULL,
bloqueado BIT NOT NULL,
tipoUsuario VARCHAR(10) NOT NULL
)

--CRIANDO A TABELA - MECANICO
CREATE TABLE Mecanico(
id_mecanico INT PRIMARY KEY IDENTITY,
nome VARCHAR(150) NOT NULL,
email VARCHAR(100) NOT NULL,
cpf VARCHAR(14) NOT NULL,
ddd VARCHAR(2) NOT NULL,
telefone VARCHAR(10) NOT NULL,
senha VARCHAR(8) NOT NULL,
bloqueado BIT NOT NULL,
id_usuarioCadastrado INT FOREIGN KEY REFERENCES Usuario(id_usuario),
id_usuarioAlterado INT FOREIGN KEY REFERENCES Usuario(id_usuario)
)

--CRIANDO A TABELA - CHAMADO-MECANICO
CREATE TABLE ChamadoMecanico(
id_mecanico INT NOT NULL FOREIGN KEY REFERENCES Mecanico(id_mecanico),
id_chamado INT NOT NULL FOREIGN KEY REFERENCES Chamado(id_chamado)
)

--CRIANDO A TABELA - FICHA_MEDICA
CREATE TABLE FichaMedica(
id_fichaMedica INT PRIMARY KEY IDENTITY,
peso DECIMAL(10,2) NOT NULL,
altura DECIMAL(10,2) NOT NULL,
tipoSanguioneo VARCHAR(3) NOT NULL,
EhAlergico BIT NOT NULL,
id_mecanico INT NOT NULL FOREIGN KEY REFERENCES Mecanico(id_mecanico) UNIQUE
)

DROP TABLE FichaMedica

--ALTERANDO TABELAS - ALTER

--adicionando uma nova coluna na tabela cliente
ALTER TABLE Cliente
ADD sexo VARCHAR(10) NULL

--altera o tipo de dados de uma coluna
ALTER TABLE Cliente
ALTER COLUMN sexo VARCHAR(1) NULL

--remove uma coluna da tabela
ALTER TABLE Cliente DROP COLUMN sexo

--altera o nome da coluna
EXEC sp_RENAME 'cliente.uf', 'estado', 'COLUMN'



































SELECT * FROM Cliente;

INSERT INTO Cliente (nome, cpf, ddd, telefone, email)
VALUES ('claytinho', '1234567', '11', '7070707070', 'claytinho@games')