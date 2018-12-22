DELIMITER $$

DROP procedure IF EXISTS `setUserActiveByGUID`;

CREATE PROCEDURE `setUserActiveByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
    START TRANSACTION;
    UPDATE user u1
		SET u1.active = TRUE
	WHERE u1.guid = target_guid;
    COMMIT;
END$$

DELIMITER ;
