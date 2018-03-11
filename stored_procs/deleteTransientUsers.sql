-- USE `therowantree`;
DROP procedure IF EXISTS `deleteTransientUsers`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTransientUsers`()
BEGIN
	-- removes stale users from the system when fired.
    
	DECLARE _guid VARCHAR(255);
    
	DECLARE done INT DEFAULT FALSE;
	DECLARE transient_users_cursor CURSOR FOR 
		SELECT u1.guid FROM user u1 LEFT JOIN user_info ui1 ON u1.user_id = ui1.user_id WHERE ui1.user_id IS NULL AND u1.active = 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN transient_users_cursor;
	read_loop: LOOP
		FETCH transient_users_cursor INTO _guid;
		IF done THEN
			LEAVE read_loop;
		END IF;

        BEGIN
            CALL deleteUserByGUID(_guid);
         END;
    END LOOP;
    
    CLOSE transient_users_cursor;
END$$

DELIMITER ;

