CREATE TABLE bookings_calculation
AS SELECT
	booked_for
FROM 
	bookings
WHERE 
	apartment_id = 93;
	
ALTER TABLE bookings_calculation
ADD COLUMN multiplication NUMERIC,
ADD COLUMN modulo NUMERIC;

UPDATE bookings_calculation
SET 
	multiplication = booked_for * 50,
	modulo = booked_for % 50

----------------------
CREATE TABLE
	bookings_calculation
AS SELECT
	booked_for,
	CAST(booked_for * 50 AS NUMERIC) AS multiplication,
	CAST(booked_for % 50 AS NUMERIC) AS modulo
FROM 
	bookings
WHERE
	apartment_id = 93;