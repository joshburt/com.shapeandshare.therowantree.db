DELIMITER $$

DROP procedure IF EXISTS `getUserActiveFeatureStateDetailsByGUID`;

CREATE PROCEDURE `getUserActiveFeatureStateDetailsByGUID`(
	IN target_guid VARCHAR(255)
) 
BEGIN
	SELECT fs1.state_name, fs1.state_description
		FROM user_feature_state ufs1
	JOIN user u1
		ON u1.user_id = ufs1.user_id
	JOIN user_game_state ugs1
		ON u1.user_id = ugs1.user_id
	JOIN feature_state fs1
		ON ufs1.feature_id = fs1.feature_id
	WHERE u1.guid = target_guid
		AND ufs1.feature_id = ugs1.active_feature
		AND fs1.state_index = ufs1.feature_index;
END$$

DELIMITER ;
