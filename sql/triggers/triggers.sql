DELIMITER $$

CREATE TRIGGER trg_valor_pago_insert_check
BEFORE INSERT ON Inscricao
FOR EACH ROW
BEGIN
    IF NEW.valor_pago < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'valor_pago não pode ser negativo';
    END IF;
END$$

CREATE TRIGGER trg_valor_pago_update_check
BEFORE UPDATE ON Inscricao
FOR EACH ROW
BEGIN
    IF NEW.valor_pago < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'valor_pago não pode ser negativo';
    END IF;
END$$

CREATE TRIGGER trg_overlap_exposicao_check
BEFORE INSERT ON Exposicao
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Exposicao e
        WHERE NEW.data_inicio <= e.data_fim
          AND NEW.data_fim >= e.data_inicio
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'data_inicio ou data_fim inválidas: conflitam com uma exposição existente';
    END IF;
END$$

CREATE TRIGGER trg_inicio_fim_exposicao_check
BEFORE INSERT ON Exposicao
FOR EACH ROW
BEGIN
    IF NEW.data_fim < NEW.data_inicio THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'data_inicio não pode ser maior que data_fim';
    END IF;
END$$

CREATE TRIGGER trg_inicio_fim_exposicao_update_check
BEFORE UPDATE ON Exposicao
FOR EACH ROW
BEGIN
    IF NEW.data_fim < NEW.data_inicio THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'nova data_fim inválida: menor que a nova data_inicio';
    END IF;
END$$

DELIMITER ;
