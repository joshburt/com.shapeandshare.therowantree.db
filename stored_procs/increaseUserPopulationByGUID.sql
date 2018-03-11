-- USE `therowantree`;
DROP procedure IF EXISTS `increaseUserPopulationByGUID`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `increaseUserPopulationByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
	DECLARE new_population INT(11) DEFAULT 0;
    DECLARE current_population INT(11);
    DECLARE active_state TINYINT(4);
    SET active_state = (SELECT active FROM user WHERE guid = target_guid);
    IF active_state = 1
    THEN
		BEGIN
			START TRANSACTION;
			
			SET current_population = (SELECT population FROM user WHERE guid = target_guid);
			IF (current_population IS NULL)
			THEN
				SET new_population = 1;
			ELSE
				SELECT population
					INTO current_population
				FROM user
					WHERE guid = target_guid;
				SET new_population = current_population + 1;
			END IF;
			
			UPDATE user
				SET population = new_population
			WHERE guid = target_guid;
			
			COMMIT;
        END;
    END IF;
END$$

DELIMITER ;

