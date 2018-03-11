CREATE DEFINER=`root`@`localhost` FUNCTION `lookupUserID`(
	`username` VARCHAR(16),
    `email` VARCHAR(255)
) RETURNS varchar(255) CHARSET latin1
    -- Return the user GUID
    RETURN (SELECT user_id FROM user_info WHERE username=username AND email=email);