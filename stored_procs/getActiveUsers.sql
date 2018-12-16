DELIMITER $$

DROP procedure IF EXISTS `getActiveUsers`;

CREATE PROCEDURE `getActiveUsers` ()
BEGIN
	SELECT u1.user_id
		FROM user u1
	WHERE u1.active = TRUE;
END$$

DELIMITER ;
