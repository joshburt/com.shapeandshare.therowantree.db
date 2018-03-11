-- USE `therowantree`;
DROP procedure IF EXISTS `canDeltaStore`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `canDeltaStore`(
	IN target_user_id INT(11),
	IN target_store_id INT(11),
	IN target_amount FLOAT,
    OUT canDeltaStoreResult TINYINT(1)
)
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
        
	-- SELECT verdict;
    SET canDeltaStoreResult = verdict;
END$$

DELIMITER ;

