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