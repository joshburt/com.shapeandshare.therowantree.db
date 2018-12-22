DELIMITER $$

DROP procedure IF EXISTS `getUserFeaturesByGUID`;

CREATE PROCEDURE `getUserFeaturesByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
	SELECT ft1.feature_name
		FROM feature f1
	JOIN feature_type ft1
		ON ft1.feature_id = f1.feature_id
    JOIN user u1
		ON u1.user_id = f1.user_id
	WHERE u1.guid = target_guid;
END$$

DELIMITER ;
