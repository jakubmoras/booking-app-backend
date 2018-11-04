DROP SCHEMA IF EXISTS "bookingapp" CASCADE;

CREATE SCHEMA "bookingapp" AUTHORIZATION web_client;

SET search_path TO 'bookingapp';

CREATE TYPE Event_General_Type AS ENUM ('FIRM', 'FAMILY', 'OTHERS');

CREATE TYPE Event_Detail_Type AS ENUM ('FIRM_A', 'FIRM_B', 'FAMILY_A', 'FAMILY_B', 'OTHERS_A', 'OTHERS_B');

CREATE TYPE Room_Type AS ENUM ('COMMON', 'SEPARATED');

CREATE TABLE main_reservations
(
  "Id" serial NOT NULL,
  "Event_General_Type" Event_General_Type,
  "Event_Detail_Type" Event_Detail_Type,
  "Room_Type" Room_Type,
  "Time" timestamp,
  "Comment" character varying(2000) COLLATE pg_catalog."default"
);

ALTER TABLE main_reservations
  ADD CONSTRAINT "main_reservations_PK" PRIMARY KEY ("Id");


CREATE TABLE bookingapp.dishes
(
  "Id" serial NOT NULL,
  "Restaurant_Id" bigint NOT NULL,
  "Category_Id" bigint NOT NULL,
  "Dish_Name" varchar(255) COLLATE pg_catalog."default",
  "Dish_Description" varchar(255) COLLATE pg_catalog."default",
  "Dish_Price" numeric(8,0),
  "Split_allowed" boolean,
  "Qty_on_plate" numeric,
  CONSTRAINT id PRIMARY KEY ("Id")
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE bookingapp.dishes
  OWNER to web_client;

INSERT INTO main_reservations("Event_General_Type", "Event_Detail_Type", "Room_Type", "Time", "Comment")
    VALUES ('FIRM', 'FIRM_A', 'COMMON', now(), 'No comment'),
           ('FAMILY', 'FAMILY_B', 'SEPARATED', now(), 'N/A'),
           ('OTHERS', 'OTHERS_B', 'COMMON', now(), 'No comment');

INSERT INTO bookingapp.dishes(
	 "Restaurant_Id", "Category_Id", "Dish_Name", "Dish_Description", "Dish_Price", "Split_allowed", "Qty_on_plate")
	VALUES ( 1, 1, 'Krewetki', 'Krewetki', 30, true, 3),
	       ( 1, 1, 'Tatar', 'Tatar', 20, true, 3),
	       ( 1, 1, 'Carpaccio', 'Carpaccio', 50, true, 3),
	       ( 1, 2, 'Potrawka z czegoś tam', 'Potrawka z czegoś tam', 120, false, 1),
	       ( 1, 2, 'Gulasz z czegoś ', 'Gulasz z czegoś ', 130, false, 1);

