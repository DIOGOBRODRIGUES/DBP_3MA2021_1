/***************** Aula 7 PROCEDURE AND FUCTIONS************************/
CREATE PROCEDURE consultarNome (codNome SMALLINT)
SELECT CONCAT('O nome do aluno é ', nom_alun) AS Nome
FROM aluno
WHERE mat_aluno = codNome;

/*Comando para apagar procedimento*/
DROP PROCEDURE consultarNome;
CALL consultarNome(2);

CREATE FUNCTION fn_teste(a DECIMAL(10,2), b INT) RETURNS INT
DETERMINISTIC
RETURN a*b;

SELECT fn_teste(2.5, 4) AS Result;

