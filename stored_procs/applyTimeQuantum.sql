DELIMITER $$

DROP procedure IF EXISTS `applyTimeQuantum`;

CREATE PROCEDURE `applyTimeQuantum`()
BEGIN
	-- Update income for all active users
    DECLARE _user_id INT(11);
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_cursor CURSOR FOR 
		SELECT user_id from user where active = 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
	OPEN user_cursor;
	read_loop: LOOP
		FETCH user_cursor INTO _user_id;
		IF done THEN
			LEAVE read_loop;
		END IF;
        BEGIN
			CALL processUserIncome(_user_id);
        END;
    END LOOP;
    CLOSE user_cursor;
    
    -- process next thing this time quantum..

END$$

DELIMITER ;

