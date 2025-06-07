USE BD_ZeDaBike
GO

--SELECIONA/LISTA A TABELA INTEIRA
SELECT * FROM Cliente;
SELECT * FROM Chamado;
SELECT * FROM Usuario;
SELECT * FROM Mecanico;
SELECT * FROM FichaMedica;
SELECT * FROM ChamadoMecanico;
--ALT + F1  exibe a estrutura da table selecionada

--COMANDOS DML = Data Manipulation Language
/*Em SQL, os comando do CRUD são:

C = INSERT - Insere dados em uma tabela
R = SELECT - Seleciona dados de uma tabela
U = UPDATE - Altera dados de uma tabela
D = DELETE - Apaga dados de uma tabela
*/

--INSERINDO DADOS DE CLIENTE
--SINTAXE: INSERT INTO TABELA (colunas) VALUES (valores de colunas)
INSERT INTO Cliente(nome, cpf, endereco, numero, complemento, bairro, cidade, estado, cep, ddd, telefone, email)
VALUES ('Júlia', '123.456.789.10', 'Rua dos Sonhos', '699', 'Casa', 'Jardim do Soninho', 'Nova Chuva', 'ET', '12345-678', '00', '00000-0000', 'julinhagames@gatinha.com')

INSERT INTO Cliente(nome, cpf, endereco, numero, complemento, bairro, cidade, estado, cep, ddd, telefone, email)
VALUES ('Clayton', '123.456.789.10', 'Rua dos Sonhos', '699', 'Casa', 'Jardim do Soninho', 'Nova Chuva', 'ET', '12345-678', '00', '00000-0000', 'claytinhogames@gatinho.com')

--INSERINDO CHAMADO
INSERT INTO Chamado(id_cliente, endereco, numero, complemento, bairro, cidade, uf, cep, descricao, dataHora, situacao)
VALUES (2, 'Rua dos Sonhos', '699', 'Casa', 'Jardim do Soninho', 'NC', 'ET', '12345-678', 'pneu furou', '2025-05-20 17:30:05', 'Aguardando')

--inserindo data do momento
INSERT INTO Chamado(id_cliente, endereco, numero, complemento, bairro, cidade, uf, cep, descricao, dataHora, situacao)
VALUES (9, 'Rua dos Sonhos', '699', 'Casa', 'Jardim do Soninho', 'NC', 'ET', '12345-678', 'pneu furou', GETDATE(), 'Aguardando')


--INSERINDO USUARIO
INSERT INTO Usuario(nome, email, cpf, ddd, telefone, senha, bloqueado, tipoUsuario)
VALUES ('Júlia', 'julinhagames@gatinha.com', '123.456.789.10','00', '00000-0000','123456', 0, 'Admin')


--INSERINDO MECANICO

INSERT INTO Mecanico(nome, email, cpf, ddd, telefone, senha, bloqueado, id_usuarioCadastrado)
VALUES ('Júlia', 'julinhagames@gatinha.com', '123.456.789.10','00', '00000-0000','123456', 0, 1)


--INSERINDO FICHA MEDICA
INSERT INTO FichaMedica(id_mecanico, peso, altura, tipoSanguioneo, EhAlergico)
VALUES (1, 98, 1.87, 'O+', 0)


--INSERINDO CHAMADO MECANICO
INSERT INTO ChamadoMecanico(id_chamado, id_mecanico)
VALUES (2,1)

--ALTERANDO DADOS NA TABELA (UPDATE)
UPDATE Cliente SET
    telefone = '1234-5678',
	email = 'email@gmail.com'
WHERE id_cliente = 1;

UPDATE Cliente SET
    bairro = 'São Miguel'
WHERE bairro = 'São Miguel Paulista'


--APAGANDO DADOS DA TABELA CLIENTE (DELETE) 
DELETE FROM Cliente WHERE id_cliente = 3;
