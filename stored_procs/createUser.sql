DELIMITER $$

DROP procedure IF EXISTS `createUser`;

CREATE PROCEDURE `createUser`()
BEGIN
	-- Creates a new user with a new random UUID
	SET @new_guid = (SELECT UUID());
    CALL createUserByGUID(@new_guid);
    SELECT @new_guid;
END$$

DELIMITER ;
