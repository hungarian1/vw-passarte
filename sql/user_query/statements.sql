-- Arquivo composto de SELECT queries para consulta na database

USE galeria_arte;

-- Consulta de quantidade total de visitantes, receita e inscrições
SELECT
  (SELECT COUNT(*) FROM Visitante) AS total_visitantes,
  (SELECT COALESCE(SUM(valor_pago), 0) FROM Inscricao) AS receita_total,
  (SELECT COUNT(*) FROM Inscricao) AS total_inscricoes;

-- Relatório dos Artistas
SELECT
    a.*,
    GROUP_CONCAT(o.nome SEPARATOR ', ') AS obras
FROM Artista a
JOIN Obra_Artista oa ON a.idArtista = oa.idArtista
JOIN Obra o ON oa.idObra = o.idObra
GROUP BY a.idArtista
ORDER BY a.idArtista;

-- Relatório dos Visitantes (Informações, trabalhador associado, total pago e quantidade de inscrições associadas)
SELECT
    v.*,
    t.nome AS trabalhador,
    COALESCE(SUM(i.valor_pago), 0) AS total_pago,
    COUNT(i.idInscricao) AS qtd_inscricoes
FROM Visitante v
LEFT JOIN Inscricao i ON v.idVisitante = i.idVisitante
JOIN Trabalhador t ON v.idTrabalhador = t.idTrabalhador
GROUP BY v.idVisitante, v.nome, v.genero, v.data_nascimento, v.nacionalidade, v.nif, v.email, v.num_telefone, v.idTrabalhador, t.nome
ORDER BY v.idVisitante;

-- Relatório das Exposições
SELECT
    e.*,
    GROUP_CONCAT(DISTINCT o.nome SEPARATOR ', ') AS obras,
    COALESCE(SUM(i.valor_pago), 0) AS arrecadacao
FROM Exposicao e
LEFT JOIN Exposicao_Obra eo ON e.idExposicao = eo.idExposicao
LEFT JOIN Obra o ON o.idObra = eo.idObra
LEFT JOIN Inscricao i ON i.idExposicao = e.idExposicao
GROUP BY e.idExposicao
ORDER BY e.idExposicao;

-- Relatório das Obras
SELECT
    o.idObra,
    o.nome,
    GROUP_CONCAT(e.nome SEPARATOR ', ') AS exposicoes
FROM Obra o
JOIN Exposicao_Obra eo ON o.idObra = eo.idObra
JOIN Exposicao e ON eo.idExposicao = e.idExposicao
GROUP BY o.idObra
ORDER BY o.idObra;

-- Relatório das inscrições
SELECT
    i.idExposicao,
    i.data_visita,
    i.valor_pago,
    i.estado,
    v.nome,
    e.nome
FROM Inscricao i
LEFT JOIN Visitante v ON i.idVisitante = v.idVisitante
LEFT JOIN Exposicao e ON i.idExposicao = e.idExposicao
ORDER BY i.idExposicao, i.data_visita;

-- Agrupamento de visitantes por estado da sua inscrição por exposição
SELECT v.idVisitante, v.nome AS visitante, e.nome AS exposicao, i.estado AS inscricao
FROM Inscricao i
JOIN Visitante v ON i.idVisitante = v.idVisitante
JOIN Exposicao e ON i.idExposicao = e.idExposicao
GROUP BY v.idVisitante, e.nome, i.estado
ORDER BY i.estado;
