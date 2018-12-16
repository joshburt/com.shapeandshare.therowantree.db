DELIMITER $$

DROP procedure IF EXISTS `transportUserByGUID`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `transportUserByGUID`(
	IN target_guid VARCHAR(255),
    IN target_feature_name VARCHAR(255)
)
BEGIN
	DECLARE target_feature_id INT(11);
    DECLARE target_user_id INT(11);
    
	START TRANSACTION;
    
		SET target_user_id = (
			SELECT u1.user_id 
				FROM user u1
			WHERE u1.guid = target_guid
        );
    
		SET target_feature_id = (
			SELECT f1.feature_id
				FROM user u1
			 JOIN feature f1
				ON u1.user_id = f1.user_id
			 JOIN feature_type ft1
				ON ft1.feature_id = f1.feature_id
			 WHERE u1.guid = target_guid
				 AND ft1.feature_name = target_feature_name
		 );
    
		UPDATE user_game_state ugs1
			JOIN user u1
				ON u1.user_id = ugs1.user_id
			SET ugs1.active_feature = target_feature_id
		WHERE u1.guid = target_guid
			AND u1.active > 0;
            
		-- Address the case where the user has discovered the location, but does not yet have a status in it.
        -- If a feature_state exists then we're fine otherwise create the default 
        CALL getUserActiveFeatureStateDetailsByGUID(target_guid);
		IF ((SELECT FOUND_ROWS())=0)
        THEN
			BEGIN
				INSERT INTO user_feature_state (user_id, feature_id) VALUES
					(target_user_id, target_feature_id);
            END;
        END IF;

	COMMIT;
END$$

DELIMITER ;
