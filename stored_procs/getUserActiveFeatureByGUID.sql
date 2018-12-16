DELIMITER $$

DROP procedure IF EXISTS `getUserActiveFeatureByGUID`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserActiveFeatureByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
	SELECT ft1.feature_name
		FROM user_game_state ugs1
	JOIN feature_type ft1
		ON ft1.feature_id = ugs1.active_feature
    JOIN user u1
		ON u1.user_id = ugs1.user_id
	WHERE u1.guid = target_guid;
END$$

DELIMITER ;
