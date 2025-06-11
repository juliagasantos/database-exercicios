--ZERANDO TABELAS
/*
DELETE FROM AgendamentoServico
DELETE FROM Agendamento
DELETE FROM Cliente
DELETE FROM StatusAgendamento
DELETE FROM Servico
DELETE FROM TipoServico
DELETE FROM Usuario
DELETE FROM TipoUsuario

DBCC CHECKIDENT('Agendamento', RESEED, 0)
DBCC CHECKIDENT('Cliente', RESEED, 0)
DBCC CHECKIDENT('StatusAgendamento', RESEED, 0)
DBCC CHECKIDENT('Servico', RESEED, 0)
DBCC CHECKIDENT('TipoServico', RESEED, 0)
DBCC CHECKIDENT('Usuario', RESEED, 0)
DBCC CHECKIDENT('TipoUsuario', RESEED, 0)
*/

-- INSERINDOS OS DADOS
INSERT INTO TipoUsuario (Nome) VALUES ('Administrador')
INSERT INTO TipoUsuario (Nome) VALUES ('Operador')
select * from TipoUsuario

INSERT INTO Usuario (Nome, Email, Senha, Status, IdTipoUsuario) VALUES ('Fulano da Silva', 'fulano@uol.com.br', '123123', 1, 1)
INSERT INTO Usuario (Nome, Email, Senha, Status, IdTipoUsuario) VALUES ('Maria Helena', 'maria@hotmail.com', '123123', 1, 2)
INSERT INTO Usuario (Nome, Email, Senha, Status, IdTipoUsuario) VALUES ('Claudete Ferreira', 'claudete@hotmail.com', '123123', 1, 2)

INSERT INTO StatusAgendamento (Nome) VALUES ('Agendado')
INSERT INTO StatusAgendamento (Nome) VALUES ('Confirmado')
INSERT INTO StatusAgendamento (Nome) VALUES ('Efetuado')
INSERT INTO StatusAgendamento (Nome) VALUES ('Cancelado')

INSERT INTO TipoServico (Nome) VALUES ('Cabelo')
INSERT INTO TipoServico (Nome) VALUES ('Barbearia')
INSERT INTO TipoServico (Nome) VALUES ('Depilação')
INSERT INTO TipoServico (Nome) VALUES ('Esmateria')
INSERT INTO TipoServico (Nome) VALUES ('Sobrancelha')
INSERT INTO TipoServico (Nome) VALUES ('Maquiagem')
INSERT INTO TipoServico (Nome) VALUES ('Massoteparia')
INSERT INTO TipoServico (Nome) VALUES ('Podologia')

INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Escova', 90.00, 'Escova no Cabelo', 1, 1)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Corte Feminino', 50.30, 'Corte de Cabelo feminino', 1, 1)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Barba', 25.00, 'Barba com toalha quente', 1, 2)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Meia Perna', 50.00, 'Depilação da metade da perna', 1, 3)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Francesinha', 20.00, 'Pintura de unhas francesinha', 1, 4)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Sobrancelha com Cera', 20.90, 'Depilação de Sobrancelha com cera quente', 1, 5)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Sobrancelha com Linha', 25.90, 'Depilação de Sobrancelha com linha', 1, 5)
INSERT INTO Servico (Nome, Valor, Descricao, Status, IdTipoServico) VALUES ('Tratamento dos Pés', 49.90, 'Tratamento geral e relaxante dos pés', 1, 8)

INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Logradouro, Nro, Complemento, Bairro, Cidade, Estado, Cep, Status)
			VALUES ('PAULO FREITAS GARCIA', '902.031.231-90', 'paulo@hotmail.com', '(11) 95421-4511', 'Rua Treze de Maio', 10, '', 'São Miguel Paulista', 'São Paulo', 'SP', '08320-444', 1)

INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Logradouro, Nro, Complemento, Bairro, Cidade, Estado, Cep, Status)
			VALUES ('JOSE ALVES REIS', '296.221.869-55', 'jose@jose.com.br', '(11) 93214-3354', 'Rua Pernambuco', 1500, 'Bloco C - Apto 54', 'São Miguel Paulista', 'São Paulo', 'SP', '08500-000', 1)

INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Logradouro, Nro, Complemento, Bairro, Cidade, Estado, Cep, Status)
			VALUES ('FRANCISCA CASTRO MOREIRA', '651.475.626-30', 'fran@uol.com.br', '(11) 94124-0011', 'Rua Paulo Faccini', 52, '', 'Centro', 'Guarulhos', 'SP', '05654-541', 1)


INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Logradouro, Nro, Complemento, Bairro, Cidade, Estado, Cep, Status)
			VALUES ('ALINE MORAES NASCIMENTO', '329.020.872-92', 'alinemoraes@hotmail.com', '(11) 91234-4322', 'Av Principal', 1520, 'Fundos', 'Jardim Oliveiras', 'Mogi das Cruzes', 'SP', '45151-444', 1)

INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Logradouro, Nro, Complemento, Bairro, Cidade, Estado, Cep, Status)
			VALUES ('MARCOS VIEIRA BARROS', '009.095.783-03', 'carlos@carlos.com.br', '(11) 91248-7411', 'Rua Boa Vista', 845, 'Galeria 2', 'São Francisco', 'Campina Grande', 'PB', '65538-766', 1)
	


