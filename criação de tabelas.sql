create database Universidade2;
use Universidade2;

CREATE TABLE Alunos (
idAluno INT PRIMARY KEY,
nome VARCHAR(20),
sobrenome VARCHAR(20),
curso VARCHAR (30),
email VARCHAR(50)
);

CREATE TABLE Cursos (
idCurso INT PRIMARY KEY,
nomeCurso VARCHAR(30),
numeroAlunos INT,
duracaoSemestre INT,
area VARCHAR(30)
);

INSERT INTO Cursos (idCurso, nomeCurso, numeroAlunos, duracaoSemestre, area) VALUES
(1,'Administração', 200, 8, 'Humanas'),
(2,'Engenharia Civil', 150, 10, 'Exatas'),
(3,'Engenharia de Computação', 120, 10, 'Exatas'),
(4,'Engenharia Elétrica', 130, 10, 'Exatas'),
(5,'Engenharia Mecânica', 140, 10, 'Exatas'),
(6,'Direito', 180, 10, 'Humanas'),
(7,'Medicina', 100, 12, 'Saúde'),
(8,'Enfermagem', 80, 8, 'Saúde'),
(9,'Psicologia', 90, 8, 'Saúde'),
(10,'Ciências Contábeis', 160, 8, 'Humanas'),
(11,'Economia', 170, 8, 'Humanas'),
(12,'Arquitetura e Urbanismo', 110, 10, 'Exatas'),
(13,'Design', 130, 8, 'Humanas'),
(14,'Jornalismo', 100, 8, 'Humanas'),
(15,'Publicidade e Propaganda', 110, 8, 'Humanas'),
(16,'Relações Internacionais', 90, 8, 'Humanas'),
(17,'Biologia', 140, 8, 'Saúde'),
(18,'Física', 120, 8, 'Exatas'),
(19,'Química', 130,	8,'Exatas'),
(20,'Matemática', 150, 8, 'Exatas'),
(21,'História', 110, 8, 'Humanas'),
(22,'Geografia', 120, 8, 'Humanas'),
(23,'Letras', 130, 8, 'Humanas'),
(24,'Educação Física', 140, 8, 'Saúde'),
(25,'Farmácia', 100, 8, 'Saúde');


DELIMITER $$
CREATE PROCEDURE adicionarCurso(
	IN p_idCurso INT,
    IN p_nomeCurso VARCHAR(30),
    IN p_numeroAlunos INT,
    IN p_duracaoSemestre INT,
    IN p_area VARCHAR(30)
    )
BEGIN    
	INSERT INTO Cursos (idCurso, nomeCurso, numeroAlunos, duracaoSemestre, area)
    VALUES (p_idCurso, p_nomeCurso, p_numeroAlunos, p_duracaoSemestre, p_area);
END $$
DELIMITER ;    
-- chamada da procedure
CALL adicionarCurso (26, 'Upx', 180, 4, 'Exatas');

DELIMITER $$
CREATE PROCEDURE selecionarCurso()
BEGIN
	SELECT nomeCurso, area from Cursos;	
END $$
DELIMITER ;
-- chamada de procedure
CALL selecionarCurso;

DELIMITER $$
CREATE FUNCTION obterIdCurso(
	p_nomeCurso VARCHAR(30),
	p_area VARCHAR(30)
    )
RETURNS INT
BEGIN
    DECLARE v_idCurso INT;
    SELECT idCurso INTO v_idCurso FROM Cursos WHERE nomeCurso = p_nomeCurso AND area = p_area;
    RETURN v_idCurso;
END $$
DELIMITER ;    
-- chamada da function
SELECT obterIdCurso('Matematica', 'Ciencias Exatas');