DELIMITER $$

DROP procedure IF EXISTS `deltaUserStoreByGUID`;

CREATE PROCEDURE `deltaUserStoreByGUID`(
	IN `my_user_guid` VARCHAR(255),
	IN `my_store_id` INT(11),
	IN `my_amount` FLOAT
) 
BEGIN

	START TRANSACTION;
    SET @my_user_id = (SELECT user_id FROM user WHERE guid = my_user_guid);
    SET @amount = (SELECT amount FROM store WHERE user_id=@my_user_id AND store_id=my_store_id);
    IF (@amount IS NULL)
    THEN
		IF (my_amount > 0)
        THEN
			INSERT INTO store (user_id, store_id, amount) VALUES (@my_user_id, my_store_id, my_amount);
        END IF;
	ELSE
		IF (@amount + my_amount) < 0
        THEN
			SET @amount = 0;
		ELSE
			SET @amount =  @amount + my_amount;
        END IF;    
    
		UPDATE store
			SET amount = @amount
		WHERE user_id=@my_user_id
			AND store_id=my_store_id;
    END IF;
    
    COMMIT;
END$$

DELIMITER ;
