USE db_Produtos
GO

/*
DQL - Data Query Language  - Linguagens  de Consulta  de Dados 
SELECT - Basicamente o �nico comando do DQL
*/

--SELECIONA TODAS AS COLUNAS E LINHAS DA TABELA
SELECT * FROM Produto;

--SELECIONA COLUNAS ESPEC�FICAS DE UMA TABELA
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
SELECT id_produto AS C�digo, nome, preco AS [Pre�o de Venda] FROM Produto;
SELECT nome, preco, GETDATE() AS Data FROM Produto 

--Filtrando Dados - WHERE
/*

Preced�ncia de Operadores Aritm�ticos
1� ^
2� /*
3� +-

Operadores Relacionados
= igual
<> diferente
>maior
>= maior ou igual
< menor
<= menor ou igual

Operadores L�gicos
AND (E) S� � verdadeiro quando os dois operadores forem verdadeiros
OR (OU)S� � falso quando os dois operadores forem falso
NOT (N�O) Inverte a opera��o

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

Pred�ncia de Operadores L�gicos
1 � NOT
2 � AND
3 � OR

Pred�ncia Entre Todos os Operadores
1� Operadores Aritm�ticos
2� Operadores Relacionais
3� Operadores L�gicos

() use parenteses para for�ar uma ordem diferente

ULA - UNIDADE L�GICA ARITM�TICA
*/
*/


--Select com operadores relacionais e l�gicos
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
SELECT * FROM Produto WHERE nome LIKE 'Iphone%'; --come�a com Iphone
SELECT * FROM Produto WHERE nome LIKE '%Iphone'; --Termina com Iphone
SELECT * FROM Produto WHERE nome LIKE '%Iphone%'; --Cont�m Iphone
SELECT * FROM Produto WHERE nome LIKE '%pro'; --Termina com pro
SELECT * FROM Produto WHERE nome LIKE '%de%'; --Cont�m de
--Utilizando tudo junto
SELECT nome,
       preco AS Pre�o,
       estoque
FROM Produto
WHERE nome LIKE '%pro%'
ORDER BY estoque DESC;

--JOIN (Juntando Tabelas)
SELECT CAT.id_categoria,
       CAT.nome,
	   CAT.id_departamento,
	   DEP.nome
FROM Categoria AS CAT
INNER JOIN Departamento AS DEP
ON DEP.id_departamento = CAT.id_departamento

--SELECIONANDO PRODUTO DACATEFORIA ESPEC�FICA
SELECT PRO.id_produto,
	   PRO.nome,
	   CAT.nome AS Categoria
FROM Produto AS PRO
INNER JOIN ProdutoCategoria AS PRC
ON PRC.id_produto =PRO.id_produto
INNER JOIN Categoria AS CAT
On CAT.id_categoria = PRC.id_categoria
WHERE CAT.nome = 'Roupas Esportivas'