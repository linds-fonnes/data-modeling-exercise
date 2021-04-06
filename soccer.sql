DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE "teams"(
    "team_id" SERIAL PRIMARY KEY,
    "team_name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "players"(
    "player_id" SERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "height" TEXT,
    "weight" INTEGER,
    "team_id" INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE "referees"(
    "ref_id" SERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT
);

CREATE TABLE "seasons"(
    "season_id" SERIAL PRIMARY KEY,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);

CREATE TABLE "games"(
    "game_id" SERIAL PRIMARY KEY,
    "stadium" TEXT NOT NULL,
    "home_team_id" INTEGER REFERENCES teams ON DELETE SET NULL,
    "away_team_id" INTEGER REFERENCES teams ON DELETE SET NULL,
    "referee_id" INTEGER REFERENCES referees ON DELETE SET NULL,
    "date" DATE,
    "season_id" INTEGER REFERENCES seasons ON DELETE SET NULL
);

CREATE TABLE "goals"(
    "goal_id" SERIAL PRIMARY KEY,
    "player_id" INTEGER REFERENCES players ON DELETE CASCADE,
    "game_id" INTEGER REFERENCES games ON DELETE CASCADE
);

CREATE TABLE "rankings"(
    "rank_id" SERIAL PRIMARY KEY,
    "team_id" INTEGER REFERENCES teams ON DELETE CASCADE,
    "season_id" INTEGER REFERENCES seasons ON DELETE SET NULL,
    "rank" INTEGER NOT NULL
);
