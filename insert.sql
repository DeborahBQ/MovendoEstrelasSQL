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