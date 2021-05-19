delimiter $$
create trigger tri_vendas_bi
before insert on comvenda
for each row
begin
	declare percentual_comissao float(10,2);
    declare valor_comissao float(10,2) default 0;
## busco o percentual de comissão que o vendedor deve
## receber
	select rt_percentual_comissao(new.n_numevende)
	into percentual_comissao;
## calculo a comissão
	set valor_comissao = ((new.n_totavenda * percentual_comissao) / 100);
## recebo no novo valor de comissão
	set new.n_vcomvenda = valor_comissao;
end$$
delimiter ;

