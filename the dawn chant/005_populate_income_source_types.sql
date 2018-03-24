START TRANSACTION;

INSERT INTO income_source_type (income_source_name) VALUES
    ('gatherer'),
    ('hunter'),
    ('trapper'),
    ('farmer'),
    ('tanner'),
    ('charcutier'),
    ('iron miner'),
    ('coal miner'),
    ('sulphur miner'),
    ('steelworker'),
    ('armourer');

COMMIT;

-- ----------------------------------------------------------------------------
-- Report --
-- ----------------------------------------------------------------------------
SELECT *
    FROM income_source_type;
