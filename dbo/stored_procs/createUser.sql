CREATE PROCEDURE `createUser` ()
BEGIN
	SET @new_guid = (SELECT UUID());
    CALL createUserByGUID(@new_guid);
    SELECT @new_guid;
END
