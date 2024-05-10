9SELECT
	magic_wand_creator,
	MAX(deposit_amount) AS max_deposit_amount
FROM
	wizard_deposits
	
WHERE 
	deposit_amount NOT BETWEEN 20000 AND 40000
GROUP BY
	magic_wand_creator
ORDER BY
	max_deposit_amount DESC
LIMIT 3

------------------------------------------------------

SELECT
	magic_wand_creator,
	MAX(deposit_amount) AS max_deposit_amount
FROM
	wizard_deposits
	
GROUP BY
	magic_wand_creator
HAVING
	-- MAX(deposit_amount) NOT BETWEEN 20000 AND 40000
	MAX(deposit_amount) < 20000
        OR
    MAX(deposit_amount) > 40000
ORDER BY
	max_deposit_amount DESC
LIMIT 3