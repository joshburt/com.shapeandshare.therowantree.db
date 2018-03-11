-- USE `therowantree`;
DROP procedure IF EXISTS `transportUserByGUID`;

DELIMITER $$
-- USE `therowantree`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `transportUserByGUID`(
	IN target_guid VARCHAR(255),
    IN target_feature_name VARCHAR(255)
) 
BEGIN
	START TRANSACTION;
		UPDATE user_game_state ugs1
			JOIN user u1
				ON u1.user_id = ugs1.user_id
			SET ugs1.active_feature = (
            
				 SELECT f1.feature_id
					FROM user u1
				 JOIN feature f1
					ON u1.user_id = f1.user_id
				 JOIN feature_type ft1
					ON ft1.feature_id = f1.feature_id
				 WHERE u1.guid = target_guid
					 AND ft1.feature_name = target_feature_name
                 
            )
		WHERE u1.guid = target_guid
			AND u1.active > 0;
	COMMIT;
END$$

DELIMITER ;

