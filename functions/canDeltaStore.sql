CREATE DEFINER=`root`@`localhost` FUNCTION `canDeltaStore`(
	target_user_id INT(11),
	target_store_id INT(11),
	target_amount FLOAT
) RETURNS tinyint(1)
BEGIN

	DECLARE verdict INT DEFAULT FALSE;
	DECLARE currentAmount FLOAT;
    
	SELECT amount INTO currentAmount
		FROM store
	WHERE user_id = target_user_id
		AND store_id = target_store_id;
	
    IF currentAmount IS NULL THEN
		SET currentAmount = 0;
    END IF;
    
	IF (currentAmount + target_amount) >= 0 THEN
		SET verdict = 1;
    END IF;
        
        
RETURN verdict;
END