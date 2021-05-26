USE comercial;

delimiter $$
create function rt_percentual_comissao(vn_n_numevende int)
returns float
deterministic
begin
	declare percentual_comissao float(10,2);
	select n_porcvende
	into percentual_comissao
	from comvende
	where n_numevende = vn_n_numevende;
	return percentual_comissao;
end;
$$
delimiter ;

DELIMITER $$
CREATE TRIGGER tri_vendas_bi
BEFORE INSERT ON comvenda
FOR EACH ROW
BEGIN
	DECLARE percentual_comissao FLOAT(10,2);
    DECLARE valor_comissao FLOAT(10,2) DEFAULT 0;
    
    #BUSCO o percentual de comissão que o vendedor deve receber
    SELECT rt_percentual_comissao(NEW.n_numevende)
    INTO percentual_comissao;
    
    # toda vez que usa o 'NEW' é falando sobre a linha que será inserida By Alexandre
    
    #calculo da comissão
    SET valor_comissao = ((NEW.n_totavenda * percentual_comissao) / 100);
    
    #recebo no novo valor de comissão
    SET new.n_vcomvenda = valor_comissao;
END $$
DELIMITER ;