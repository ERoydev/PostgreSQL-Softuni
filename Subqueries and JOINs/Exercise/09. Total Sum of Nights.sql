SELECT
	name,
	SUM(booked_for)
FROM
	apartments 
	JOIN bookings
	USING(apartment_id)
	
GROUP BY name
ORDER BY name ASC