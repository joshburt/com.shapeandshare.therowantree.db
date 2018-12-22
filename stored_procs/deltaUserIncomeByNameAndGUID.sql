DELIMITER $$

DROP procedure IF EXISTS `deltaUserIncomeByNameAndGUID`;

CREATE PROCEDURE `deltaUserIncomeByNameAndGUID`(
	IN target_guid VARCHAR(255),
    IN target_income_source_name VARCHAR(255),
    IN target_amount INT(11)
)
BEGIN
	DECLARE target_income_source_id INT(11);
    SET target_income_source_id = (SELECT income_source_id FROM income_source_type WHERE income_source_name = target_income_source_name);
	CALL deltaUserIncomeByGUID(target_guid, target_income_source_id, target_amount); 
END$$

DELIMITER ;
