/* LOOP*****************/
/*
DELIMITER //
CREATE PROCEDURE acumula (limite int)
BEGIN
	DECLARE contador INT DEFAULT 0;
    DECLARE soma INT DEFAULT 0;
    loop_teste: LOOP
		SET contador = contador + 1;
        SET soma = soma + contador;
		IF contador >= limite THEN
			LEAVE loop_teste;
		END IF;
	END LOOP loop_teste;
    SELECT soma;
END //
DELIMITER ;
CALL acumula (10);
*/

/* REPEAT ***********************/
DROP PROCEDURE IF EXISTS acumula_repita;
DELIMITER //
CREATE PROCEDURE acumula_repita(limite TINYINT UNSIGNED)
main: BEGIN
	DECLARE contador TINYINT UNSIGNED DEFAULT 0;
    DECLARE soma INT DEFAULT 0;
    IF limite < 1 THEN
		SELECT 'O Valor deve ser maior que zero' AS zero;
        LEAVE main;
	END IF;
    REPEAT
		SET contador = contador + 1;
        SET soma = soma + contador;
	UNTIL contador >= limite
    END REPEAT;
    SELECT soma;
END//
DELIMITER ;
CALL acumula_repita(10);


