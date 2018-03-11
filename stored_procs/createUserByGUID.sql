-- USE `therowantree`;
DROP procedure IF EXISTS `createUserByGUID`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUserByGUID`(
	IN new_guid VARCHAR(255)
)
BEGIN
	START TRANSACTION;
    
		-- If the provided guid doesn't exist, add it.
		IF (SELECT COUNT(*) FROM user WHERE guid = new_guid) = 0 THEN
			INSERT INTO user (guid) VALUES (new_guid);
        END IF;
        
        -- look up the userid for the provided guid
		SET @user_id = (SELECT user_id FROM user WHERE guid = new_guid);
        
        -- create the remaining user specific entries in other tables.
		IF (SELECT COUNT(*) FROM feature WHERE user_id = @user_id) = 0 THEN
			INSERT INTO feature (user_id) VALUES (@user_id);
        END IF;
		IF (SELECT COUNT(*) FROM user_info WHERE user_id = @user_id) = 0 THEN
			INSERT INTO user_game_state (user_id) VALUES (@user_id);
        END IF;
	COMMIT;
END$$

DELIMITER ;

