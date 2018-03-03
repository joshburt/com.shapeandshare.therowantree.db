CREATE DEFINER=`root`@`localhost` PROCEDURE `peformMerchantTransformByGUID`(
	IN target_guid VARCHAR(255),
	IN to_store_name VARCHAR(255)
)
BEGIN
    DECLARE target_user_id INT(11);
 	DECLARE _store_id INT(11);
	DECLARE _amount FLOAT;
    DECLARE _source_amount FLOAT;
 
    -- Default to allowing the income change
	DECLARE transformFlag BOOLEAN DEFAULT TRUE;
    
	DECLARE done INT DEFAULT FALSE;
	DECLARE element_transform_cursor CURSOR FOR 
		SELECT st2_from.store_id, mt1.amount
			FROM merchant_transforms mt1
		JOIN store_type st1_to
			ON st1_to.store_id = mt1.to_store_id
		JOIN store_type st2_from
			ON st2_from.store_id = mt1.from_store_id
		WHERE st1_to.store_name = to_store_name
		ORDER BY st1_to.store_name;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;    
    
    -- look up the user_id before we begin..
    SELECT user_id INTO target_user_id FROM user WHERE guid = target_guid;
    
    OPEN element_transform_cursor;
    
	read_loop: LOOP
	FETCH element_transform_cursor INTO _store_id, _amount;
    
    -- invert amount to remove from source
    SET _source_amount = _amount * -1;
    
	IF done THEN
		LEAVE read_loop;
	END IF;
		IF !canDeltaStore(target_user_id, _store_id, _source_amount) THEN
			SET transformFlag = FALSE;
		END IF;
	END LOOP;
    CLOSE element_transform_cursor;

    -- also check the implicit store type (the one to get)    
	IF !canDeltaStore(target_user_id, (SELECT store_id FROM store_type WHERE store_name=to_store_name), _amount) THEN
		SET transformFlag = FALSE;
	END IF;
    
    	-- now if incomeFlag is still TRUE, then we actually delta the stores
	IF transformFlag THEN
		BEGIN
			DECLARE done2 INT DEFAULT FALSE;
			DECLARE element_transform_cursor_two CURSOR FOR 
				SELECT st2_from.store_id, mt1.amount
					FROM merchant_transforms mt1
				JOIN store_type st1_to
					ON st1_to.store_id = mt1.to_store_id
				JOIN store_type st2_from
					ON st2_from.store_id = mt1.from_store_id
				WHERE st1_to.store_name = to_store_name
				ORDER BY st1_to.store_name;
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;      
            
            START TRANSACTION;
            OPEN element_transform_cursor_two;
			read_loop2: LOOP
			FETCH element_transform_cursor_two INTO _store_id, _amount;
            SET _source_amount = _amount * -1;
			IF done2 THEN
				LEAVE read_loop2;
			END IF;
				CALL deltaUserStore(target_user_id, _store_id, _source_amount);
			END LOOP;
            
			CLOSE element_transform_cursor_two;
            
            -- now perform the delta for the IMPLICIT store
            CALL deltaUserStore(target_user_id, (SELECT store_id FROM store_type WHERE store_name=to_store_name), 1);
            
            COMMIT;
        END;
    END IF;
END