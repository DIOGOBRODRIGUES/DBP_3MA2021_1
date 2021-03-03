CREATE DATABASE aula3cc;
USE aula3cc;

CREATE TABLE cliente (
codigo INTEGER,
nome VARCHAR(60) NOT NULL,
endereco VARCHAR(150) NOT NULL,
cod_departamento INTEGER,
CONSTRAINT pk_cliente PRIMARY KEY(codigo)
);

DESC cliente;

CREATE TABLE departamento (
cod_departamento INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_dep VARCHAR(60)
);

DESC departamento;

ALTER TABLE cliente
	ADD CONSTRAINT fk_cod_dep FOREIGN KEY (cod_departamento) 
    REFERENCES departamento (cod_departamento);

CREATE TABLE produto(
id INTEGER,
nome VARCHAR(50),
valor FLOAT,
quantidade INTEGER,
CONSTRAINT pk_id PRIMARY KEY (id)
);

INSERT INTO produto VALUES(1, 'Lápis', 1.00, 10);

SELECT *FROM produto;

INSERT INTO produto VALUES(2, 'Borracha', 3.00, 10);
INSERT INTO produto VALUES(3, 'Caderno', 15, 10);

-- quantidade de produtos no meu banco
SELECT COUNT(*) AS qtd FROM produto;

SELECT MIN(valor) AS menor FROM produto;

SELECT AVG(valor) AS media FROM produto;

SELECT SUM(valor * quantidade) AS valor_total FROM produto;