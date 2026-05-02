USE galeria_arte;

-- ========================================================================
-- POPULAÇÃO DA BASE DE DADOS: galeria_arte
-- ========================================================================


-- ------------------------------------------------------------------------
-- Trabalhadores
-- ------------------------------------------------------------------------
INSERT INTO Trabalhador (nome, genero, nacionalidade, nif, num_telefone, data_nascimento, email) VALUES
('Ana Ferreira',   'MULHER', 'Portuguesa', '123456789', '912345678', '1985-03-12', 'ana.ferreira@galeria.pt'),
('Carlos Mendes',  'HOMEM',  'Português',  '234567891', '923456789', '1979-07-24', 'carlos.mendes@galeria.pt'),
('Sofia Lopes',    'MULHER', 'Portuguesa', '345678912', '934567890', '1992-11-05', 'sofia.lopes@galeria.pt'),
('João Rodrigues', 'HOMEM',  'Português',  '456789123', '945678901', '1988-01-30', 'joao.rodrigues@galeria.pt'),
('Mariana Costa',  'MULHER', 'Brasileira', '567891234', '956789012', '1995-06-18', 'mariana.costa@galeria.pt');


-- ------------------------------------------------------------------------
-- Movimentos Artísticos
-- ------------------------------------------------------------------------
INSERT INTO Movimento_Artistico (nome) VALUES
('RENASCIMENTO'),
('BARROCO'),
('IMPRESSIONISMO'),
('SURREALISMO'),
('CUBISMO'),
('EXPRESSIONISMO'),
('ROMANTISMO'),
('MODERNISMO');


-- ------------------------------------------------------------------------
-- Tipos de Arte
-- ------------------------------------------------------------------------
INSERT INTO Tipo_Arte (nome) VALUES
('PINTURA'),
('ESCULTURA'),
('GRAVURA'),
('FOTOGRAFIA'),
('INSTALACAO'),
('DESENHO'),
('AGUARELA');


-- ------------------------------------------------------------------------
-- Artistas
-- ------------------------------------------------------------------------
INSERT INTO Artista (nome, data_nascimento, data_falecimento, genero, nacionalidade, educacao, descricao) VALUES
('Leonardo da Vinci',    '1452-04-15', '1519-05-02', 'HOMEM',  'Italiana',  'Autodidata',                   'Polímata do Renascimento italiano, pintor, escultor e cientista.'),
('Frida Kahlo',          '1907-07-06', '1954-07-13', 'MULHER', 'Mexicana',  'Escola Nacional Preparatória', 'Pintora mexicana conhecida por autorretratos simbólicos e surrealistas.'),
('Salvador Dalí',        '1904-05-11', '1989-01-23', 'HOMEM',  'Espanhola', 'Academia de Belas Artes',      'Figura central do Surrealismo, conhecido por imagens oníricas e excêntricas.'),
('Pablo Picasso',        '1881-10-25', '1973-04-08', 'HOMEM',  'Espanhola', 'Escola de Belas Artes',        'Co-fundador do Cubismo, um dos artistas mais influentes do século XX.'),
('Artemisia Gentileschi','1593-07-08', '1656-01-01', 'MULHER', 'Italiana',  'Formação com o pai',           'Uma das primeiras mulheres a alcançar reconhecimento no período Barroco.'),
('Claude Monet',         '1840-11-14', '1926-12-05', 'HOMEM',  'Francesa',  'Académie Suisse',              'Fundador do Impressionismo, famoso pelas séries de Nenúfares.'),
('Georgia O''Keeffe',    '1887-11-15', '1986-03-06', 'MULHER', 'Americana', 'Art Institute of Chicago',     'Pioneira do Modernismo americano, conhecida por flores ampliadas e paisagens do deserto.'),
('Michelangelo',         '1475-03-06', '1564-02-18', 'HOMEM',  'Italiana',  'Oficina de Ghirlandaio',       'Escultor e pintor do Alto Renascimento, autor do Davi e da Capela Sistina.');


