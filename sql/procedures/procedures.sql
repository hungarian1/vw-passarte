USE galeria_arte;
-- ========================================================================
-- PROCEDURES (funções sem valor de retorno)
-- ========================================================================


-- ------------------------------------------------------------------------
-- Altera o estado de uma inscrição
-- ------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE fn_altera_estado_insc(
    IN f_idInscricao INT,
    IN n_estado ENUM('PENDENTE','USADA','CANCELADA')
)
BEGIN
    UPDATE Inscricao
    SET estado = n_estado
    WHERE idInscricao = f_idInscricao;
END$$

DELIMITER ;


-- ------------------------------------------------------------------------
-- Altera a descrição de um artista
-- ------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE fn_altera_desc_artista(
    IN f_idArtista INT,
    IN f_desc VARCHAR(254)
)
BEGIN
    UPDATE Artista
    SET descricao = f_desc
    WHERE idArtista = f_idArtista;
END$$

DELIMITER ;