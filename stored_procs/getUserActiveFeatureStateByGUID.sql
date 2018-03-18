DROP procedure IF EXISTS `getUserActiveFeatureStateByGUID`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserActiveFeatureStateByGUID`(
	IN target_guid VARCHAR(255)
)
BEGIN
	-- Get the feature_state entry for the user at the active feature location 
	SELECT ufs1.feature_id, ufs1.feature_index
		FROM user_feature_state ufs1
	JOIN user u1
		ON u1.user_id = ufs1.user_id
	JOIN user_game_state ugs1
		ON u1.user_id = ugs1.user_id
	WHERE u1.guid = @target_guid
		AND ufs1.feature_id = ugs1.active_feature;
END$$

DELIMITER ;

