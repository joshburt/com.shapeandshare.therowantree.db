DELIMITER $$

DROP procedure IF EXISTS `getUserActivityStateByGUID`;

CREATE PROCEDURE `getUserActivityStateByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
	SELECT active FROM user WHERE guid = target_guid;
END$$

DELIMITER ;
