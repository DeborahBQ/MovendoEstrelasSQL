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
