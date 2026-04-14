----CREATE TABLE Alunos (
----    IdAluno INT PRIMARY KEY IDENTITY(1,1),
----    Nome VARCHAR(255),
----    DataDeNascimento DATE
----);

----CREATE TABLE Notas (
----    IdNotas INT PRIMARY KEY IDENTITY(1,1),
----    IdAluno INT,
----    Disciplina VARCHAR(255),
----    Notas INT,
----    FOREIGN KEY (IdAluno) REFERENCES Alunos(IdAluno)
----);

----INSERT INTO Alunos (Nome, DataDeNascimento) VALUES
----('Matheus', '2007-12-28');

----INSERT INTO Notas (Disciplina, IdAluno, Nota) VALUES 
----('Português', 1, 10);

----SELECT * FROM Alunos;
----SELECT * FROM Notas;
----DROP TABLE Alunos; 
ATIVIDADE 1
--IF OBJECT_ID('Sessao', 'U') IS NOT NULL
--    DROP TABLE Sessao;

--IF OBJECT_ID('Filmes', 'U') IS NOT NULL
--    DROP TABLE Filmes;


--CREATE TABLE Filmes (
--    IdFilme INT PRIMARY KEY IDENTITY(1,1),
--    Titulo VARCHAR(255),
--    Genero VARCHAR(255),
--    Ano INT
--);


--CREATE TABLE Sessao (
--    IdSessao INT PRIMARY KEY IDENTITY(1,1),
--    IdFilme INT,
--    Data DATE,
--    Horas VARCHAR(255),
--    FOREIGN KEY (IdFilme) REFERENCES Filmes(IdFilme)
--);


--INSERT INTO Filmes (Titulo, Genero, Ano) VALUES
--('Ultraman', 'Ação', 2020);

--INSERT INTO Sessao (IdFilme, Data, Horas) VALUES
--(1, '2020-04-20', '18:30');


--SELECT * FROM Filmes;
--SELECT * FROM Sessao;
--ATIVIDADE 2
--DROP TABLE IF EXISTS Consultas;
--DROP TABLE IF EXISTS Paciente;
--GO


--CREATE TABLE Paciente (
--    IdPacientes INT PRIMARY KEY IDENTITY(1,1),
--    Nome VARCHAR(255),
--    DataDeNascimento DATE
--);
--GO


--CREATE TABLE Consultas (
--    IdConsulta INT PRIMARY KEY IDENTITY(1,1),
--    IdPaciente INT,
--    DataConsulta DATE,
--    Medico VARCHAR(255),
--    FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPacientes)
--);
--GO


--INSERT INTO Paciente (Nome, DataDeNascimento) VALUES
--('Malaquias', '2000-12-29');
--GO


--INSERT INTO Consultas (IdPaciente, DataConsulta, Medico) VALUES
--(1, '2024-04-10', 'Dr. João');
--GO


--SELECT * FROM Consultas;
--GO


--SELECT 
--    p.Nome,
--    p.DataDeNascimento,
--    c.DataConsulta,
--    c.Medico
--FROM Paciente p
--INNER JOIN Consultas c 
--    ON p.IdPacientes = c.IdPaciente;
--GO
--Atividade 3
