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

 CREATE TABLE bookingapp.reservation_extras
 (
  "Id" serial NOT NULL,
  "Category" varchar(255) COLLATE pg_catalog."default" NOT NULL,
  "Description" varchar(255) COLLATE pg_catalog."default",
  "Picture" varchar(255),
  "Properties" jsonb,
  CONSTRAINT reservation_extras_pkey PRIMARY KEY ("Id")
 )
  WITH (
      OIDS = FALSE
  )
  TABLESPACE pg_default;

  ALTER TABLE bookingapp.reservation_extras
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

INSERT INTO bookingapp.reservation_extras(
	 "Category", "Description", "Picture")
	VALUES ('Visit Card','Visit Card 1','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 2','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 3','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 4','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 5','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 6','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 7','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 8','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 9','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 10','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 11','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 12','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 13','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 14','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 15','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 16','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 17','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 18','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 19','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 20','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 21','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 22','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 23','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 24','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 25','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 26','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 27','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 28','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 29','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 30','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 31','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 32','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 33','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 34','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 35','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 36','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 37','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 38','Images/napkin.jpeg'),
           ('Visit Card','Visit Card 39','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 40','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 41','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 42','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 43','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 44','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 45','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 46','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 47','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 48','Images/candle-table.jpeg'),
           ('Visit Card','Visit Card 49','Images/candle-table.jpeg'),
           ('Napkin','Napkin 1','Images/napkin.jpeg'),
           ('Napkin','Napkin 2','Images/napkin.jpeg'),
           ('Napkin','Napkin 3','Images/napkin.jpeg'),
           ('Napkin','Napkin 4','Images/napkin.jpeg'),
           ('Napkin','Napkin 5','Images/napkin.jpeg'),
           ('Napkin','Napkin 6','Images/napkin.jpeg'),
           ('Napkin','Napkin 7','Images/napkin.jpeg'),
           ('Napkin','Napkin 8','Images/napkin.jpeg'),
           ('Napkin','Napkin 9','Images/napkin.jpeg'),
           ('Napkin','Napkin 10','Images/napkin.jpeg'),
           ('Napkin','Napkin 11','Images/napkin.jpeg'),
           ('Napkin','Napkin 12','Images/napkin.jpeg'),
           ('Napkin','Napkin 13','Images/napkin.jpeg'),
           ('Napkin','Napkin 14','Images/napkin.jpeg'),
           ('Napkin','Napkin 15','Images/candle-table.jpeg'),
           ('Napkin','Napkin 16','Images/candle-table.jpeg'),
           ('Napkin','Napkin 17','Images/candle-table.jpeg'),
           ('Napkin','Napkin 18','Images/candle-table.jpeg'),
           ('Napkin','Napkin 19','Images/candle-table.jpeg'),
           ('Napkin','Napkin 20','Images/candle-table.jpeg'),
           ('Napkin','Napkin 21','Images/candle-table.jpeg'),
           ('Napkin','Napkin 22','Images/candle-table.jpeg'),
           ('Napkin','Napkin 23','Images/candle-table.jpeg'),
           ('Napkin','Napkin 24','Images/candle-table.jpeg'),
           ('Napkin','Napkin 25','Images/candle-table.jpeg'),
           ('Napkin','Napkin 26','Images/candle-table.jpeg'),
           ('Napkin','Napkin 27','Images/candle-table.jpeg'),
           ('Napkin','Napkin 28','Images/candle-table.jpeg'),
           ('Napkin','Napkin 29','Images/napkin.jpeg'),
           ('Napkin','Napkin 30','Images/napkin.jpeg'),
           ('Napkin','Napkin 31','Images/napkin.jpeg'),
           ('Napkin','Napkin 32','Images/napkin.jpeg'),
           ('Napkin','Napkin 33','Images/napkin.jpeg'),
           ('Napkin','Napkin 34','Images/napkin.jpeg'),
           ('Napkin','Napkin 35','Images/napkin.jpeg'),
           ('Napkin','Napkin 36','Images/napkin.jpeg'),
           ('Napkin','Napkin 37','Images/napkin.jpeg'),
           ('Napkin','Napkin 38','Images/napkin.jpeg'),
           ('Napkin','Napkin 39','Images/candle-table.jpeg'),
           ('Napkin','Napkin 40','Images/candle-table.jpeg'),
           ('Napkin','Napkin 41','Images/candle-table.jpeg'),
           ('Napkin','Napkin 42','Images/candle-table.jpeg'),
           ('Napkin','Napkin 43','Images/candle-table.jpeg'),
           ('Napkin','Napkin 44','Images/candle-table.jpeg'),
           ('Napkin','Napkin 45','Images/candle-table.jpeg'),
           ('Napkin','Napkin 46','Images/candle-table.jpeg'),
           ('Napkin','Napkin 47','Images/candle-table.jpeg'),
           ('Napkin','Napkin 48','Images/candle-table.jpeg'),
           ('Napkin','Napkin 49','Images/candle-table.jpeg');