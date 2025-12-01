-- Excluir um pagamento incorreto
DELETE FROM Pagamento
WHERE id_pagamento = 3;

-- Excluir um professor pelo nome (sem FK envolvida)
DELETE FROM professor
WHERE nome = 'Carlos Pereira';

-- Apagar presença duplicada
DELETE FROM Presenca
WHERE id_aluno = 1 AND id_aula = 1 AND status_presenca = 'Presente';
