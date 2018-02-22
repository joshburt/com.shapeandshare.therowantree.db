CREATE DEFINER=`root`@`localhost` PROCEDURE `processUserIncome`(
	IN `userID` INT(11)
)
BEGIN
	-- get set of user_income entries for user
		-- for each income entry (and multiple of)
			-- if stores can be delta'ed do so, orherwise skip

	DECLARE _income_source_id INT(11);
    DECLARE _amount FLOAT;
    

	-- for  each user_income entry
		-- for amount x income_source_id loop over
	DECLARE done INT DEFAULT FALSE;
	DECLARE income_sources_cursor CURSOR FOR 
		SELECT income_source_id, amount FROM user_income where user_id = userID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN income_sources_cursor;
	read_loop: LOOP
		FETCH income_sources_cursor INTO _income_source_id, _amount;
		IF done THEN
			LEAVE read_loop;
		END IF;
        -- for each amount, loop
        BEGIN
			DECLARE counter INT DEFAULT 0;
            WHILE counter < _amount DO
                CALL deltaUserIncomeBySource(userID, _income_source_id);
                
                SET counter = counter + 1;
            END WHILE;
            
        END;
	
    END LOOP;
	
    CLOSE income_sources_cursor;
    
END