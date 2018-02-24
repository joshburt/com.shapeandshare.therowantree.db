CREATE DEFINER=`root`@`localhost` PROCEDURE `setUserInactive`(
	IN  `target_user_id` INT(11)
)
BEGIN
	START TRANSACTION;
		UPDATE user
			SET active = FALSE
		WHERE user_id = target_user_id;
    COMMIT;
END