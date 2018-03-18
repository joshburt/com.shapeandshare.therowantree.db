DROP procedure IF EXISTS `setUserInactiveByGUID`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setUserInactiveByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
    START TRANSACTION;
    UPDATE user u1
		SET u1.active = FALSE
	WHERE u1.guid = target_guid;
    COMMIT;
END$$

DELIMITER ;

