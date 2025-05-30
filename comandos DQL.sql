USE db_Produtos
GO

/*
DQL - Data Query Language  - Linguagens  de Consulta  de Dados 
SELECT - Basicamente o único comando do DQL
*/

--SELECIONA TODAS AS COLUNAS E LINHAS DA TABELA
SELECT * FROM Produto;

--SELECIONA COLUNAS ESPECÍFICAS DE UMA TABELA
SELECT nome, preco FROM Produto;
SELECT id_produto, nome FROM Produto;

--ORDENANDO AS COLUNAS (order by)
SELECT nome, preco FROM Produto ORDER BY preco; --CRESCENTE
SELECT nome, preco FROM Produto ORDER BY preco DESC; --DECRESCENTE
--ORDENANDO DUAS COLUNAS DIFERENTES
SELECT nome, ehLancamento, preco FROM Produto ORDER BY ehLancamento DESC, nome;

--SELECT TOP N
SELECT TOP 3 nome, estoque FROM Produto ORDER BY estoque DESC

--APELIDOS DE COLUNAS - ALIAS (AS)
SELECT id_produto AS Código, nome, preco AS [Preço de Venda] FROM Produto;
SELECT nome, preco, GETDATE() AS Data FROM Produto 

--Filtrando Dados - WHERE
/*

Precedência de Operadores Aritméticos
1º ^
2º /*
3º +-

Operadores Relacionados
= igual
<> diferente
>maior
>= maior ou igual
< menor
<= menor ou igual

Operadores Lógicos
AND (E) Só é verdadeiro quando os dois operadores forem verdadeiros
OR (OU)Só é falso quando os dois operadores forem falso
NOT (NÃO) Inverte a operação

Tabela da Verdade
V AND V = V
V AND F = F
F AND V = F
F AND F = F

V OR V = V
V OR F = V
F OR V = V
F OR F = F

NOT F = V
NOT V = F

Predência de Operadores Lógicos
1 º NOT
2 º AND
3 º OR

Predência Entre Todos os Operadores
1º Operadores Aritméticos
2º Operadores Relacionais
3º Operadores Lógicos

() use parenteses para forçar uma ordem diferente

ULA - UNIDADE LÓGICA ARITMÉTICA
*/
*/


--Select com operadores relacionais e lógicos
SELECT * FROM Produto WHERE id_produto = 5;
SELECT * FRoM Produto WHERE id_produto <> 5;
SELECT * FROM Produto WHERE estoque >= 100;
SELECT * FROM Produto WHERE preco < 200;
SELECT * FROM Produto WHERE estoque >= 50 AND ehLancamento = 1;
SELECT * FROM Produto WHERE NOT (estoque >= 50 OR ehLancamento = 1);
--Operadores IN
SELECT * FROM Produto WHERE id_produto IN(5,7,8);
SELECT * FROM Produto WHERE id_produto NOT IN(5,7,8);
--Operador BETWEEN
SELECT * FROM Produto WHERE id_produto BETWEEN 4 AND 7;
SELECT * FROM Produto WHERE id_produto NOT BETWEEN 4 AND 7;
--Operador LIKE
SELECT * FROM Produto WHERE nome LIKE 'Iphone%'; --começa com Iphone
SELECT * FROM Produto WHERE nome LIKE '%Iphone'; --Termina com Iphone
SELECT * FROM Produto WHERE nome LIKE '%Iphone%'; --Contém Iphone
SELECT * FROM Produto WHERE nome LIKE '%pro'; --Termina com pro
SELECT * FROM Produto WHERE nome LIKE '%de%'; --Contém de
--Utilizando tudo junto
SELECT nome,
       preco AS Preço,
       estoque
FROM Produto
WHERE nome LIKE '%pro%'
ORDER BY estoque DESC;

--INNER JOIN (Juntando Tabelas)
SELECT CAT.id_categoria,
       CAT.nome,
	   CAT.id_departamento,
	   DEP.nome
FROM Categoria AS CAT
INNER JOIN Departamento AS DEP
ON DEP.id_departamento = CAT.id_departamento

