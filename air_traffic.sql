-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE destination (
  id SERIAL PRIMARY KEY,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  arrival_time TIMESTAMP NOT NULL
);

CREATE TABLE departure (
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  departure_time TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger ON DELETE CASCADE,
  seat TEXT NOT NULL,
  airline TEXT NOT NULL,
  destination_id INTEGER REFERENCES destination ON DELETE CASCADE,
  departure_id INTEGER REFERENCES departure ON DELETE CASCADE
);

  INSERT INTO passenger(first_name, last_name)
  VALUES ('Charlotte','Webb');

  INSERT INTO destination(to_city, to_country,arrival_time)
  VALUES ('Chicago','United States','2019-02-06 16:29:00');

  INSERT INTO departure(from_city, from_country, departure_time)
  VALUES('Los Angeles','United States','2019-02-06 8:03:00');

  INSERT INTO tickets(passenger_id, seat, airline, destination_id, departure_id)
  VALUES(1, '12F', 'United', 1, 1);