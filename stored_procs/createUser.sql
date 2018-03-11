-- USE `therowantree`;
DROP procedure IF EXISTS `createUser`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`()
BEGIN
	-- Creates a new user with a new random UUID
	SET @new_guid = (SELECT UUID());
    CALL createUserByGUID(@new_guid);
    SELECT @new_guid;
END$$

DELIMITER ;