SELECT CAT.id_categoria,
       CAT.nome,
	   CAT.id_departamento,
	   DEP.nome
FROM Categoria AS CAT
RIGHT JOIN Departamento AS DEP
ON DEP.id_departamento = CAT.id_departamento

SELECT CAT.id_categoria,
       CAT.nome,
	   CAT.id_departamento,
	   DEP.nome
FROM Categoria AS CAT
LEFT JOIN Departamento AS DEP
ON DEP.id_departamento = CAT.id_departamento

SELECT CAT.id_categoria,
       CAT.nome,
	   CAT.id_departamento,
	   DEP.nome
FROM Categoria AS CAT
FULL JOIN Departamento AS DEP
ON DEP.id_departamento = CAT.id_departamento


--SELECIONANDO PRODUTO DACATEFORIA ESPECÍFICA
SELECT PRO.id_produto,
	   PRO.nome,
	   CAT.nome AS Categoria
FROM Produto AS PRO
INNER JOIN ProdutoCategoria AS PRC
ON PRC.id_produto =PRO.id_produto
INNER JOIN Categoria AS CAT
On CAT.id_categoria = PRC.id_categoria
WHERE CAT.nome = 'Roupas Esportivas'

SELECT * FROM Departamento;
SELECT * FROM Categoria;


INSERT INTO Departamento (nome) VALUES ('PET')
INSERT INTO Departamento (nome) VALUES ('GAMES')
INSERT INTO Categoria (nome) VALUES ('Categoria ABC')
INSERT INTO Categoria (nome) VALUES ('Categoria XYZ')


--IS NULL
--CATEGORIA SEM DEPARTAMENTO
SELECT * FROM  Categoria WHERE id_departamento IS NULL
--CATEGORIA COM DEPARTAMENTO
SELECT * FROM  Categoria WHERE id_departamento IS NOT NULL
--DEPARTAMENTO SEM CATEGORIA
SELECT DEP.id_departamento,
       DEP.nome AS Depto
FROM Categoria AS CAT
RIGHT JOIN Departamento AS DEP
ON DEP.id_departamento = CAT.id_departamento
WHERE CAT.id_categoria IS NULL


--FUNÇÕES DE AGREGAÇÃO
/*
COUNT = CONTAMGEM
SUM = SOMA
MAX = VALOR MÁXIMO
MIN = VALOR MÍNIMO
AVG = MÉDIA
*/
SELECT COUNT (id_produto) AS Qtde,
       SUM (Estoque) AS totalEstoque,
	   MIN (Preco) AS menorPreco,
	   MAX (Preco) AS maiorPreco,
	   AVG (Preco) AS precoMedio
FROM Produto

--ADD A COLUNA SITUAÇÃO NO PRODUTO
ALTER TABLE Produto ADD situacao VARCHAR(10)
--ATUALIZANDO OS PRODUTOS NOVOS
UPDATE Produto SET situacao = 'Novo'
WHERE id_produto IN (1,3,5,7)
UPDATE Produto SET situacao = 'Usado'
WHERE id_produto IN (2,4,6,8)
SELECT * FROM  Produto

--USANDO FUNÇÕES DE AGREGAÇÃO COM AGRUPAMENTO
SELECT situacao, 
       COUNT(id_produto) AS Qtde
FROM Produto
GROUP BY situcao

--1--
SELECT TOP 3 nome, preco FROM Produto ORDER BY preco ASC;
--2--
SELECT TOP 2 nome, estoque FROM Produto ORDER BY estoque ASC;
--3--
SELECT nome, preco FROM Produto WHERE ehLancamento = 1 ;
--4--
SELECT nome, preco FROM Produto WHERE preco > 5000;
--5--
SELECT nome, estoque FROM Produto WHERE estoque BETWEEN 50 AND 150;
--6--
SELECT * FROM Produto ORDER BY preco ASC;
--7--
SELECT nome, categoria FROM Produto WHERE estoque BETWEEN 50 AND 150;
--8--


SELECT * FROM  Produto