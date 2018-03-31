CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUserByGUID`(
	IN target_guid VARCHAR(255)
)
BEGIN
	
    
	START TRANSACTION;
    
		DELETE f1
			FROM feature f1
				JOIN user u1
					ON u1.user_id = f1.user_id
			WHERE u1.guid = target_guid;
			
		DELETE p1 
			FROM perk p1
				JOIN user u1
					ON u1.user_id = p1.user_id
			WHERE u1.user_id = target_guid;

		DELETE s1 
			FROM store s1
				JOIN user u1
					ON u1.user_id = s1.user_id
		WHERE u1.guid = target_guid;
		
		DELETE ugs1
			FROM user_game_state ugs1
				JOIN user u1
					ON u1.user_id = ugs1.user_id
		WHERE u1.guid = target_guid;
		
		DELETE ui1 
			FROM user_income ui1
				JOIN user u1
					ON u1.user_id = ui1.user_id
		WHERE u1.guid = target_guid;
		
		DELETE ui2
			FROM user_info ui2
				JOIN user u1
					ON u1.user_id = ui2.user_id
		WHERE u1.guid = target_guid;
		
        DELETE ufs1
			FROM user_feature_state ufs1
				JOIN user u1
					ON u1.user_id = ufs1.user_id
		WHERE u1.guid = target_guid;
        
        DELETE un1
			FROM user_notification un1
				JOIN user u1
					ON u1.user_id = un1.user_id
		WHERE u1.guid = target_guid;
        
		DELETE u1 
			FROM user u1
		WHERE u1.guid = target_guid;
    
    COMMIT;
END