-- ------------------------------------------------------------------------
-- Visitantes
-- ------------------------------------------------------------------------
INSERT INTO Visitante (nome, data_nascimento, nif, genero, nacionalidade, num_telefone, email, idTrabalhador) VALUES
('Miguel Santos',    '1990-04-22', '600000001', 'HOMEM',  'Português',  '910000001', 'miguel.santos@email.pt',   1),
('Beatriz Alves',    '1995-09-14', '600000002', 'MULHER', 'Portuguesa', '910000002', 'beatriz.alves@email.pt',   1),
('Rui Pereira',      '1982-12-03', '600000003', 'HOMEM',  'Português',  '910000003', 'rui.pereira@email.pt',     2),
('Laura Martins',    '2000-06-27', '600000004', 'MULHER', 'Brasileira', '910000004', 'laura.martins@email.com',  2),
('André Oliveira',   '1975-01-18', '600000005', 'HOMEM',  'Português',  '910000005', 'andre.oliveira@email.pt',  3),
('Inês Carvalho',    '1998-08-09', '600000006', 'MULHER', 'Portuguesa', '910000006', 'ines.carvalho@email.pt',   3),
('Tomás Figueiredo', '1988-03-31', '600000007', 'HOMEM',  'Português',  '910000007', 'tomas.fig@email.pt',       4),
('Catarina Neves',   '1993-11-20', '600000008', 'MULHER', 'Angolana',   '910000008', 'catarina.neves@email.com', 4),
('Bruno Lima',       '1970-07-07', '600000009', 'HOMEM',  'Português',  '910000009', 'bruno.lima@email.pt',      5),
('Marta Sousa',      '2002-02-14', '600000010', 'MULHER', 'Portuguesa', '910000010', 'marta.sousa@email.pt',     5);


-- ------------------------------------------------------------------------
-- Exposições
-- ------------------------------------------------------------------------
INSERT INTO Exposicao (nome, tema, data_inicio, data_fim) VALUES
('Mestres do Renascimento', 'Arte Renascentista Italiana',           '2025-01-10', '2025-04-10'),
('Sonhos e Obsessões',      'Surrealismo e o Inconsciente',          '2025-03-01', '2025-06-30'),
('Luz e Cor',               'Impressionismo Francês',                '2025-05-15', '2025-09-15'),
('Formas Partidas',         'Cubismo e Abstração',                   '2025-07-01', '2025-10-31'),
('Mulheres na Arte',        'Artistas Femininas através dos Séculos','2025-09-01', '2026-01-31'),
('O Corpo e o Espírito',    'Arte Barroca Europeia',                 '2026-02-01', '2026-06-30');


-- ------------------------------------------------------------------------
-- Obras
-- ------------------------------------------------------------------------
INSERT INTO Obra (tema, data_publicacao, descricao, idMovimento, idTipo) VALUES
('Retrato de um Homem Jovem', '1490-01-01', 'Estudo anatómico e retrato de expressão serena.',                 1, 1),
('Estudo de Mãos',            '1495-01-01', 'Desenho preparatório com detalhe anatómico excecional.',          1, 6),
('Composição Sagrada',        '1510-01-01', 'Cena religiosa de grande mestria técnica.',                       1, 1),
('Judith e Holofernes',       '1614-01-01', 'Representação dramática e violenta de coragem feminina.',         2, 1),
('Cena de Batalha Noturna',   '1620-01-01', 'Composição barroca de luz e sombra intensa.',                    2, 1),
('Jardim ao Entardecer',      '1880-06-01', 'Pinceladas soltas capturam a luz dourada do fim do dia.',         3, 1),
('Reflexos no Rio',           '1885-04-01', 'A superfície da água fragmenta formas e cores.',                  3, 7),
('Campo de Papoilas',         '1873-01-01', 'Paisagem aberta com figuras entre flores vermelhas.',             3, 1),
('Relógios Derretidos',       '1931-01-01', 'Exploração onírica do tempo e da memória.',                      4, 1),
('Metamorfose do Narciso',    '1937-01-01', 'Dupla imagem de figura humana transformando-se em flor.',         4, 1),
('Guitarra Fragmentada',      '1913-01-01', 'Decomposição geométrica de um instrumento musical.',              5, 1),
('Retrato em Cubos',          '1910-01-01', 'Rosto humano desconstruído em múltiplas perspetivas simultâneas.',5, 1),
('Flor de Georgia',           '1926-01-01', 'Flor branca ampliada, abstraindo forma e sensualidade.',          8, 1),
('Deserto Vermelho',          '1930-01-01', 'Paisagem árida do Novo México em tons quentes.',                  8, 1);


