DELIMITER $$

DROP procedure IF EXISTS `getUserPopulationByID`;

CREATE PROCEDURE `getUserPopulationByID`(
	IN target_user_id INT(11)
)
BEGIN
    SELECT population
		FROM user u1
	WHERE u1.user_id = target_user_id;
END$$

DELIMITER ;
