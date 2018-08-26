CREATE SCHEMA "bookingapp" AUTHORIZATION web_client;

CREATE TABLE "bookingapp"."main_reservations"
(
  "Id" serial NOT NULL,
  "Event_General_Type" bigint NOT NULL,
  "Event_Detail_Type" bigint NOT NULL,
  "Room_Type" bigint,
  "Comment" character varying(2000) COLLATE pg_catalog."default"
);

ALTER TABLE "bookingapp"."main_reservations"
  ADD CONSTRAINT "main_reservations_PK" PRIMARY KEY ("Id");

INSERT INTO "bookingapp"."main_reservations"("Event_General_Type", "Event_Detail_Type", "Room_Type", "Comment")
    VALUES (4, 1, 3, 2);
