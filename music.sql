-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT,
  birthdate DATE
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE performances (
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  venue TEXT NOT NULL,
  performance_date DATE NOT NULL
);

CREATE TABLE productions (
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES producers ON DELETE CASCADE,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  label TEXT NOT NULL
);

INSERT INTO producers(first_name)
VALUES ('Darkchild'),('The Matrix'),('Shellback');
INSERT INTO producers (first_name, last_name)
VALUES ('Benny','Blanco');

INSERT INTO artists(first_name,last_name, birthdate)
VALUES('Avril','Lavigne','1984-09-27');
INSERT INTO artists(first_name)
VALUES('Destiny''s Child'),('Maroon 5');

INSERT INTO songs(title, duration_in_seconds,release_date, album)
VALUES ('Say My Name', 240, '11-07-1999','The Writing''s on the Wall'),('Complicated',244,'05-14-2002', 'Let Go'), ('Moves Like Jagger', 201, '06-22-2011', 'Hands All Over');

INSERT INTO performances (song_id, venue, performance_date)
VALUES(1, 'Staples Arena','2001-08-08'),(2,'Big Venue','2005-09-09');

INSERT INTO productions (producer_id, song_id, label) VALUES (3, 3, 'A&M Octone'),(1,1,'Columbia');