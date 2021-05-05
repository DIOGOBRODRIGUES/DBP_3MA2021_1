/* LOOP*****************/

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