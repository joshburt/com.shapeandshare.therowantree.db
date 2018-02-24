CREATE PROCEDURE `getUserIncomeByGUID` (
	IN target_guid VARCHAR(255)
)
BEGIN
	SELECT ui1.amount, ist1.income_source_name, ist1.income_source_description
		FROM user_income ui1
	JOIN income_source_type ist1
		ON ist1.income_source_id = ui1.income_source_id
	JOIN user u1
		ON u1.user_id = ui1.user_id
	WHERE u1.guid = target_guid;
END
