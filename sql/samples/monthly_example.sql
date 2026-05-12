USE galeria_arte;

-- ========================================================================
-- POPULAÇÃO ADICIONAL DA BASE DE DADOS: galeria_arte
-- Compatível com o script inicial já executado
-- ========================================================================


-- ------------------------------------------------------------------------
-- Trabalhadores
-- ------------------------------------------------------------------------
INSERT INTO Trabalhador (nome, genero, nacionalidade, nif, num_telefone, data_nascimento, email) VALUES
('Rita Martins',     'MULHER', 'Portuguesa', '678901235', '967890123', '1991-04-14', 'rita.martins@galeria.pt'),
('Pedro Almeida',    'HOMEM',  'Português',  '789012346', '978901234', '1984-09-21', 'pedro.almeida@galeria.pt'),
('Marta Ribeiro',    'MULHER', 'Brasileira', '890123457', '989012345', '1996-12-08', 'marta.ribeiro@galeria.pt');


-- ------------------------------------------------------------------------
-- Visitantes
-- idTrabalhador referencia os novos trabalhadores: 6, 7 e 8
-- ------------------------------------------------------------------------
INSERT INTO Visitante (nome, data_nascimento, nif, genero, nacionalidade, num_telefone, email, idTrabalhador) VALUES
('Afonso Matos',        '1992-01-12', '700000001', 'HOMEM',  'Português',     '960000001', 'afonso.matos@email.pt',        6),
('Carla Pires',         '1988-02-25', '700000002', 'MULHER', 'Portuguesa',    '960000002', 'carla.pires@email.pt',         6),
('Tiago Fernandes',     '1979-03-18', '700000003', 'HOMEM',  'Português',     '960000003', 'tiago.fernandes@email.pt',     6),
('Diana Costa',         '1996-04-07', '700000004', 'MULHER', 'Angolana',      '960000004', 'diana.costa@email.com',        6),
('Rafael Sousa',        '1985-05-16', '700000005', 'HOMEM',  'Português',     '960000005', 'rafael.sousa@email.pt',        6),
('Joana Silva',         '2001-06-22', '700000006', 'MULHER', 'Brasileira',    '960000006', 'joana.silva@email.com',        6),
('Miguel Rocha',        '1990-07-09', '700000007', 'HOMEM',  'Português',     '960000007', 'miguel.rocha@email.pt',        6),
('Inês Moreira',        '1994-08-30', '700000008', 'MULHER', 'Portuguesa',    '960000008', 'ines.moreira@email.pt',        6),
('Bruno Teixeira',      '1982-09-11', '700000009', 'HOMEM',  'Português',     '960000009', 'bruno.teixeira@email.pt',      6),
('Madalena Cruz',       '1999-10-03', '700000010', 'MULHER', 'Cabo-verdiana', '960000010', 'madalena.cruz@email.com',      6),

('Gonçalo Ferreira',    '1987-11-19', '700000011', 'HOMEM',  'Português',     '960000011', 'goncalo.ferreira@email.pt',    7),
('Sofia Ramos',         '1993-12-28', '700000012', 'MULHER', 'Portuguesa',    '960000012', 'sofia.ramos@email.pt',         7),
('Daniel Martins',      '1976-01-05', '700000013', 'HOMEM',  'Português',     '960000013', 'daniel.martins@email.pt',      7),
('Lara Nunes',          '2000-02-14', '700000014', 'MULHER', 'Brasileira',    '960000014', 'lara.nunes@email.com',         7),
('Hugo Pinto',          '1991-03-23', '700000015', 'HOMEM',  'Português',     '960000015', 'hugo.pinto@email.pt',          7),
('Marta Dias',          '1989-04-29', '700000016', 'MULHER', 'Angolana',      '960000016', 'marta.dias@email.com',         7),
('André Carvalho',      '1997-05-10', '700000017', 'HOMEM',  'Português',     '960000017', 'andre.carvalho@email.pt',      7),
('Beatriz Martins',     '1984-06-18', '700000018', 'MULHER', 'Portuguesa',    '960000018', 'beatriz.martins@email.pt',     7),
('Nuno Vieira',         '1978-07-27', '700000019', 'HOMEM',  'Português',     '960000019', 'nuno.vieira@email.pt',         7),
('Leonor Costa',        '1995-08-15', '700000020', 'MULHER', 'Brasileira',    '960000020', 'leonor.costa@email.com',       7),

