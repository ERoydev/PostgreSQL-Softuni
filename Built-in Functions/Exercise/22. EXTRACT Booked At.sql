SELECT 
	EXTRACT('year' FROM booked_at) AS "YEAR",
	EXTRACT('month' FROM booked_at) AS "MONTH",
	EXTRACT('day' FROM booked_at) AS "DAY",
	EXTRACT('hour' FROM booked_at AT TIME ZONE 'UTC') AS "HOUR",
	EXTRACT('minute' FROM booked_at) AS "MINUTE",
	CEIL(EXTRACT('second' FROM booked_at)) AS "SECOND"

FROM 
	bookings