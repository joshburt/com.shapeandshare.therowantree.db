CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(
	IN `username` VARCHAR(16),
    IN `email` VARCHAR(255),
    IN `password` VARCHAR(64)
)
BEGIN
    START TRANSACTION;  
		IF ((SELECT COUNT(lookupUserID(username, email))) < 1)
		THEN
			SET @guid = (SELECT UUID());
			INSERT INTO user (guid) VALUES (@guid);
			SET @user_id = (SELECT user_id FROM user WHERE guid = @guid);
            
			INSERT INTO user_info (user_id, username, email, password) VALUES (@user_id, username, email, password);
            INSERT INTO user_game_state (user_id) VALUES (@user_id);
		END IF;
    COMMIT;
END