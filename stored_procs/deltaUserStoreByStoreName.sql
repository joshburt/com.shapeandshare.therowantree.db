DELIMITER $$

DROP procedure IF EXISTS `deltaUserStoreByStoreName`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `deltaUserStoreByStoreName`(
	IN `my_user_id` INT(11),
	IN `my_store_name` VARCHAR(255),
	IN `my_amount` FLOAT
) 
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		-- ERROR
		ROLLBACK;
    END;

	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		-- WARNING
		ROLLBACK;
	END;

	START TRANSACTION;
    
    SET @my_store_id = (SELECT store_id FROM store_type WHERE store_name = my_store_name);
    SET @amount = (SELECT amount FROM store WHERE user_id=my_user_id AND store_id=@my_store_id);

    IF (@amount IS NULL)
    THEN
		IF (my_amount > 0)
		THEN
			INSERT INTO store (user_id, store_id, amount) VALUES (my_user_id, @my_store_id, my_amount);
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
		WHERE user_id=my_user_id 
			AND store_id=@my_store_id;
    END IF;

    COMMIT;
END$$

DELIMITER ;
