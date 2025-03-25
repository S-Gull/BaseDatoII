DELIMITER $$

CREATE TRIGGER actualizar_dosis_receta
AFTER UPDATE ON tbl_recetas_ga
FOR EACH ROW
BEGIN
    IF OLD.dosis_ga <> NEW.dosis_ga THEN
    END IF;
END $$

DELIMITER ;