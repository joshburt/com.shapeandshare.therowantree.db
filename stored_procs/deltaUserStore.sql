DROP procedure IF EXISTS `deltaUserStore`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deltaUserStore`(
	IN `my_user_id` INT(11),
	IN `my_store_id` INT(11),
	IN `my_amount` FLOAT
) 
BEGIN
	START TRANSACTION;
    
    SET @amount = (SELECT amount FROM store WHERE user_id=my_user_id AND store_id=my_store_id);
    IF (@amount IS NULL)
    THEN
		INSERT INTO store (user_id, store_id, amount) VALUES (my_user_id, my_store_id, my_amount);
	ELSE
		UPDATE store
			SET amount = (@amount  + my_amount)
		WHERE user_id=my_user_id 
			AND store_id=my_store_id;
    END IF;
    
    COMMIT;
END$$

DELIMITER ;