-- ------------------------------------------------------------------------
-- Relação Obra–Artista
-- ------------------------------------------------------------------------
INSERT INTO Obra_Artista (idObra, idArtista, papel) VALUES
(1,  1, 'PINTOR_PRINCIPAL'),
(2,  1, 'PINTOR_PRINCIPAL'),
(3,  1, 'PINTOR_PRINCIPAL'),
(4,  5, 'PINTOR_PRINCIPAL'),
(5,  5, 'PINTOR_PRINCIPAL'),
(6,  6, 'PINTOR_PRINCIPAL'),
(7,  6, 'PINTOR_PRINCIPAL'),
(8,  6, 'PINTOR_PRINCIPAL'),
(9,  3, 'PINTOR_PRINCIPAL'),
(10, 3, 'PINTOR_PRINCIPAL'),
(11, 4, 'PINTOR_PRINCIPAL'),
(12, 4, 'PINTOR_PRINCIPAL'),
(10, 4, 'COLABORADOR'),
(13, 7, 'PINTOR_PRINCIPAL'),
(14, 7, 'PINTOR_PRINCIPAL'),
(3,  8, 'COLABORADOR');


-- ------------------------------------------------------------------------
-- Relação Exposição–Obra
-- ------------------------------------------------------------------------
INSERT INTO Exposicao_Obra (idExposicao, idObra) VALUES
(1, 1), (1, 2), (1, 3),
(2, 9), (2, 10),
(3, 6), (3, 7), (3, 8),
(4, 11), (4, 12),
(5, 4), (5, 13), (5, 14),
(6, 4), (6, 5);


-- ------------------------------------------------------------------------
-- Inscrições
-- ------------------------------------------------------------------------
INSERT INTO Inscricao (data_visita, valor_pago, estado, idVisitante, idExposicao) VALUES
('2025-01-15', 8.00,  'USADA',     1, 1),
('2025-01-20', 8.00,  'USADA',     2, 1),
('2025-02-10', 8.00,  'USADA',     3, 1),
('2025-03-05', 10.00, 'USADA',     4, 2),
('2025-04-12', 10.00, 'USADA',     1, 2),
('2025-04-12', 0.00,  'USADA',     5, 2),  -- gratuidade
('2025-05-20', 7.50,  'USADA',     6, 3),
('2025-06-18', 7.50,  'USADA',     7, 3),
('2025-06-18', 7.50,  'CANCELADA', 8, 3),  -- cancelada
('2025-07-10', 9.00,  'USADA',     9, 4),
('2025-08-01', 9.00,  'USADA',     2, 4),
('2025-09-05', 6.00,  'USADA',     10, 5),
('2025-10-14', 6.00,  'USADA',     3,  5),
('2025-11-22', 6.00,  'PENDENTE',  6,  5),  -- futura
('2026-02-10', 12.00, 'PENDENTE',  1,  6),
('2026-03-01', 12.00, 'PENDENTE',  4,  6),
('2026-03-15', 0.00,  'PENDENTE',  7,  6);  -- gratuidade