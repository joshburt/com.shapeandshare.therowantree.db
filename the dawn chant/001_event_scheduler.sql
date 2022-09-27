START TRANSACTION;

DROP EVENT IF EXISTS `applyTimeQuantum`;
CREATE EVENT applyTimeQuantum
    ON SCHEDULE EVERY 1 SECOND
    DO CALL applyTimeQuantum;

# DROP EVENT IF EXISTS `deleteTransientUsers`;
# CREATE EVENT deleteTransientUsers
#     ON SCHEDULE EVERY 1 DAY
#         DO CALL deleteTransientUsers;

DROP EVENT IF EXISTS `setUsersInactive`;
CREATE EVENT setUsersInactive
    ON SCHEDULE EVERY 30 SECOND
    DO CALL setUsersInactive;

COMMIT;

-- Might need to set be in a different method based on deployment paradigm.
-- SET GLOBAL event_scheduler = ON;

-- ----------------------------------------------------------------------------
-- Report --
-- ----------------------------------------------------------------------------
SHOW EVENTS;
