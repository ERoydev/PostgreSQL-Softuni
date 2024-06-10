SELECT
	a.name,
	EXTRACT('YEAR' FROM a.birthdate) AS birth_year,
	tp.animal_type
FROM
	animals AS a
	JOIN animal_types AS tp
	ON a.animal_type_id = tp.id

WHERE 
	a.owner_id IS NULL AND a.birthdate > '01/01/2022'::DATE -  INTERVAL '5 years' AND animal_type <> 'Birds'

ORDER BY a.name ASC;

-- Drug nachin s izpolzvane na AGE(edna, vtora data) namira razlikata mejdu dve dati
SELECT
	a.name,
	EXTRACT('YEAR' FROM a.birthdate) AS birth_year,
	tp.animal_type
FROM
	animals AS a
	JOIN animal_types AS tp
	ON a.animal_type_id = tp.id

WHERE 
	a.owner_id IS NULL AND animal_type <> 'Birds' AND AGE('01/01/2022', birthdate) < '5 year'

ORDER BY a.name ASC;

