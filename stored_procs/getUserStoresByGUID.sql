DELIMITER $$

DROP procedure IF EXISTS `getUserStoresByGUID`;

CREATE PROCEDURE `getUserStoresByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
	SELECT st1.store_name, st1.store_description, s1.amount
		FROM store s1
		JOIN user u1
			ON u1.user_id = s1.user_id
		JOIN store_type st1
			ON st1.store_id = s1.store_id
	WHERE u1.guid = target_guid;
END$$

DELIMITER ;
