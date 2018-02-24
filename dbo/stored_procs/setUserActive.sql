CREATE DEFINER=`root`@`localhost` PROCEDURE `setUserActive`(
	IN  `target_user_id` INT(11)
)
BEGIN
	START TRANSACTION;
		UPDATE user
			SET active = TRUE
		WHERE user_id = target_user_id;
    COMMIT;
END