('Ricardo Lopes',       '1986-09-02', '700000021', 'HOMEM',  'Português',     '960000021', 'ricardo.lopes@email.pt',       8),
('Sara Martins',        '1992-10-21', '700000022', 'MULHER', 'Portuguesa',    '960000022', 'sara.martins@email.pt',        8),
('Paulo Almeida',       '1974-11-08', '700000023', 'HOMEM',  'Português',     '960000023', 'paulo.almeida@email.pt',       8),
('Mónica Ribeiro',      '1998-12-17', '700000024', 'MULHER', 'Brasileira',    '960000024', 'monica.ribeiro@email.com',     8),
('José Silva',          '1983-01-26', '700000025', 'HOMEM',  'Português',     '960000025', 'jose.silva@email.pt',          8),
('Teresa Pinto',        '1996-02-09', '700000026', 'MULHER', 'Portuguesa',    '960000026', 'teresa.pinto@email.pt',        8),
('Luís Fernandes',      '1980-03-14', '700000027', 'HOMEM',  'Português',     '960000027', 'luis.fernandes@email.pt',      8),
('Cláudia Neves',       '1991-04-22', '700000028', 'MULHER', 'Angolana',      '960000028', 'claudia.neves@email.com',      8),
('Vasco Rocha',         '1979-05-30', '700000029', 'HOMEM',  'Português',     '960000029', 'vasco.rocha@email.pt',         8),
('Mafalda Gomes',       '2002-06-11', '700000030', 'MULHER', 'Portuguesa',    '960000030', 'mafalda.gomes@email.pt',       8),

('Diogo Martins',       '1988-07-19', '700000031', 'HOMEM',  'Português',     '960000031', 'diogo.martins@email.pt',       6),
('Patrícia Costa',      '1994-08-27', '700000032', 'MULHER', 'Brasileira',    '960000032', 'patricia.costa@email.com',     6),
('Filipe Sousa',        '1977-09-06', '700000033', 'HOMEM',  'Português',     '960000033', 'filipe.sousa@email.pt',        6),
('Catarina Lopes',      '1999-10-15', '700000034', 'MULHER', 'Portuguesa',    '960000034', 'catarina.lopes@email.pt',      6),
('Tomás Carvalho',      '1985-11-24', '700000035', 'HOMEM',  'Português',     '960000035', 'tomas.carvalho@email.pt',      6),
('Helena Ribeiro',      '1993-12-13', '700000036', 'MULHER', 'Angolana',      '960000036', 'helena.ribeiro@email.com',     6),
('Eduardo Pinto',       '1975-01-21', '700000037', 'HOMEM',  'Português',     '960000037', 'eduardo.pinto@email.pt',       6),
('Marta Oliveira',      '2000-02-28', '700000038', 'MULHER', 'Portuguesa',    '960000038', 'marta.oliveira@email.pt',      6),
('João Dias',           '1982-03-17', '700000039', 'HOMEM',  'Português',     '960000039', 'joao.dias@email.pt',           7),
('Andreia Martins',     '1997-04-05', '700000040', 'MULHER', 'Brasileira',    '960000040', 'andreia.martins@email.com',    7),

('Francisco Alves',     '1989-05-14', '700000041', 'HOMEM',  'Português',     '960000041', 'francisco.alves@email.pt',     7),
('Rita Moreira',        '1995-06-23', '700000042', 'MULHER', 'Portuguesa',    '960000042', 'rita.moreira@email.pt',        7),
('Sérgio Costa',        '1978-07-31', '700000043', 'HOMEM',  'Português',     '960000043', 'sergio.costa@email.pt',        7),
('Inês Pinto',          '2001-08-19', '700000044', 'MULHER', 'Cabo-verdiana', '960000044', 'ines.pinto@email.com',         7),
('Ruben Nunes',         '1984-09-08', '700000045', 'HOMEM',  'Português',     '960000045', 'ruben.nunes@email.pt',         8),
('Margarida Sousa',     '1992-10-26', '700000046', 'MULHER', 'Portuguesa',    '960000046', 'margarida.sousa@email.pt',     8),
('Tiago Lopes',         '1976-11-15', '700000047', 'HOMEM',  'Português',     '960000047', 'tiago.lopes@email.pt',         8),
('Daniela Ferreira',    '1998-12-04', '700000048', 'MULHER', 'Brasileira',    '960000048', 'daniela.ferreira@email.com',   8),
('Carlos Mendes Filho', '1981-01-13', '700000049', 'HOMEM',  'Português',     '960000049', 'carlos.mendes.filho@email.pt', 8),
('Ana Costa',           '2003-02-22', '700000050', 'MULHER', 'Portuguesa',    '960000050', 'ana.costa@email.pt',           8);


-- ------------------------------------------------------------------------
-- Exposição
-- Nova exposição após as 6 já existentes
-- ------------------------------------------------------------------------
INSERT INTO Exposicao (nome, tema, data_inicio, data_fim) VALUES
('Percursos da Luz', 'Da Tradição à Contemporaneidade', '2026-04-15', '2026-08-15');


