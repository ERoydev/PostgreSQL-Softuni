SELECT
	b.booking_id,
	a.name AS apartment_owner,
	a.apartment_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
	bookings AS b
	FULL JOIN apartments AS a
	USING(booking_id)
		FULL JOIN customers AS C
		USING(customer_id)

ORDER BY
	booking_id ASC,
	apartment_owner ASC,
	customer_name ASC 