SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO temperature_type (temperature_name, temperature_description) VALUES 
('freezing', 'Freezing'),
('cold', 'Cold'),
('mild', 'Mild'),
('warm', 'Warm'),
('hot', 'Hot');

COMMIT;

-- ----------------------------------------------------------------------------
-- Report --
-- ----------------------------------------------------------------------------
SELECT *
	FROM temperature_type;