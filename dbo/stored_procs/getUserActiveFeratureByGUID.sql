CREATE PROCEDURE `getUserActiveFeratureByGUID` (
	IN target_guid VARCHAR(255)
)
BEGIN
	SELECT ugs1.active_feature
		FROM user_game_state ugs1
    JOIN user u1
		ON u1.user_id = ugs1.user_id
	WHERE u1.guid = target_guid;
END
