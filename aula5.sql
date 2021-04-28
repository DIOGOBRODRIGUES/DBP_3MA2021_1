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

INSERT INTO Curso (tot_cred, nome_curso, cod_coord) 
VALUES
(200, "Egenharia da Computacao", 1),
(320, "Engenharia Eletrica", 1),
(300, "Ciencia da Computacao", 1),
(150, "Sistema de Informacao", 2),
(140, "Egenharia Civil", 3);


INSERT INTO Aluno (cod_curso, dat_nasc, tot_cred, mgp, nom_alun, email) 
VALUES
(2, '2000-10-5', 60, 8.75, 'Diogo Rodrigues', 'diogo@gmail.com'),
(3, '2001-10-5', 60, 8.75, 'Andrea', 'andrea@gmail.com'),
(Null, '2001-10-5', 60, 8.75, 'Pedro', 'Pedro@gmail.com'),
(Null, '2001-10-5', 60, 8.75, 'Alexandre', 'alexandre@gmail.com')
;
Select * from Curso;
/*1  Construa um SELECT que mostre todos os alunos e o respectivo nome do curso no  qual ele está matriculado.
*/
SELECT nom_alun, nome_curso FROM Aluno LEFT JOIN Curso
 ON (Aluno.cod_curso = Curso.cod_curso);

/*2. Construa um SELECT que mostre todos os alunos matriculados
(mostrar no select o nome do aluno e o nome do curso).
*/

