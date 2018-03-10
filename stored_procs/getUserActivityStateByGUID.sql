CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserActivityStateByGUID`(
	IN target_guid VARCHAR(255),
    OUT target_active TINYINT(4)
)
BEGIN
	SELECT active INTO target_active FROM user WHERE guid = target_guid;
END