START TRANSACTION;

INSERT INTO fire_type (fire_name, fire_description) VALUES 
('dead', 'Dead'),
('smoldering', 'Smoldering'),
('flickering', 'Flickering'),
('burning', 'Burning'),
('roaring', 'Roaring');

COMMIT;

-- ----------------------------------------------------------------------------
-- Report --
-- ----------------------------------------------------------------------------
SELECT *
	FROM fire_type;