SELECT * FROM AgendamentoServico
SELECT * FROM Agendamento
SELECT * FROM Cliente
SELECT * FROM StatusAgendamento
SELECT * FROM Servico
SELECT * FROM TipoServico
SELECT * FROM Usuario
SELECT * FROM TipoUsuario

INSERT INTO Agendamento (IdCliente, IdStatusAgendamento, ValorTotal, ValorDesconto, DataAgendamento, MotivoCancelamento, DataCadastro, IdUsuarioCadastro)
				VALUES (1, 1, 235.00, 80.00, '2023-05-06 18:00', NULL, GETDATE(), 2)

INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (1, 2)
				
INSERT INTO Agendamento (IdCliente, IdStatusAgendamento, ValorTotal, ValorDesconto, DataAgendamento, MotivoCancelamento, DataCadastro, IdUsuarioCadastro)
				VALUES (3, 4, 300.85, 0.00, '2023-05-17 12:00', 'Cliente teve imprevisto', GETDATE(), 2)

INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (2, 1)
INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (2, 7)
INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (2, 8)


INSERT INTO Agendamento (IdCliente, IdStatusAgendamento, ValorTotal, ValorDesconto, DataAgendamento, MotivoCancelamento, DataCadastro, IdUsuarioCadastro)
				VALUES (3, 2, 140.00, 0.00, '2023-06-02 14:30', NULL, GETDATE(), 3)

INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (3, 1)
INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (3, 2)

INSERT INTO Agendamento (IdCliente, IdStatusAgendamento, ValorTotal, ValorDesconto, DataAgendamento, MotivoCancelamento, DataCadastro, IdUsuarioCadastro)
				VALUES (3, 2, 40.90, 0.90, '2023-06-10 12:00', NULL, GETDATE(), 1)

INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (4, 5)
INSERT INTO AgendamentoServico (IdAgendamento, IdServico) VALUES (4, 6)




SELECT * FROM AgendamentoServico WITH (NOLOCK)
SELECT * FROM Agendamento WITH (NOLOCK)



--Abrindo transacao
BEGIN TRANSACTION
DELETE FROM AgendamentoServico --WHERE, IsAgendamento = 4
DELETE FROM Agendamento --WHERE, IsAgendamento = 4

--Confirmar transacao
COMMIT

--Desfazer transacao
ROLLBACK

SELECT * FROM Cliente

--Funções de String
SELECT LOWER(Nome) AS Nome, --minusculo
       UPPER(Cidade) AS Cidade, --MAIUSCULO
	   REPLACE(Nome, ' ', '_') AS NomeSemEspaco, --Substituir texto
	   REPLACE(REPLACE(REPLACE(REPLACE(Nome, 'A','4'), 'E','3'), 'I','1'), 'O','0') AS NomeHacker,
	   TRIM(Nome), --Remove espaços
	   LEFT(Nome, 4) AS PrimeirasLetras, --Seleciona as primeiras letras
	   RIGHT(Nome, 4) AS UltimasLetras, --Seleciona as ultimas letras
	   LEN(Nome) AS QuantidadeLetras, --Mostra a quantidade de letras(caracters)
	   CHARINDEX(' ', Nome) AS PosicaoEspaco, --Mostra a posição do primeiro espaço
	   LEFT(Nome, CHARINDEX(' ', Nome)) AS PrimeiroNome, --Seleciona o primeiro nome
	   RIGHT(Nome, LEN(Nome) - CHARINDEX(' ', Nome)) AS Sobrenome, --Seleciona o sobrenome
	   REVERSE(Nome) AS InverteNome, --Inverte texto
	   RIGHT(Nome, CHARINDEX(' ', REVERSE(Nome))) AS UltimoNome, --Ultimo nome
	   CONCAT('BOM', ' ', 'DIA!') AS TextoConcatenado,
	   'BOM DIA! ' + Nome AS Saudacao, --Concatenar usando +
	   SUBSTRING(Nome, 4, 8) AS ParteNome --Pega parte do texto
FROM Cliente

--Funções de Matemáticas
SELECT POWER(4, 2) AS Potencia,
       SQRT(16) AS RaizQuadrada,
	   PI() AS NroPi,
	   --Arredondamento
	   ROUND(PI(), 2) AS Arred,
	   FLOOR(PI()) AS ArredBaixo,
	   CEILING(PI()) AS Arrend

--Funções de data
SELECT GETDATE() AS DataAtual, --Data atual
       DAY(GETDATE()) AS Dia,
	   MONTH(GETDATE()) AS Mes,
	   YEAR(GETDATE()) AS Ano,
	   DATENAME(MONTH, GETDATE()) AS NomeMes,
	   DATENAME(WEEKDAY, GETDATE()) AS NomeDiaSemana,
	   DATEADD(DAY, 40, GETDATE()) AS AdicionarDia,
	   DATEADD(MONTH, 10, GETDATE()) AS AdicionarMes,
	   DATEADD(YEAR, 10, GETDATE()) AS AdicionarAno,
	   DATEDIFF(DAY, '2005-08-28', GETDATE()) AS DiffDia,
	   DATEDIFF(MONTH, '2005-08-28', GETDATE()) AS DiffMes,
	   DATEDIFF(YEAR, '2005-08-28', GETDATE()) AS DiffAno







