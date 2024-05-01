SELECT
	user_id,
	AGE(starts_at, booked_at) AS early_bird
FROM bookings
WHERE AGE(starts_at, booked_at) >= INTERVAL '10 months' 