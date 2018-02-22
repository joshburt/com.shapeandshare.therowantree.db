CREATE DEFINER=`root`@`localhost` PROCEDURE `process_user_income`(
	IN `userID` INT(11)
)
BEGIN
	-- Applies income delta where possibly over a single time quantum
			-- For each income source
            DECLARE _income_source_id INT(11);
            
            DECLARE done INT DEFAULT FALSE;
            DECLARE income_sources_cursor CURSOR FOR 
				SELECT DISTINCT income_source_id FROM income_source;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
            
            OPEN income_sources_cursor;
            
            read_loop: LOOP
				FETCH income_sources_cursor INTO _income_source_id;
                IF done THEN
					LEAVE read_loop;
				END IF;

				-- Default to allowing the income change
				SET @incomeFlag = true;
				
                -- See if we can apply the delta..
                BEGIN
					-- For each store_id if we can NOT delta it we set FALSE
					-- If still TRUE after reviewing all stores, then apply change
					
                    DECLARE _store_id INT(11);
					DECLARE _amount FLOAT;
					DECLARE done2 INT DEFAULT FALSE;
					DECLARE income_cursor CURSOR FOR 
						SELECT store_id, amount FROM income_source WHERE income_source_id=_income_source_id;
					DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;
                    
                    OPEN income_cursor;
                    
                    read_loop2: LOOP
						FETCH income_cursor INTO _store_id, _amount;
						IF done2 THEN
							LEAVE read_loop2;
						END IF;
                        
                        -- cotext, for user, for income source, for each store of it,
                        IF !canDeltaStore(userID, _store_id, _amount) THEN
							SET @incomeFlag = false;
                        END IF;
                        
					END LOOP;
                    CLOSE income_cursor;
                    
                    -- now if incomeFlag is still TRUE, then we actually delta the stores
                    IF @incomeFlag THEN
						BEGIN
							DECLARE done3 INT DEFAULT FALSE;
							DECLARE income_cursor_two CURSOR FOR 
								SELECT store_id, amount FROM income_source WHERE income_source_id=_income_source_id;
							DECLARE CONTINUE HANDLER FOR NOT FOUND SET done3 = TRUE;                           
                            
                            OPEN income_cursor_two;
                            
                            read_loop3: LOOP
								FETCH income_cursor_two INTO _store_id, _amount;
								IF done3 THEN
									LEAVE read_loop3;
								END IF;
                        
								CALL deltaUserStore(UserID, _store_id, _amount);
                            END LOOP;
                            CLOSE income_cursor_two;
                        END;
                    END IF;
                END;


            END LOOP;
            CLOSE income_sources_cursor;
END