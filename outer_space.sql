-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_planet INTEGER REFERENCES planets
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planets TEXT[] NOT NULL
);


  INSERT INTO planets (name, orbital_period_in_years, orbits_around)
  VALUES
  ('Earth',1.00,'The Sun'),
  ('Mars',1.88,'The Sun'),
  ('Neptune', 164.8,'The Sun'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
  ('Gliese 876 b', 0.23, 'Gliese 876');

  INSERT INTO moons (name, orbits_planet)
  VALUES
  ('The Moon', 1),
  ('Phobos',2),
  ('Deimos',2),
  ('Neso', 3);

  INSERT INTO galaxy (name, planets)
  VALUES
  ('The Milky Way', '{"Earth","Venus","Mercury","Mars","Neptune","Jupiter","Uranus","Pluto","Saturn"}');