-- ------------------------------------------------------------------------
-- Obras
-- idMovimento e idTipo usam valores já existentes no script inicial
-- ------------------------------------------------------------------------
INSERT INTO Obra (nome, tema, data_publicacao, descricao, idMovimento, idTipo) VALUES
('Luz Sobre Pedra',     'Luz e Matéria',      '1505-01-01', 'Composição inspirada no equilíbrio entre figura humana e arquitetura.', 1, 1),
('Silêncio em Veludo',  'Drama Barroco',      '1640-01-01', 'Cena de forte contraste luminoso com atmosfera solene.',                 2, 1),
('Manhã no Jardim',     'Natureza e Cor',     '1892-01-01', 'Paisagem luminosa com pincelada solta e vibração cromática.',            3, 1),
('Memória Fragmentada', 'Sonho e Tempo',      '1933-01-01', 'Exploração surrealista da memória através de formas simbólicas.',        4, 1),
('Horizonte Interior',  'Paisagem Moderna',   '1928-01-01', 'Síntese moderna de espaço, silêncio e contemplação.',                    8, 1);


-- ------------------------------------------------------------------------
-- Relação Obra–Artista
-- Novas obras assumidas como IDs 15 a 19
-- ------------------------------------------------------------------------
INSERT INTO Obra_Artista (idObra, idArtista) VALUES
(15, 1),
(16, 5),
(17, 6),
(18, 3),
(19, 7);


-- ------------------------------------------------------------------------
-- Relação Exposição–Obra
-- Nova exposição assumida como ID 7
-- ------------------------------------------------------------------------
INSERT INTO Exposicao_Obra (idExposicao, idObra) VALUES
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19);


-- ------------------------------------------------------------------------
-- Inscrições
-- Novos visitantes assumidos como IDs 11 a 60
-- ------------------------------------------------------------------------
INSERT INTO Inscricao (data_visita, valor_pago, estado, idVisitante, idExposicao) VALUES
('2026-04-20', 10.00, 'USADA',     11, 7),
('2026-04-20', 10.00, 'USADA',     12, 7),
('2026-04-21', 10.00, 'USADA',     13, 7),
('2026-04-21', 10.00, 'USADA',     14, 7),
('2026-04-22', 10.00, 'USADA',     15, 7),
('2026-04-22',  0.00, 'USADA',     16, 7),
('2026-04-23', 10.00, 'USADA',     17, 7),
('2026-04-23', 10.00, 'USADA',     18, 7),
('2026-04-24', 10.00, 'USADA',     19, 7),
('2026-04-24', 10.00, 'CANCELADA', 20, 7),

('2026-04-25', 10.00, 'USADA',     21, 7),
('2026-04-25', 10.00, 'USADA',     22, 7),
('2026-04-26', 10.00, 'USADA',     23, 7),
('2026-04-26',  0.00, 'USADA',     24, 7),
('2026-04-27', 10.00, 'USADA',     25, 7),
('2026-04-27', 10.00, 'USADA',     26, 7),
('2026-04-28', 10.00, 'USADA',     27, 7),
('2026-04-28', 10.00, 'USADA',     28, 7),
('2026-04-29', 10.00, 'USADA',     29, 7),
('2026-04-29', 10.00, 'CANCELADA', 30, 7),

('2026-04-30', 10.00, 'PENDENTE',  31, 7),
('2026-04-30', 10.00, 'PENDENTE',  32, 7),
('2026-05-01', 10.00, 'PENDENTE',  33, 7),
('2026-05-01', 10.00, 'PENDENTE',  34, 7),
('2026-05-02', 10.00, 'PENDENTE',  35, 7),
('2026-05-02',  0.00, 'PENDENTE',  36, 7),
('2026-05-03', 10.00, 'PENDENTE',  37, 7),
('2026-05-03', 10.00, 'PENDENTE',  38, 7),
('2026-05-04', 10.00, 'PENDENTE',  39, 7),
('2026-05-04', 10.00, 'PENDENTE',  40, 7),

('2026-05-05', 10.00, 'PENDENTE',  41, 7),
('2026-05-05', 10.00, 'PENDENTE',  42, 7),
('2026-05-06', 10.00, 'PENDENTE',  43, 7),
('2026-05-06', 10.00, 'PENDENTE',  44, 7),
('2026-05-07', 10.00, 'PENDENTE',  45, 7),
('2026-05-07', 10.00, 'PENDENTE',  46, 7),
('2026-05-08', 10.00, 'PENDENTE',  47, 7),
('2026-05-08', 10.00, 'PENDENTE',  48, 7),
('2026-05-09', 10.00, 'PENDENTE',  49, 7),
('2026-05-09', 10.00, 'PENDENTE',  50, 7),

('2026-05-10', 10.00, 'PENDENTE',  51, 7),
('2026-05-10', 10.00, 'PENDENTE',  52, 7),
('2026-05-11', 10.00, 'PENDENTE',  53, 7),
('2026-05-11', 10.00, 'PENDENTE',  54, 7),
('2026-05-12', 10.00, 'PENDENTE',  55, 7),
('2026-05-12',  0.00, 'PENDENTE',  56, 7),
('2026-05-13', 10.00, 'PENDENTE',  57, 7),
('2026-05-13', 10.00, 'PENDENTE',  58, 7),
('2026-05-14', 10.00, 'PENDENTE',  59, 7),
('2026-05-14', 10.00, 'PENDENTE',  60, 7);
