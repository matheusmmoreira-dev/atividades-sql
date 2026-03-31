CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    nota DECIMAL(3,1)
);

INSERT INTO alunos (id, nome, idade, nota) VALUES
(1, 'Ana', 18, 8.5),
(2, 'Bruno', 20, 6.0),
(3, 'Carlos', 17, 5.5),
(4, 'Daniela', 19, 9.0),
(5, 'Diego', 18, 7.0),
(6, 'Eduardo', 21, 4.5),
(7, 'Fernanda', 20, 7.5),
(8, 'Gustavo', 18, 6.8);

SELECT * FROM alunos;

SELECT nome FROM alunos;

SELECT * FROM alunos
WHERE idade > 18;

SELECT * FROM alunos
WHERE nota >= 7;

SELECT * FROM alunos
WHERE nota < 6;

SELECT * FROM alunos
WHERE idade BETWEEN 18 AND 20;

SELECT * FROM alunos
WHERE nome = 'Ana';

SELECT * FROM alunos
WHERE nome LIKE 'D%';

SELECT * FROM alunos
WHERE nome LIKE '%o';

SELECT * FROM alunos
WHERE idade <> 18;

SELECT * FROM alunos
ORDER BY nome;

SELECT * FROM alunos
ORDER BY nota DESC;

SELECT * FROM alunos
ORDER BY idade, nome;

SELECT AVG(nota) AS media_notas FROM alunos;

SELECT MAX(nota) AS maior_nota FROM alunos;

SELECT MIN(nota) AS menor_nota FROM alunos;

SELECT COUNT(*) AS total_alunos FROM alunos;

SELECT * FROM alunos
WHERE nota >= 7;

SELECT * FROM alunos
WHERE nota < 7;

SELECT 
    nome,
    CASE 
        WHEN nota >= 7 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS situacao
FROM alunos;