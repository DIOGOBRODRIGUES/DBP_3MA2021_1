CREATE DATABASE aula5;
USE aula5;

CREATE TABLE Curso ( 
	cod_curso INTEGER PRIMARY KEY AUTO_INCREMENT,
    tot_cred INTEGER,
    nome_curso VARCHAR (60) NOT NULL,
    cod_coord INTEGER NOT NULL
)AUTO_INCREMENT = 0;

DESC Curso;

CREATE TABLE Aluno ( 
	mat_aluno INTEGER PRIMARY KEY AUTO_INCREMENT,
    cod_curso INTEGER,
    dat_nasc DATE NOT NULL, 
    tot_cred INTEGER NOT NULL,
    mgp DOUBLE NOT NULL,
    nom_alun VARCHAR (60) NOT NULL, 
    email VARCHAR (30),
    
    CONSTRAINT fk_cod_curso FOREIGN KEY (cod_curso) REFERENCES Curso (cod_curso)
);
DESC Aluno;


