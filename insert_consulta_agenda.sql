USE BD_Agenda;

-----------10 Contatos (pessoas) e seus respectivos dados.-----------
INSERT INTO Contato VALUES ('Clayton', 'Ton', 'clayton@gmail.com', 'clayton-oly', 'clayton-oly', 'clayton-oly', 
'2000/11/08', 'Rua Ayrton Senna', '20', 'SP', '08466-001', 'Casa', 'São Paulo', 'Vila Roseira 2');
INSERT INTO Contato VALUES ('Amanda', 'Mandy', 'amanda@hotmail.com', 'amanda123', 'amanda123', 'amanda123', 
'1998/05/22', 'Rua das Flores', '101', 'RJ', '22041-001', 'Apartamento', 'Rio de Janeiro', 'Copacabana');
INSERT INTO Contato VALUES ('Bruno', 'Bru', 'bruno@gmail.com', 'bruno-pass', 'bruno-pass', 'bruno-pass', 
'1995/09/15', 'Av. Brasil', '1500', 'MG', '30130-110', 'Casa', 'Belo Horizonte', 'Centro');
INSERT INTO Contato VALUES ('Carla', 'Cacá', 'carla@yahoo.com', 'carla-login', 'carla-login', 'carla-login', 
'2001/03/12', 'Rua Sol Nascente', '45', 'RS', '90040-000', 'Apartamento', 'Porto Alegre', 'Cidade Baixa');
INSERT INTO Contato VALUES ('Diego', 'Didi', 'diego@outlook.com', 'diegopass', 'diegopass', 'diegopass', 
'1999/12/01', 'Rua do Comércio', '300', 'PR', '80010-050', 'Casa', 'Curitiba', 'Centro Histórico');
INSERT INTO Contato VALUES ('Eduarda', 'Duda', 'eduarda@gmail.com', 'edu123', 'edu123', 'edu123', 
'2002/07/30', 'Av. Paulista', '900', 'SP', '01310-000', 'Apartamento', 'São Paulo', 'Bela Vista');
INSERT INTO Contato VALUES ('Felipe', 'Lipe', 'felipe@hotmail.com', 'feli-pass', 'feli-pass', 'feli-pass', 
'1997/04/18', 'Rua Verde', '200', 'BA', '40026-010', 'Casa', 'Salvador', 'Barra');
INSERT INTO Contato VALUES ('Gabriela', 'Gabi', 'gabi@uol.com.br', 'gabi-pass', 'gabi-pass', 'gabi-pass', 
'2000/10/05', 'Rua da Paz', '75', 'SC', '88010-200', 'Apartamento', 'Florianópolis', 'Centro');
INSERT INTO Contato VALUES ('Henrique', 'Rick', 'henrique@gmail.com', 'hen123', 'hen123', 'hen123', 
'1996/02/25', 'Rua Nova', '66', 'PE', '50010-000', 'Casa', 'Recife', 'Boa Vista');
INSERT INTO Contato VALUES ('Isabela', 'Isa', 'isabela@gmail.com', 'isa456', 'isa456', 'isa456', 
'2003/06/17', 'Rua das Laranjeiras', '88', 'CE', '60055-000', 'Apartamento', 'Fortaleza', 'Meireles');


-----------INSERINDO NUMEROS DE TELEFONES-----------
----3 contatos com apenas 1 telefone----
INSERT INTO Telefone VALUES ('11', '91465-6807', 'Celular', 1, 1);
INSERT INTO Telefone VALUES ('21', '95625-9255', 'Celular', 0, 2);
INSERT INTO Telefone VALUES ('31', '92648-5921', 'Celular', 1, 3);
-----2 contatos com 2 telefones-----
INSERT INTO Telefone VALUES ('61', '91465-6807', 'Celular', 1, 4);
INSERT INTO Telefone VALUES ('61', '96251-6252', 'Recado', 0, 4);

INSERT INTO Telefone VALUES ('61', '91465-6807', 'Celular', 1, 5);
INSERT INTO Telefone VALUES ('61', '93149-5106', 'Recado', 0, 5);
-----2 contatos com 3 telefones-----
INSERT INTO Telefone VALUES ('85', '99962-2269', 'Celular', 1, 6);
INSERT INTO Telefone VALUES ('85', '95156-6511', 'Celular', 0, 6);
INSERT INTO Telefone VALUES ('85', '90845-5151', 'Comercial', 0, 6);

