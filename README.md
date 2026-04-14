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
IF OBJECT_ID('Musicas', 'U') IS NOT NULL DROP TABLE Musicas;
IF OBJECT_ID('Albuns', 'U') IS NOT NULL DROP TABLE Albuns;
GO

-- Criar tabela de Álbuns
CREATE TABLE Albuns (
    IdAlbum INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Artista VARCHAR(255) NOT NULL,
    AnoLancamento INT
);
GO

-- Criar tabela de Músicas
CREATE TABLE Musicas (
    IdMusica INT PRIMARY KEY IDENTITY(1,1),
    IdAlbum INT NOT NULL,
    Titulo VARCHAR(255) NOT NULL,
    DuracaoSegundos INT NOT NULL,
    FOREIGN KEY (IdAlbum) REFERENCES Albuns(IdAlbum)
);
GO

-- Inserir dados
INSERT INTO Albuns (Nome, Artista, AnoLancamento) VALUES
('Rock Hits', 'Banda X', 2020),
('Pop Stars', 'Cantor Y', 2021),
('Mix Brasil', 'Banda X', 2022);
GO

INSERT INTO Musicas (IdAlbum, Titulo, DuracaoSegundos) VALUES
(1, 'Rock 1', 180),
(1, 'Rock 2', 320),
(1, 'Rock 3', 400),
(2, 'Pop 1', 250),
(2, 'Pop 2', 600),
(3, 'Brasil 1', 150),
(3, 'Brasil 2', 700);
GO

==


SELECT M.Titulo, M.DuracaoSegundos
FROM Musicas M
INNER JOIN Albuns A ON M.IdAlbum = A.IdAlbum
WHERE A.Nome = 'Rock Hits';
GO

SELECT A.Artista, COUNT(M.IdMusica) AS TotalMusicas
FROM Albuns A
INNER JOIN Musicas M ON A.IdAlbum = M.IdAlbum
GROUP BY A.Artista;
GO


SELECT TOP 1 A.Nome, SUM(M.DuracaoSegundos) AS DuracaoTotal
FROM Albuns A
INNER JOIN Musicas M ON A.IdAlbum = M.IdAlbum
GROUP BY A.Nome
ORDER BY DuracaoTotal DESC;
GO


SELECT Titulo, DuracaoSegundos
FROM Musicas
WHERE DuracaoSegundos > 300;
GO
ATIVIDADE 4 

IF OBJECT_ID('Viagens', 'U') IS NOT NULL DROP TABLE Viagens;
IF OBJECT_ID('Motoristas', 'U') IS NOT NULL DROP TABLE Motoristas;
GO

-- Tabela Motoristas
CREATE TABLE Motoristas (
    IdMotorista INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    CNH VARCHAR(20) NOT NULL
);
GO

-- Tabela Viagens
CREATE TABLE Viagens (
    IdViagem INT PRIMARY KEY IDENTITY(1,1),
    IdMotorista INT,
    Origem VARCHAR(255),
    Destino VARCHAR(255),
    Data DATE,
    DistanciaKm INT,
    FOREIGN KEY (IdMotorista) REFERENCES Motoristas(IdMotorista)
);
GO

-- Inserindo dados
INSERT INTO Motoristas (Nome, CNH) VALUES
('João Silva', '123456'),
('Maria Souza', '654321'),
('Carlos Lima', '999888'),
('Ana Costa', '777666'); -- essa não terá viagens
GO

INSERT INTO Viagens (IdMotorista, Origem, Destino, Data, DistanciaKm) VALUES
(1, 'São Paulo', 'Rio de Janeiro', '2024-01-10', 430),
(1, 'Rio de Janeiro', 'Belo Horizonte', '2024-01-15', 500),
(2, 'Curitiba', 'Florianópolis', '2024-02-01', 300),
(2, 'Curitiba', 'Porto Alegre', '2024-02-05', 710),
(3, 'Brasília', 'Salvador', '2024-03-01', 1200);
GO



-- 1. Viagens de um motorista específico
SELECT V.*
FROM Viagens V
INNER JOIN Motoristas M ON V.IdMotorista = M.IdMotorista
WHERE M.Nome = 'João Silva';
GO

SELECT M.Nome, SUM(V.DistanciaKm) AS TotalKm
FROM Motoristas M
INNER JOIN Viagens V ON M.IdMotorista = V.IdMotorista
GROUP BY M.Nome;
GO


SELECT *
FROM Viagens
WHERE DistanciaKm > 500;
GO


SELECT M.Nome
FROM Motoristas M
LEFT JOIN Viagens V ON M.IdMotorista = V.IdMotorista
WHERE V.IdViagem IS NULL;
GO
Atividade 5
