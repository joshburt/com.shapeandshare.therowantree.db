CREATE DEFINER=`root`@`localhost` PROCEDURE `createUserByGUID`(
	IN new_guid VARCHAR(255)
)
BEGIN
	START TRANSACTION;
		IF (SELECT COUNT(*) FROM user WHERE guid = new_guid) = 0 THEN
			INSERT INTO user (guid) VALUES (new_guid);
        END IF;
		SET @user_id = (SELECT user_id FROM user WHERE guid = @guid);
		IF (SELECT COUNT(*) FROM user_info WHERE user_id = @user_id) > 0 THEN
			INSERT INTO user_game_state (user_id) VALUES (@user_id);
        END IF;
	COMMIT;
END