INSERT INTO Telefone VALUES ('81', '99084-5114', 'Celular', 1, 7);
INSERT INTO Telefone VALUES ('81', '96951-9851', 'Celular', 0, 7);
INSERT INTO Telefone VALUES ('81', '99512-8951', 'Comercial', 0, 7);
-----1 contato com 4 telefones-----
INSERT INTO Telefone VALUES ('13', '98733-3875', 'Celular', 1, 8);
INSERT INTO Telefone VALUES ('13', '93453-3543', 'Celular', 1, 8);
INSERT INTO Telefone VALUES ('13', '94574-6387', 'Comercial', 0, 8);
INSERT INTO Telefone VALUES ('13', '94563-4224', 'Recado', 0, 8);
-----2 contatos com nenhum telefone-----

SELECT * FROM Telefone;

-----CONSULTA SIMPLES-----
--1--
SELECT * FROM Contato;
--2--
SELECT nome, email FROM Contato;
--3--
SELECT * FROM Contato ORDER BY nome ASC;
--4--
SELECT * FROM Contato WHERE cidade = 'São Paulo';
--5--
SELECT * FROM Contato WHERE dataNascimento > '1995/12/31';


-----DISTINCT e FILTROS-----
--6--
SELECT DISTINCT numero FROM Telefone;
--7--
SELECT * FROM Telefone WHERE ehWhatsapp = 1;
--8--
SELECT * FROM Telefone WHERE tipo = 'Comercial';


-----LIMITANDO RESULTADOS (TOP)-----
--9--
SELECT TOP 3 dataNascimento FROM Contato;
--10--
SELECT TOP 2 dataNascimento FROM Contato ORDER BY dataNascimento ASC;


-----JOINS (Relacionamento entre as tabelas)-----
--11--
SELECT nome, Telefone.numero FROM Contato
INNER JOIN Telefone
ON Contato.id_contato = Telefone.id_contato;
--12--
SELECT nome, Telefone.numero, tipo FROM Contato
INNER JOIN Telefone
ON Contato.id_contato = Telefone.id_contato
WHERE tipo = 'Recado';


-----Agregações (GROUP BY, COUNT, MAX, MIN, AVG, SUM)-----
--13--
SELECT nome, COUNT(Telefone.numero) AS Telefone FROM Contato
INNER JOIN Telefone
ON Contato.id_contato = Telefone.id_contato GROUP BY nome;
--14--
SELECT Contato.nome, COUNT(Telefone.numero) AS total_telefones FROM Contato
INNER JOIN Telefone 
ON Contato.id_contato = Telefone.id_contato
GROUP BY Contato.nome
HAVING COUNT(Telefone.numero) > 1;
--15--
SELECT COUNT(Telefone.numero) FROM Telefone
WHERE tipo = 'Celular';
--16--
SELECT 
  (SELECT COUNT(*) FROM Telefone WHERE ehWhatsapp = 1) AS total_whatsapp,
  (SELECT COUNT(*) FROM Telefone WHERE ehWhatsapp = 0) AS total_nao_whatsapp;
---ou---
SELECT ehWhatsapp,
       COUNT(id_contato) AS QTDE
FROM Telefone
GROUP BY ehWhatsapp;
---ou---
SELECT CASE WHEN ehWhatsapp = 0 THEN 'Não possui' ELSE 'Possui' END AS Whatsapp,
         COUNT (id_telefone) AS QTDE
FROM Telefone
GROUP BY ehWhatsapp;

SELECT * FROM Telefone
--17--
SELECT TOP 1 Contato.nome, COUNT(Telefone.numero) AS totalTelefones
FROM Contato 
INNER JOIN Telefone ON Contato.id_contato = Telefone.id_contato
GROUP BY Contato.nome
ORDER BY COUNT(Telefone.numero) DESC;
--18--
SELECT 
  (SELECT TOP 1 dataNascimento FROM Contato ORDER BY dataNascimento DESC) AS dataMaisRecente,
  (SELECT TOP 1 dataNascimento FROM Contato ORDER BY dataNascimento ASC) AS dataMaisAntiga;

SELECT MIN(dataNascimento) AS MaisAntiga,
       MAX(dataNascimento) AS MaisRecente
FROM Contato;

-----Desafio extra-----
--19--
SELECT * FROM Contato WHERE MONTH(dataNascimento) = 6;

SELECT * FROM Contato WHERE MONTH(dataNascimento) = MONTH(GETDATE());
--20--
SELECT nome, Telefone.numero, tipo FROM Contato
INNER JOIN Telefone
ON Contato.id_contato = Telefone.id_contato
WHERE tipo != 'Recado';

SELECT * FROM Telefone;