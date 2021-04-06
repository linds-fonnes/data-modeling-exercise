DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE "region"(
    "region_id" SERIAL PRIMARY KEY,
    "region_name" TEXT NOT NULL
);

CREATE TABLE "users"(
    "user_id" SERIAL PRIMARY KEY,
    "username" TEXT NOT NULL UNIQUE,
    "preferred_region" INTEGER REFERENCES region ON DELETE SET NULL
);

CREATE TABLE "posts"(
    "post_id" SERIAL PRIMARY KEY,
    "title" VARCHAR(15) NOT NULL,
    "text" TEXT NOT NULL,
    "user_id" INTEGER REFERENCES users ON DELETE CASCADE,
    "region_id" INTEGER REFERENCES region ON DELETE SET NULL,
    "category" TEXT NOT NULL
);