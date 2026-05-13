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

-- Valor médio pago na inscrição por visitante em cada exposicão (ordenado)
SELECT AVG(i.valor_pago), v.nome AS visitante, e.nome AS exposicao
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
JOIN Exposicao e ON i.idExposicao = e.idExposicao
GROUP BY v.nome, e.nome
ORDER BY AVG(i.valor_pago) DESC;

-- Receita total
SELECT SUM(valor_pago) FROM Inscricao;

-- Visitante específico
SELECT * FROM Visitante WHERE idVisitante = ?;

-- Artista específico
SELECT * FROM Artista WHERE idArtista = ?;

-- Exposição específica
SELECT * FROM Exposicao WHERE idExposicao = ?;

-- Relatório dos Visitantes
SELECT DISTINCT
    v.*,
    t.nome AS trabalhador
FROM Visitante v
JOIN Inscricao i
    ON v.idVisitante = i.idVisitante
JOIN Trabalhador t
    ON v.idTrabalhador = t.idTrabalhador
ORDER BY v.nome;

-- Relatório dos Artistas
SELECT a.*, GROUP_CONCAT(o.nome SEPARATOR ', ') AS obras
FROM Artista a
JOIN Obra_Artista oa ON a.idArtista = oa.idArtista
JOIN Obra o ON oa.idObra = o.idObra
GROUP BY a.idArtista
ORDER BY a.idArtista;

-- Relatório das Exposições
SELECT e.*, GROUP_CONCAT(o.nome SEPARATOR ', ') AS obras
FROM Exposicao e
JOIN Exposicao_Obra eo ON e.idExposicao = eo.idExposicao
JOIN Obra o ON o.idObra = eo.idObra
GROUP BY e.idExposicao
ORDER BY e.idExposicao;

-- Relatório das Obras
SELECT o.idObra, o.nome, GROUP_CONCAT(e.nome SEPARATOR ', ') AS exposicoes
FROM Obra o
JOIN Exposicao_Obra eo ON o.idObra = eo.idObra
JOIN Exposicao e ON eo.idExposicao = e.idExposicao
GROUP BY o.idObra
ORDER BY o.idObra;

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

-- Agrupamento de clientes por estado da sua inscrição por exposição
SELECT v.nome AS visitante, e.nome AS exposicao, i.estado AS inscricao
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
JOIN Exposicao e ON i.idVisitante = e.idExposicao
GROUP BY v.nome, e.nome, i.estado
ORDER BY i.estado;

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
