SET GLOBAL event_scheduler = ON;

DROP EVENT WheelOfTime;
CREATE EVENT WheelOfTime
    ON SCHEDULE EVERY 1 SECOND
    DO CALL therowantree.applyTimeQuantum;

DROP EVENT CleanUpTemporaryUsers;
CREATE EVENT CleanUpTemporaryUsers
    ON SCHEDULE EVERY 1 DAY
        DO CALL therowantree.CleanUpTemporaryUsers;

SHOW EVENTS;
