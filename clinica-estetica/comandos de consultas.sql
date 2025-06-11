--1. Selecione o id e nome dos tipos de serviço em ordem alfabética
SELECT idTipoServico, Nome FROM TipoServico ORDER BY Nome ASC;
 
--2. Selecione o id, nome e preço dos serviços da categoria Manicure(Esmateria)
SELECT idServico, 
	   Servico.Nome, 
       Valor 
FROM Servico 
INNER JOIN TipoServico
ON TipoServico.idTipoServico = Servico.idTipoServico
WHERE TipoServico.Nome = 'Esmateria';
 
--3. Selecione o id, nome do serviço e nome do tipo de serviço ordenados pelo tipo de serviço
SELECT Servico.idServico, 
       Servico.Nome AS Servico, 
	   TipoServico.Nome AS TipoServico
FROM Servico 
INNER JOIN TipoServico
ON TipoServico.idTipoServico = Servico.idTipoServico
ORDER BY TipoServico.Nome;
 
--4. Selecione o id, nome do serviço e nome do tipo de serviços ativos e que o preço seja maior ou igual a 50 reais (obs: status = 1)
SELECT Servico.idServico, 
       Servico.Nome AS Servico, 
	   TipoServico.Nome AS TipoServico,
	   Servico.Valor
FROM Servico 
INNER JOIN TipoServico
ON TipoServico.idTipoServico = Servico.idTipoServico
WHERE Servico.Status = 1 AND Valor >= 50;
 
--5. Selecione o id, nome, email e cpf de todos os usuários ativos (obs. status = 1)
SELECT Cliente.IdCliente,
	   Cliente.Nome,
	   Cliente.Email,
	   Cliente.Cpf
FROM Cliente
WHERE Cliente.Status =  1;
 
--6. Selecione o id, nome, email e cpf de todos os usuários inativos (obs. status = 0)
SELECT Cliente.IdCliente,
	   Cliente.Nome,
	   Cliente.Email,
	   Cliente.Cpf
FROM Cliente
WHERE Cliente.Status =  0;
 
--7. Selecione o id, nome, email e cpf de todos usuários do tipo Operador
SELECT Usuario.IdUsuario,
	   Usuario.Nome,
	   Usuario.Email,
	   Usuario.Senha
FROM Usuario
INNER JOIN TipoUsuario
ON TipoUsuario.IdTipoUsuario = Usuario.IdTipoUsuario
WHERE TipoUsuario.Nome =  'Operador';
 
--8. Selecione o id, nome e telefone de todos os clientes em ordem por id descrescente
SELECT Cliente.idCliente,
	   Cliente.Nome,
	   Cliente.Telefone
FROM Cliente
ORDER BY Cliente.IdCliente DESC;
 
--9. Selecione todos os dados de clientes que moram na cidade de São Paulo, Suzano ou Itaqua e que estejam ativos (status = 1)
SELECT * FROM Cliente
WHERE Cliente.Status = 1 AND Cidade = 'São Paulo' OR Cidade = 'Suzano' OR Cidade = 'Itaqua';
 
--10.Selecione o id e nome dos serviços do agendamento (de um dos agendamentos cadastrados)
SELECT Servico.idServico,
       Servico.Nome
FROM Servico
INNER JOIN AgendamentoServico
INNER JOIN Agendamento
ON Agendamento.IdAgendamento = AgendamentoServico.IdAgendamento
ON AgendamentoServico.idServico = Servico.IdServico
WHERE Agendamento.IdAgendamento = 1;
 
--11.Selecione o nome do cliente, status de agendamento, valor total, desconto, data de
--agendamento e nome do usuário de cadastro de todos os agendamentos.
SELECT Cliente.Nome,
	   Agendamento.ValorTotal,
	   Agendamento.ValorDesconto,
	   Agendamento.DataAgendamento,
	   Usuario.Nome AS NomeUsuarioCadastro,
	   StatusAgendamento.Nome AS StatusAgendamento
FROM Agendamento
INNER JOIN Cliente ON Agendamento.IdCliente = Cliente.IdCliente
INNER JOIN Usuario ON Agendamento.IdUsuarioCadastro = Usuario.IdUsuario
INNER JOIN StatusAgendamento ON Agendamento.IdStatusAgendamento = StatusAgendamento.IdStatusAgendamento;
 
--12.Selecione o nome do cliente, data de agendamento, motivo de cancelamento, data e nome do usuário de alteração de todos os 
--agendamentos com status Cancelado
SELECT 
    Cliente.Nome,
    Agendamento.DataAgendamento,
    Agendamento.MotivoCancelamento,
    Agendamento.DataAlteracao,
    Usuario.Nome,
	StatusAgendamento.Nome AS StatusAgendamento
FROM Agendamento
INNER JOIN Cliente ON Agendamento.IdCliente = Cliente.IdCliente
INNER JOIN Usuario ON Agendamento.IdUsuarioCadastro = Usuario.IdUsuario
INNER JOIN StatusAgendamento ON Agendamento.IdStatusAgendamento = StatusAgendamento.IdStatusAgendamento
WHERE StatusAgendamento.Nome = 'Cancelado';
 
--13.Selecione a soma total de agendamentos diferentes de cancelados
SELECT SUM(ValorTotal) AS SomaTotalAgendamento FROM Agendamento
INNER JOIN StatusAgendamento
ON StatusAgendamento.IdStatusAgendamento = Agendamento.IdStatusAgendamento
WHERE StatusAgendamento.Nome != 'Cancelado';
 
--14.Selecione a quantidade de agendamentos por Status de Agendamento
SELECT COUNT(*) AS QTDEConfirmado FROM Agendamento
INNER JOIN StatusAgendamento
ON StatusAgendamento.IdStatusAgendamento = Agendamento.IdStatusAgendamento
WHERE StatusAgendamento.Nome = 'Confirmado';


SELECT * FROM AgendamentoServico
SELECT * FROM Agendamento

--Abrindo transacao
DELETE FROM AgendamentoServico --WHERE, IsAgendamento = 4
DELETE FROM Agendamento --WHERE, IsAgendamento = 4

--Confirmar transacao
COMMIT

--Desfazer transacao
ROLLBACK