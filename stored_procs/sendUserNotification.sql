DELIMITER $$

DROP procedure IF EXISTS `sendUserNotification`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sendUserNotification`(
	IN target_user_id INT(11),
    IN target_notification VARCHAR(2048)
)
BEGIN
	START TRANSACTION;
		INSERT INTO user_notification (user_id, message) VALUES
			(target_user_id, target_notification);
	COMMIT;
END$$

DELIMITER ;
