DELIMITER $$

DROP procedure IF EXISTS `setUsersInactive`;

CREATE PROCEDURE `setUsersInactive`(
)
BEGIN
START TRANSACTION;
    UPDATE user u1
        SET u1.active = 0
    WHERE u1.active = 1;
COMMIT;
END$$

DELIMITER ;
