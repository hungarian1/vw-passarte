CREATE SCHEMA galeria_arte;

USE galeria_arte;

-- ------------------------------------------------------------------------
-- Tabela: Trabalhador
-- ------------------------------------------------------------------------

CREATE TABLE Trabalhador (
    idTrabalhador INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(75) NOT NULL,
    genero ENUM('HOMEM', 'MULHER') NOT NULL,
    nacionalidade VARCHAR(75),
    nif CHAR(9),
    num_telefone CHAR(9),
    data_nascimento DATE,
    PRIMARY KEY (idTrabalhador)
)  ENGINE=InnoDB;

-- ------------------------------------------------------------------------
-- Tabela: Visitante
-- ------------------------------------------------------------------------

CREATE TABLE Visitante (
    idVisitante INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(75) NOT NULL,
    data_nascimento DATE,
    nif CHAR(9),
    genero ENUM('HOMEM', 'MULHER'),
    nacionalidade VARCHAR(75),
    telefone CHAR(9),
    email VARCHAR(254),
    idTrabalhador INT NOT NULL,
    PRIMARY KEY (idVisitante),
    CONSTRAINT fk_trabalhador FOREIGN KEY (idTrabalhador)
        REFERENCES Trabalhador (idTrabalhador)
)  ENGINE=InnoDB;

-- ------------------------------------------------------------------------
-- Tabela: Exposição
-- ------------------------------------------------------------------------

CREATE TABLE Exposicao (
    idExposicao INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(75),
    tema VARCHAR(75),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    PRIMARY KEY (idExposicao)
)  ENGINE=InnoDB;

-- -----------------------------------------------------------------------
-- Tabela: Inscrição
-- -----------------------------------------------------------------------

CREATE TABLE Inscricao (
    idInscricao INT NOT NULL AUTO_INCREMENT,
    data_visita DATE NOT NULL,
    valor_pago DECIMAL(5 , 2 ),
    estado ENUM('PENDENTE', 'USADA', 'CANCELADA') DEFAULT 'PENDENTE',
    idVisitante INT NOT NULL,
    idExposicao INT NOT NULL,
    PRIMARY KEY (idInscricao),
    CONSTRAINT fk_visitante_inscricao FOREIGN KEY (idVisitante)
        REFERENCES Visitante (idVisitante),
    CONSTRAINT fk_inscricao_exposicao FOREIGN KEY (idExposicao)
        REFERENCES Exposicao (idExposicao)
)  ENGINE=InnoDB;

-- ------------------------------------------------------------------------
-- Tabela: Artista
-- ------------------------------------------------------------------------

CREATE TABLE Artista (
    idArtista INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(75) NOT NULL,
    data_nascimento DATE,
    data_falecimento DATE,
    genero ENUM('HOMEM', 'MULHER', 'DESCONHECIDO') NOT NULL DEFAULT 'DESCONHECIDO',
    nacionalidade VARCHAR(75),
    educacao VARCHAR(75),
    descricao VARCHAR(254),
    PRIMARY KEY (idArtista)
) ENGINE=InnoDB;


-- -----------------------------------------------------------------------
-- Tabela: Movimento Artístico
-- -----------------------------------------------------------------------
CREATE TABLE Movimento_Artistico (
    idMovimento INT NOT NULL AUTO_INCREMENT,
    nome        VARCHAR(75) NOT NULL UNIQUE,
    PRIMARY KEY (idMovimento)
) ENGINE=InnoDB;

-- ------------------------------------------------------------------------
-- Tabela: Tipo da Arte
-- ------------------------------------------------------------------------
CREATE TABLE Tipo_Arte (
    idTipo INT NOT NULL AUTO_INCREMENT,
    nome  VARCHAR(75) NOT NULL UNIQUE,
    PRIMARY KEY (idTipo)
) ENGINE=InnoDB;

-- ------------------------------------------------------------------------
-- Tabela: Obra de Arte
-- ------------------------------------------------------------------------

CREATE TABLE Obra (
    idObra              INT NOT NULL AUTO_INCREMENT,
    tema                VARCHAR(75),
    data_publicacao     DATE,
    descricao           VARCHAR(254),
    idMovimento         INT NOT NULL,
    idTipo              INT NOT NULL,
    PRIMARY KEY (idObra),
    CONSTRAINT fk_movimento
        FOREIGN KEY (idMovimento) REFERENCES Movimento_Artistico(idMovimento),
    CONSTRAINT fk_tipo
        FOREIGN KEY (idTipo) REFERENCES Tipo_Arte(idTipo)
) ENGINE=InnoDB;

-- ------------------------------------------------------------------------
-- Tabela: Relacional Artista_Obra (N to N)
-- ------------------------------------------------------------------------

CREATE TABLE Obra_Artista (
    idArtista INT NOT NULL,
    idObra INT NOT NULL,
    papel VARCHAR(30) CHECK (papel in ('PINTOR_PRINCIPAL','COLABORADOR')),
    PRIMARY KEY (idObra, idArtista),
    CONSTRAINT fk_obra_artista_obra
        FOREIGN KEY (idObra) REFERENCES Obra(idObra),
    CONSTRAINT fk_artista_obra_artista
        FOREIGN KEY (idArtista) REFERENCES Artista(idArtista)
) ENGINE=InnoDB;

CREATE INDEX idx_artista ON Obra_Artista (idArtista);

-- ------------------------------------------------------------------------
-- View: Derivação do movimento do artista pelo principal movimento de suas obras
-- ------------------------------------------------------------------------

CREATE VIEW Artista_Movimento AS
SELECT
    a.idArtista,
    a.nome AS artista,
    ma.nome AS movimento_artistico,
    COUNT(*) AS total_obras
FROM Artista a
JOIN Obra_Artista oa ON a.idArtista = oa.idArtista
JOIN Obra o          ON oa.idObra = o.idObra
JOIN Movimento_Artistico ma ON o.idMovimento = ma.idMovimento
GROUP BY a.idArtista, a.nome, ma.idMovimento, ma.nome
ORDER BY a.idArtista, total_obras DESC;

-- -----------------------------------------------------------------------
-- View: Derivação dos visitantes registrados por trabalhador
-- -----------------------------------------------------------------------

CREATE VIEW Visitantes_Trabalhador AS
SELECT
    t.idTrabalhador,
    t.nome AS trabalhador,
    COUNT(*) AS total_visitantes
FROM Trabalhador t
JOIN Visitante v ON t.idTrabalhador = v.idTrabalhador
GROUP BY t.idTrabalhador, t.nome
ORDER BY t.idTrabalhador, total_visitantes DESC;

-- ------------------------------------------------------------------------
-- Tabela: Exposição-Obra (N to N)
-- ------------------------------------------------------------------------

CREATE TABLE Exposicao_Obra (
    idExposicao INT NOT NULL,
    idObra INT NOT NULL,
    PRIMARY KEY (idExposicao, idObra),
    CONSTRAINT fk_exposicao_obra_exposicao
        FOREIGN KEY (idExposicao) REFERENCES Exposicao(idExposicao),
    CONSTRAINT fk_obra_exposicao_obra
        FOREIGN KEY (idObra) REFERENCES Obra(idObra)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------
-- View: Derivação das inscrições por Exposicão
-- -----------------------------------------------------------------------

CREATE VIEW Inscricao_Exposicao AS
SELECT
    e.idExposicao,
    e.nome AS exposicao,
    COUNT(*) AS total_inscricoes
FROM Exposicao e
JOIN Inscricao i ON e.idExposicao = i.idExposicao
GROUP BY e.idExposicao, e.nome
ORDER BY e.idExposicao, total_inscricoes DESC;
