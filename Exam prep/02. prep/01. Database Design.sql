CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(10) NOT NULL
);

CREATE TABLE clients (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drivers (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	age INT NOT NULL,
	rating NUMERIC(2) DEFAULT 5.5,

	CONSTRAINT ck_drivers_age_is_positive
		CHECK (age > 0)
);

CREATE TABLE cars (
	id SERIAL PRIMARY KEY,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20),
	year INT DEFAULT 0 NOT NULL,
	mileage INT DEFAULT 0,
	condition CHAR(1) NOT NULL,
	category_id INT REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,

	CONSTRAINT ck_cars_year_is_positive
		CHECK (year > 0),
	
	CONSTRAINT ck_cars_mileage_is_positive
		CHECK (mileage > 0)
);

CREATE TABLE courses (
	id SERIAL PRIMARY KEY,
	from_address_id INT REFERENCES addresses(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	start TIMESTAMP NOT NULL,
	bill NUMERIC(10, 2) DEFAULT 10, 
	car_id INT REFERENCES cars(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	client_id INT REFERENCES clients(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,

	CONSTRAINT ck_courses_bill_greater_than_ten
		CHECK (bill > 0)
);

CREATE TABLE cars_drivers (
	car_id INT REFERENCES cars(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	driver_id INT REFERENCES drivers(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);