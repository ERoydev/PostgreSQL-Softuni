CREATE TABLE towns (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE stadiums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    capacity INT CHECK (capacity > 0) NOT NULL,
    town_id INT REFERENCES towns(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base INT DEFAULT 0 CHECK (fan_base >= 0) NOT NULL,
    stadium_id INT REFERENCES stadiums(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE coaches (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 CHECK (salary >= 0) NOT NULL,
    coach_level INT DEFAULT 0 CHECK (coach_level >= 0) NOT NULL
);

CREATE TABLE skills_data (
    id SERIAL PRIMARY KEY,
    dribbling INT DEFAULT 0 CHECK (dribbling >= 0),
    pace INT DEFAULT 0 CHECK (pace >= 0),
    passing INT DEFAULT 0 CHECK (passing >= 0),
    shooting INT DEFAULT 0 CHECK (shooting >= 0),
    speed INT DEFAULT 0 CHECK (speed >= 0),
    strength INT DEFAULT 0 CHECK (strength >= 0)
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT DEFAULT 0 CHECK (age >= 0) NOT NULL,
    position CHAR(1) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 CHECK (salary >= 0) NOT NULL,
    hire_date TIMESTAMP,
    skills_data_id INT REFERENCES skills_data(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    team_id INT REFERENCES teams(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE players_coaches (
    player_id INT REFERENCES players(id) ON DELETE CASCADE ON UPDATE CASCADE,
    coach_id INT REFERENCES coaches(id) ON DELETE CASCADE ON UPDATE CASCADE
);