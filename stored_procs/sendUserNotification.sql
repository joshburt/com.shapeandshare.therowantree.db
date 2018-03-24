CREATE PROCEDURE `sendUserNotification` (
	IN target_user_id INT(11),
    IN target_notification VARCHAR(2048)
)
BEGIN
	INSERT INTO user_notification (user_id, message) VALUES
		(target_user_id, target_notification);
END
