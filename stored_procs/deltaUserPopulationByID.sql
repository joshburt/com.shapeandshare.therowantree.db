DELIMITER $$

DROP procedure IF EXISTS `deltaUserPopulationByID`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `deltaUserPopulationByID`(
	IN target_id INT(11),
    IN amount INT(11)
)
BEGIN
	DECLARE new_population INT(11) DEFAULT 0;
    DECLARE current_population INT(11);

	START TRANSACTION;
	
	SET current_population = (SELECT population FROM user WHERE user_id = target_id);
	IF (current_population IS NULL)
	THEN
		SET new_population = 0;
	ELSE
		SELECT population
			INTO current_population
		FROM user
			WHERE user_id = target_id;
		SET new_population = current_population + amount;
	END IF;
	
	IF (new_population >= 0)
	THEN
		UPDATE user
			SET population = new_population
		WHERE user_id = target_id;
	END IF;
    
	COMMIT;
END$$

DELIMITER ;
