START TRANSACTION;

SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS `WheelOfTime`;
CREATE EVENT WheelOfTime
    ON SCHEDULE EVERY 1 SECOND
    DO CALL applyTimeQuantum;

DROP EVENT IF EXISTS `CleanUpTemporaryUsers`;
CREATE EVENT CleanUpTemporaryUsers
    ON SCHEDULE EVERY 1 DAY
        DO CALL CleanUpTemporaryUsers;

COMMIT;

SHOW EVENTS;
