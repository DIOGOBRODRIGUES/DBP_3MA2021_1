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

DELIMITER $$
CREATE PROCEDURE verEmail(codAluno SMALLINT)
BEGIN
	SELECT CONCAT('O e-mail do aluno é ', email) AS Email 
    FROM aluno 
    WHERE mat_aluno = codAluno;
    SELECT 'PROCEDURE executado com sucesso!';
END$$
DELIMITER ;

CALL verEmail(1);

/**************************************************/
DELIMITER //
CREATE PROCEDURE alunoCurso(IN codAluno SMALLINT)
BEGIN
	SELECT A.nom_alun, C.nome_curso 
    FROM aluno AS A
    INNER JOIN curso AS C
    ON A.cod_curso = C.cod_curso
    WHERE A.mat_aluno = codAluno;
END//
DELIMITER ;

CALL alunoCurso(2);
