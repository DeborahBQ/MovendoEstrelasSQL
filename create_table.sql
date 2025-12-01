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
