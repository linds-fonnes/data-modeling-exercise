-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE "medical_center" (
    "center_id" SERIAL PRIMARY KEY,
    "address" TEXT   NOT NULL,
    "phone_number" TEXT  NOT NULL
);

CREATE TABLE "doctor" (
    "doctor_id" SERIAL PRIMARY KEY,
    "center_id" INTEGER  REFERENCES medical_center ON DELETE SET NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "speciality" TEXT   NOT NULL
);

CREATE TABLE "patient" (
    "patient_id" SERIAL PRIMARY KEY,
    "doctor_id" INTEGER REFERENCES doctor ON DELETE SET NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "age" int   NOT NULL
);

CREATE TABLE "diagnosis" (
    "diagnosis_id" SERIAL PRIMARY KEY,
    "patient_id" INTEGER  REFERENCES patient ON DELETE CASCADE,
    "diagnosis_name" TEXT   NOT NULL
);

CREATE TABLE "visit"(
    "visit_id" SERIAL PRIMARY KEY,
    "patient_id" INTEGER REFERENCES patient ON DELETE CASCADE,
    "diagnosis_id" INTEGER  REFERENCES diagnosis ON DELETE CASCADE,
    "doctor_id" INTEGER REFERENCES doctor ON DELETE SET NULL
);



