DELIMITER $$
CREATE PROCEDURE processa_comissionamento(
	IN data_inicial DATE,
    IN data_final DATE, 
    OUT total_processado INT)
BEGIN
	
    DECLARE total_venda FLOAT(10,2) DEFAULT 0;
    DECLARE venda INT DEFAULT 0;
    DECLARE vendedor INT DEFAULT 0;
    DECLARE comissao FLOAT(10,2) DEFAULT 0;
    DECLARE valor_comissao FLOAT(10,2) DEFAULT 0;
    DECLARE aux INT DEFAULT 0;
    DECLARE fimloop INT DEFAULT 0;
    
    #cursor para buscar os registros a serem processados entre a data inicial e a data
    #final/ so vamos considerar valor total de venda maior que zero
    
    DECLARE busca_pedido CURSOR FOR 
		SELECT n_numevenda, n_totavenda, n_numevende FROM comvenda
        WHERE d_datavenda BETWEEN data_inicial AND data_final
        AND n_totavenda > 0;
        
	#Faço aqui um tratamento para o banco não executar o loop quando ele terminar
    #evitando que retorne qualquer erro
    
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fimloop = 1;
    
    ##abrir o cursor
    OPEN busca_pedido;
		
        #inicio do loop
        vendas: LOOP
        
        ##aqui verifico se o loop terminou e saio do loop
        IF fimloop = 1 THEN
			LEAVE vendas;
		END IF;
		
        ##Recebo o resultado da consulta em cada variavel 
        FETCH busca_pedido INTO venda, total_venda, vendedor; 
        
        #busco o valor do percentual de cada vendedor
        SELECT n_porcvende INTO comissao FROM comvende WHERE n_numevende = vendedor;
        
        ##verifico se o percentual do vendedor é maior que zero logo após a condição
        ##deve ter o then
        
        IF(comissao > 0) THEN
			#calculo do valor da comissão
			SET valor_comissao = ((total_venda * comissao) / 100);
            
            UPDATE comvenda set n_vcomvenda = valor_comissao WHERE n_numevenda = venda;
            COMMIT;
		
        ## verificar se o percentual de comissão do vendedor é igual 0
		ELSEIF(comissao = 0) THEN
			UPDATE comvenda set n_vcomvenda = 0 WHERE n_numevenda = venda;
			COMMIT;
            
		ELSE 
			SET comissao = 1;
            SET valor_comissao = ((total_venda * comissao) / 100);
            UPDATE comvenda set n_vcomvenda = valor_comissao WHERE n_numevenda = venda;
            COMMIT;
		END IF;
        
        SET comissao = 0;
		
        ## utilizo a variável aux para contar a quantidade de alterações
        SET aux  = aux + 1;
	END LOOP vendas;
    
    SET total_processado = aux;
    
    #fecho o cursor
    CLOSE busca_pedido;
END $$
DELIMITER ;

CALL processa_comissionamento('2015-01-01', '2015-05-19', @a);
SELECT @a;