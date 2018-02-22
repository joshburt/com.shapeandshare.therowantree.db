CREATE DEFINER=`root`@`localhost` PROCEDURE `deltaUserIncomeBySource`(
IN `user_id` INT(11), 
IN `income_source_id` INT(11)
)
BEGIN
	-- SELECT user_id, income_source_id;
	
    -- Default to allowing the income change
	DECLARE incomeFlag BOOLEAN DEFAULT TRUE;
    
	DECLARE _store_id INT(11);
	DECLARE _amount FLOAT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE income_cursor CURSOR FOR 
		SELECT store_id, amount FROM income_source WHERE income_source_id=income_source_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;    
    
    OPEN income_cursor;
    
    read_loop: LOOP
		FETCH income_cursor INTO _store_id, _amount;
		IF done THEN
			LEAVE read_loop;
		END IF;
        
		-- cotext, for user, for income source, for each store of it,
		IF !canDeltaStore(user_id, _store_id, _amount) THEN
			SET incomeFlag = FALSE;
		END IF;
    END LOOP;
    CLOSE income_cursor;
    
	-- now if incomeFlag is still TRUE, then we actually delta the stores
	IF incomeFlag THEN
		BEGIN
			DECLARE done2 INT DEFAULT FALSE;
			DECLARE income_cursor_two CURSOR FOR 
				SELECT store_id, amount FROM income_source WHERE income_source_id=income_source_id;
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;                           
			
			OPEN income_cursor_two;
			
			read_loop2: LOOP
				FETCH income_cursor_two INTO _store_id, _amount;
				IF done2 THEN
					LEAVE read_loop2;
				END IF;
				CALL deltaUserStore(user_id, _store_id, _amount);
			END LOOP;
			CLOSE income_cursor_two;
		END;
	END IF;
    
END