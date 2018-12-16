DELIMITER $$

DROP procedure IF EXISTS `setUserPopulationByGUID`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `setUserPopulationByGUID`(
	IN target_guid VARCHAR(255),
	IN new_population INT(11)
) 
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		-- ERROR
		ROLLBACK;
    END;

	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		-- WARNING
		ROLLBACK;
	END;

	START TRANSACTION;
    UPDATE user u1
		SET u1.population = new_population
	WHERE u1.guid = target_guid;
    COMMIT;
END$$

DELIMITER ;
