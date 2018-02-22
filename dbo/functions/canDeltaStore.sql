CREATE DEFINER=`root`@`localhost` FUNCTION `canDeltaStore`(
	`user_id` INT(11),
	`store_id` INT(11),
	`amount` FLOAT
) RETURNS tinyint(1)
BEGIN

RETURN true;
END