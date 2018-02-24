CREATE PROCEDURE `setUserActiveByGUID` (
	IN target_guid VARCHAR(255)
)
BEGIN
	DECLARE local_user_id INT(11);
	SELECT user_id INTO local_user_id FROM user WHERE guid=target_guid;
    CALL setUserActive(local_user_id);
END
