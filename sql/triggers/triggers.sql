DELIMITER $$

CREATE TRIGGER trg_valor_pago_insert_check
BEFORE INSERT ON Inscricao
FOR EACH ROW
BEGIN
    IF NEW.valor_pago < 0 THEN
        SET NEW.valor_pago = 0;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_valor_pago_update_check
BEFORE UPDATE ON Inscricao
FOR EACH ROW
BEGIN
    IF NEW.valor_pago < 0 THEN
        SIGNAL SQLSTATE '01000'
            SET MESSAGE_TEXT = 'valor_pago não pode ser negativo, portanto foi corrigido para 0.'
        SET NEW.valor_pago = 0;
    END IF;
END$$

DELIMITER ;
