-- Criação das tabelas principais do projeto "Movendo Estrelas"

CREATE TABLE Plano (
    id_plano SERIAL PRIMARY KEY,
    tipo_plano VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE Professor (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE Turma (
    id_turma SERIAL PRIMARY KEY,
    nome_turma VARCHAR(100) NOT NULL,
    nivel VARCHAR(50),
    horario VARCHAR(20),
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nasc DATE,
    email VARCHAR(100),
    telefone VARCHAR(15),
    id_plano INT,
    id_turma INT,
    FOREIGN KEY (id_plano) REFERENCES Plano(id_plano),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    data_pagamento DATE NOT NULL,
    valor_pagamento DECIMAL(10,2) NOT NULL,
    status VARCHAR(20),
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
);

CREATE TABLE Aula (
    id_aula SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

CREATE TABLE Presenca (
    id_presenca SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_aula INT NOT NULL,
    status_presenca VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

-- Inserindo dados iniciais

INSERT INTO Professor (nome, especialidade, telefone)
VALUES ('Bruna Silva', 'Ginástica Olímpica', '61999990001'),
	   ('Adriana Ribeiro', 'Ginastíca Artística', '61999990002');

INSERT INTO Turma (nome_turma, nivel, horario, id_professor)
VALUES ('Turma Iniciantes', 'Básico', '18:00', 1),
       ('Turma Avançada', 'Avançado', '20:00', 1);

INSERT INTO Plano (tipo_plano, valor)
VALUES ('1x semana', 150.00),
       ('2x semana', 280.00),
	   ('Sábado', 200.00);

INSERT INTO Aluno (nome, cpf, data_nasc, email, telefone, id_plano, id_turma)
VALUES ('João Pereira', '12345678901', '2005-03-10', 'joao@email.com', '61999990002', 1, 1),
       ('Maria Souza', '98765432100', '2007-07-22', 'maria@email.com', '61999990003', 2, 2);

INSERT INTO Pagamento (data_pagamento, valor_pagamento, status, id_aluno, id_plano)
VALUES ('2025-11-01', 150.00, 'Pago', 1, 1),
       ('2025-11-05', 280.00, 'Pago', 2, 2);

INSERT INTO Aula (data, id_turma)
VALUES ('2025-11-10', 1),
       ('2025-11-11', 2);

INSERT INTO Presenca (id_aluno, id_aula, status_presenca)
VALUES (1, 1, 'Presente'),
       (2, 2, 'Presente');

-- Listar todos os alunos com seus planos
SELECT a.nome, p.tipo_plano, p.valor
FROM Aluno a
JOIN Plano p ON a.id_plano = p.id_plano;

-- Consultar pagamentos acima de R$200
SELECT * FROM Pagamento
WHERE valor_pagamento > 200
ORDER BY data_pagamento DESC;

-- Listar aulas de uma turma específica
SELECT t.nome_turma, au.data
FROM Turma t
JOIN Aula au ON t.id_turma = au.id_turma
WHERE t.nome_turma = 'Turma Iniciantes';

-- Mostrar presença dos alunos em cada aula
SELECT al.nome, au.data, pr.status_presenca
FROM Presenca pr
JOIN Aluno al ON pr.id_aluno = al.id_aluno
JOIN Aula au ON pr.id_aula = au.id_aula;

-- Atualizar email de um aluno
UPDATE Aluno
SET email = 'joao.silva@novoemail.com'
WHERE id_aluno = 1;

-- Corrigir valor de um plano
UPDATE Plano
SET valor = 160.00
WHERE tipo_plano = 'Plano Básico';

-- Alterar professor responsável por uma turma
UPDATE Turma
SET id_professor = 2
WHERE id_turma = 1;

-- Excluir um pagamento incorreto
DELETE FROM Pagamento
WHERE id_pagamento = 3;

-- Excluir um professor pelo nome (sem FK envolvida)
DELETE FROM professor
WHERE nome = 'Carlos Pereira';

-- Apagar presença duplicada
DELETE FROM Presenca
WHERE id_aluno = 1 AND id_aula = 1 AND status_presenca = 'Presente';
