DROP procedure IF EXISTS `setUserPopulationByGUID`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setUserPopulationByGUID`(
	IN target_guid VARCHAR(255),
	IN new_population INT(11)
) 
BEGIN
	START TRANSACTION;
    UPDATE user u1
		SET u1.population = new_population
	WHERE u1.guid = target_guid;
    COMMIT;
END$$

DELIMITER ;

