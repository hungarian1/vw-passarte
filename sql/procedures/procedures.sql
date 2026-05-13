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

-- ------------------------------------------------------------------------
-- Altera a descrição de um artista
-- ------------------------------------------------------------------------

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

GRANT EXECUTE ON PROCEDURE galeria_arte.fn_altera_estado_insc TO 'trabalhador'@'localhost';
