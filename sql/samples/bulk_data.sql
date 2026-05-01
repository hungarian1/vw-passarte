USE galeria_arte;

DELIMITER $$

DROP PROCEDURE IF EXISTS seed_benchmark_data$$

CREATE PROCEDURE seed_benchmark_data(IN total_visitors INT, IN total_inscricoes INT)
BEGIN
  DECLARE i              INT DEFAULT 1;
  DECLARE v_nif          VARCHAR(9);
  DECLARE v_nome         VARCHAR(100);

  -- Real ID bounds read from actual parent tables
  DECLARE min_trab       INT DEFAULT 1;
  DECLARE max_trab       INT DEFAULT 1;
  DECLARE min_vis        INT DEFAULT 1;
  DECLARE max_vis        INT DEFAULT 1;
  DECLARE min_exp        INT DEFAULT 1;
  DECLARE max_exp        INT DEFAULT 1;

  -- --------------------------------------------------------
  -- 0. Read real Trabalhador ID bounds first
  -- --------------------------------------------------------
  SELECT MIN(idTrabalhador), MAX(idTrabalhador)
    INTO min_trab, max_trab
    FROM Trabalhador;

  IF min_trab IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Tabela Trabalhador está vazia. Corre o seed base primeiro.';
  END IF;

  -- --------------------------------------------------------
  -- 1. Insert bulk visitors
  --    NIF starts at 800000001 — avoids collision with base seed (600xxxxxx/700xxxxxx)
  -- --------------------------------------------------------
  SET i = 1;
  WHILE i <= total_visitors DO
    SET v_nif  = LPAD(800000000 + i, 9, '0');
    SET v_nome = CONCAT(
      ELT(FLOOR(1 + RAND() * 15), 'Carlos','Mariana','Pedro','Joana','Filipe',
          'Helena','Tiago','Beatriz','Nuno','Vera','Paulo','Rita','Hugo','Sofia','Diogo'),
      ' ',
      ELT(FLOOR(1 + RAND() * 10), 'Silva','Santos','Costa','Ferreira','Oliveira',
          'Rodrigues','Martins','Jesus','Sousa','Fernandes')
    );
    INSERT INTO Visitante
      (nome, data_nascimento, nif, genero, nacionalidade, telefone, email, idTrabalhador)
    VALUES (
      v_nome,
      DATE_SUB(CURDATE(), INTERVAL FLOOR(18 + RAND() * 60) YEAR),
      v_nif,
      ELT(FLOOR(1 + RAND() * 2), 'HOMEM', 'MULHER'),
      ELT(FLOOR(1 + RAND() * 4), 'Portuguesa','Brasileira','Espanhola','Francesa'),
      CONCAT('9', LPAD(FLOOR(RAND() * 99999999), 8, '0')),
      CONCAT(LOWER(REPLACE(v_nome, ' ', '.')), i, '@email.pt'),
      FLOOR(min_trab + RAND() * (max_trab - min_trab + 1))  -- real Trabalhador IDs only
    );
    SET i = i + 1;
  END WHILE;

  -- --------------------------------------------------------
  -- 2. Read real Visitante and Exposicao bounds after insert
  -- --------------------------------------------------------
  SELECT MIN(idVisitante), MAX(idVisitante)
    INTO min_vis, max_vis
    FROM Visitante;

  SELECT MIN(idExposicao), MAX(idExposicao)
    INTO min_exp, max_exp
    FROM Exposicao;

  IF min_vis IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Tabela Visitante está vazia após o loop. Verifica erros de inserção.';
  END IF;

  IF min_exp IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Tabela Exposicao está vazia. Corre o seed base primeiro.';
  END IF;

  -- --------------------------------------------------------
  -- 3. Insert inscricoes using verified bounds
  -- --------------------------------------------------------
  SET i = 1;
  WHILE i <= total_inscricoes DO
    INSERT INTO Inscricao
      (data_visita, valor_pago, estado, idVisitante, idExposicao)
    VALUES (
      DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
      ROUND(RAND() * 15, 2),
      ELT(FLOOR(1 + RAND() * 3), 'USADA', 'CANCELADA', 'PENDENTE'),
      FLOOR(min_vis + RAND() * (max_vis - min_vis + 1)),  -- real Visitante IDs only
      FLOOR(min_exp + RAND() * (max_exp - min_exp + 1))   -- real Exposicao IDs only
    );
    SET i = i + 1;
  END WHILE;

END$$

DELIMITER ;

CALL seed_benchmark_data(100, 1000);
