-- Arquivo composto de SELECT queries para consulta na database
USE galeria_arte;

-- Total de visitantes registrados
SELECT COUNT(*) FROM Visitante;

-- Total de inscrições registradas
SELECT COUNT(*) FROM Inscricao;

-- Valor mínimo pago por inscrição
SELECT MIN(valor_pago) FROM Inscricao;

-- Valor médio pago na inscricão
SELECT AVG(valor_pago) FROM Inscricao;

-- Valor máximo pago na inscrição
SELECT MAX(valor_pago) FROM Inscricao;

-- Valor médio pago na inscrição por cliente em cada exposicão (ordenado)
SELECT AVG(i.valor_pago), v.nome AS visitante, e.nome AS exposicao
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
JOIN Exposicao e ON i.idExposicao = e.idExposicao
GROUP BY v.nome, e.nome
ORDER BY AVG(i.valor_pago) DESC;

-- Receita total
SELECT SUM(valor_pago) FROM Inscricao;

-- Agrupamento de exposições por Receita
SELECT e.nome, SUM(i.valor_pago) AS receita
FROM Inscricao i
JOIN Exposicao e ON i.idExposicao = e.idExposicao
GROUP BY e.nome
ORDER BY SUM(i.valor_pago) DESC;

-- Visitantes que se inscreveram em mais de uma exposição
SELECT v.nome AS visitante
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
GROUP BY v.nome
HAVING COUNT(*) > 1;

-- Quanto cada visitante já gastou
SELECT v.nome, SUM(i.valor_pago) AS total_gasto
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
GROUP BY v.nome
ORDER BY total_gasto DESC;

-- Inscrições com valor pago acima da média
SELECT * FROM Inscricao
WHERE valor_pago > (SELECT AVG(valor_pago) FROM Inscricao);

-- Agrupamento de clientes por estado da sua inscrição por exposição
SELECT v.nome AS visitante, e.nome AS exposicao, i.estado AS inscricao
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
JOIN Exposicao e ON i.idVisitante = e.idExposicao
GROUP BY v.nome, e.nome, i.estado
ORDER BY i.estado;

-- -- Exposição mais famosa (maior número de inscrições)
-- SELECT e.nome, COUNT(*) AS total
-- FROM Inscricao i
-- JOIN Exposicao e ON i.idExposicao = e.idExposicao
-- GROUP BY e.nome
-- ORDER BY total DESC
-- LIMIT 1;
-- Não sei se é uma query necessária dado que tem-se um view para isso e pode ser filtrado por lá

-- Exposições com receita abaixo da média
SELECT e.nome, SUM(i.valor_pago) AS receita
FROM Inscricao i
JOIN Exposicao e ON e.idExposicao = i.idInscricao
GROUP BY e.nome
HAVING SUM(i.valor_pago) < (SELECT AVG(i.valor_pago) FROM Inscricao)
ORDER BY SUM(i.valor_pago);

-- Exposições com receita igual ou acima da média
SELECT e.nome, SUM(i.valor_pago) AS receita
FROM Inscricao i
JOIN Exposicao e ON e.idExposicao = i.idInscricao
GROUP BY e.nome
HAVING SUM(i.valor_pago) >= (SELECT AVG(i.valor_pago) FROM Inscricao)
ORDER BY SUM(i.valor_pago);

--Exposições com nenhuma inscrição
SELECT nome FROM Exposicao
WHERE idExposicao NOT IN (SELECT idExposicao FROM Inscricao);
