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

INSERT INTO main_reservations("Event_General_Type", "Event_Detail_Type", "Room_Type", "Time", "Comment")
    VALUES ('FIRM', 'FIRM_A', 'COMMON', now(), 'No comment'),
           ('FAMILY', 'FAMILY_B', 'SEPARATED', now(), 'N/A'),
           ('OTHERS', 'OTHERS_B', 'COMMON', now(), 'No comment');
