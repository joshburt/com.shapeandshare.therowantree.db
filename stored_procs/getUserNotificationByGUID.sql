DELIMITER $$

DROP procedure IF EXISTS `getUserNotificationByGUID`;

CREATE PROCEDURE `getUserNotificationByGUID`(
	IN target_guid VARCHAR(255)
)
BEGIN

    START TRANSACTION;
		
        DROP TEMPORARY TABLE IF EXISTS  `target_user_notifications`;
		
        CREATE TEMPORARY TABLE IF NOT EXISTS target_user_notifications AS (
			SELECT un1.notification_id, un1.creation_date, un1.message
				FROM user_notification un1
			JOIN user u1
				ON u1.user_id = un1.user_id
			WHERE u1.guid = target_guid
				AND un1.delivered = 0
			);
		
        UPDATE user_notification un1
		JOIN user u1
			ON u1.user_id = un1.user_id
		SET un1.delivered = 1
		WHERE u1.guid = target_guid
			AND un1.delivered = 0;
	
		SELECT * FROM target_user_notifications;
    
    COMMIT;
    
END$$

DELIMITER ;
