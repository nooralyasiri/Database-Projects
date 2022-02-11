/*Train table*/
Create Table Train
  (
   T_number       INT         NOTNULL,
   T_name         VARCHAR(15) NOTNULL,
   T_source       VARCHAR(15) NOTNULL,
   T_destination  VARCHAR(15) NOTNULL,
   T_P_tickets    INT
   T_G_tickets    INT
   T_weekdays     VARCHAR(15)
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES());
  )

/*Passenger table*/
Create Table Passenger
  (
   P_name      VARCHAR(15) NOTNULL,
   P_age       INT         NOTNULL,
   P_address   VARCHAR(15) NOTNULL,
   P_status    VARCHAR(1)  NOTNULL,
   P_catergory VARCHAR(1)  NOTNULL,
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES());
  )

/* Ticket */
Create Table Ticket
  (
    Ti_P    DOUBLE(1,1)   NOTNULL,
    Ti_g    DOUBLE(1,1)   NOTNULL,
    Ti_max  INT           
    Ti_wait INT
    PRIMARY KEY(),
    UNIQUE(),
    FOREIGN KEY(), REFERENCES());
  )

/* Train Status */
Create Table Train_Status
(
   S_date      DATE    NOTNULL,
   S_nSeats    INT     NOTNULL,
   S_nOccupied INT     NOTNULL,
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES());
)
