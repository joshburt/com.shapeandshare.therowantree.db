DELIMITER $$

DROP procedure IF EXISTS `deltaUserIncomeByGUID`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `deltaUserIncomeByGUID`(
	IN target_guid VARCHAR(255),
    IN target_income_source_id INT(11),
    IN target_amount INT(11)
)
BEGIN

	DECLARE target_user_id INT(11);
    DECLARE current_population INT(11);
    DECLARE new_population INT(11);
    DECLARE workers INT(11);
    DECLARE new_workers INT(11);
    
    START TRANSACTION;
    
		SET target_user_id = (SELECT user_id FROM user WHERE guid = target_guid);    
		SET current_population = (SELECT population FROM user WHERE guid = target_guid);
		SET workers = (SELECT amount FROM user_income WHERE user_id = target_user_id AND income_source_id = target_income_source_id);
		IF ((workers IS NOT NULL) AND (target_user_id IS NOT NULL) AND (current_population IS NOT NULL))
        THEN
			-- Then the player has discovered this
			SET new_population = current_population - target_amount;
			SET new_workers = workers + target_amount;

			IF ((new_population >= 0) AND (new_workers >= 0))
			THEN
			-- TODO: this needs to be safer :/ 
				CALL deltaUserPopulationByGUID(target_guid, -target_amount);
				UPDATE user_income
				SET amount = new_workers
				WHERE user_id = target_user_id
					AND income_source_id = target_income_source_id;
			END IF;
        END IF;
    COMMIT;
END$$

DELIMITER ;
