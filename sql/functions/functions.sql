USE galeria_arte;


-- ========================================================================
-- FUNÇÕES
-- ========================================================================


-- ------------------------------------------------------------------------
-- Valor total pago por um visitante
-- ------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION fn_total_pago(f_idVisitante INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT SUM(valor_pago) INTO v_total
    FROM Inscricao
    WHERE idVisitante = f_idVisitante;

    RETURN COALESCE(v_total, 0);
END$$

DELIMITER ;


-- ------------------------------------------------------------------------
-- Classificação de visitante com base em inscrições utilizadas
-- ------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION fn_classificar_visitante(f_idVisitante INT)
RETURNS VARCHAR(20)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE q_insc INT;

    SELECT COUNT(*) INTO q_insc
    FROM Inscricao
    WHERE idVisitante = f_idVisitante AND estado = 'USADA';

    IF q_insc > 20 THEN
        RETURN 'MUITO FREQUENTE';
    ELSEIF q_insc > 10 THEN
        RETURN 'REGULAR';
    ELSE
        RETURN 'OCASIONAL';
    END IF;
END$$

DELIMITER ;
