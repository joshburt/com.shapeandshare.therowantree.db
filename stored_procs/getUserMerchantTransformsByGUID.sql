DELIMITER $$

DROP procedure IF EXISTS `getUserMerchantTransformsByGUID`;

CREATE PROCEDURE `getUserMerchantTransformsByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
SELECT DISTINCT st1.store_name
	FROM user u1
JOIN store s1
	ON u1.user_id = s1.user_id
JOIN merchant_transforms mt1
	ON s1.store_id = mt1.to_store_id
JOIN store_type st1
	ON st1.store_id = s1.store_id
WHERE u1.guid = target_guid
	AND u1.active > 0
ORDER BY st1.store_name;
END$$

DELIMITER ;
