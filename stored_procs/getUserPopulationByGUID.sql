-- USE `therowantree`;
DROP procedure IF EXISTS `getUserPopulationByGUID`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserPopulationByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
    SELECT population
		FROM user u1
	WHERE u1.guid = target_guid;
END$$

DELIMITER ;

