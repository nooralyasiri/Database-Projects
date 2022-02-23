
/* Train Status */
Create Table Train_Status
 (
   S_date       DATE    NOTNULL,
   S_trainName  VARCHAR(50)    NOTNULL,
   S_nSeatsP    INT     NOTNULL,
   S_nOccupiedP INT     NOTNULL,
   S_nSeatsG    INT     NOTNULL,
   S_nOccupiedG INT     NOTNULL,
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES()
 );

/*data for train status*/
INSERT INTO [Train_Status]([S_date],[S_nSeatsP],[S_nOccupiedP],[S_nSeatsG],[S_nOccupiedG]) VALUES(19/02/2022,"Orient Express",10,10,0,0)
INSERT INTO [Train_Status]([S_date],[S_nSeatsP],[S_nOccupiedP],[S_nSeatsG],[S_nOccupiedG]) VALUES(20/02/2022,"Flying Scottsman",8,5,2,5)
INSERT INTO [Train_Status]([S_date],[S_nSeatsP],[S_nOccupiedP],[S_nSeatsG],[S_nOccupiedG]) VALUES(21/02/2022,"Guwahati Express",7,6,3,4)
INSERT INTO [Train_Status]([S_date],[S_nSeatsP],[S_nOccupiedP],[S_nSeatsG],[S_nOccupiedG]) VALUES(21/02/2022,"Golden Chariot",6,3,4,7)

/* Train table */
Create Table Train
  (
   T_number       INT         NOTNULL,
   T_name         VARCHAR(15) NOTNULL,
   T_source       VARCHAR(15) NOTNULL,
   T_destination  VARCHAR(15) NOTNULL,
   T_P_fair       INT
   T_G_fair       INT
   T_availability VARCHAR(50)
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES()
  );

/*data for train */
  INSERT INTO [Train]([T_number],[T_name],[T_source],[T_destination],[T_P_fair],[T_G_fair],[T_weekdays]) VALUES(1,"Orient Express","Paris","Istanbul",800,600,"Weekdays")
  INSERT INTO [Train]([T_number],[T_name],[T_source],[T_destination],[T_P_fair],[T_G_fair],[T_weekdays]) VALUES(2,"Flying Scotsman","Edinburgh","London",4000,3500,"Friday,Saturday,Sunday")
  INSERT INTO [Train]([T_number],[T_name],[T_source],[T_destination],[T_P_fair],[T_G_fair],[T_weekdays]) VALUES(3,"Golden Arrow","Victoria","Dover",980,860,"Monday,Tuesday,Wednesday")
  INSERT INTO [Train]([T_number],[T_name],[T_source],[T_destination],[T_P_fair],[T_G_fair],[T_weekdays]) VALUES(4,"Golden Chariot","Bangalore","Goa",4300,3800,"Saturday,Sunday")
  INSERT INTO [Train]([T_number],[T_name],[T_source],[T_destination],[T_P_fair],[T_G_fair],[T_weekdays]) VALUES(5,"Maharaja Express","Delhi","Mumbai",5980,4510,"Wednesday,Thursday,Friday")



/*Passenger table*/
Create Table Passenger
  (
   P_name      VARCHAR(30) NOTNULL,
   P_age       INT         NOTNULL,
   P_address   VARCHAR(100) NOTNULL,
   P_ssn       INT(9)      NOTNULL,
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES()
 );

/*data for Passenger */
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("James	Butt",53,"6649 N Blue Gum St,New Orleans",264816896)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Josephine	Darakjy",46,"4 B Blue Ridge Blvd,Brighton",240471168)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Art	Venere",39,"8 W Cerritos Ave #54,Bridgeport",285200976)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Lenna	Paprocki",43,"639 Main St,Anchorage",309323096)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Donette	Foller",31,"34 Center St,Hamilton",272610795)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Simona Morasca",27,"3 Mcauley Dr,Ashland",250951162)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Mitsue Tollner",37,"7 Eads St,Chicago",272913578)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Leota	Dilliard",30,"7 W Jackson Blvd,San Jose",268682534)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Sage	Wieser",39,"5 Boston Ave #88,Sioux Falls",310908858)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Kris	Marrier",65,"228 Runamuck Pl #2808,Baltimore",322273872)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Minna	Amigon",26,"2371 Jerrold Ave,Kulpsville",256558303)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Abel	Maclead",61,"37275 St  Rt 17m M,Middle Island",302548590)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Kiley	Caldarera",40,"25 E 75th St #69,Los Angeles",284965676)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Graciela	Ruta",41,"98 Connecticut Ave Nw,Chagrin Falls",277292710)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Cammy	Albares",65,"56 E Morehead St,Laredo",331160133)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Mattie	Poquette",26,"73 State Road 434 E,Phoenix",331293204)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Meaghan	Garufi",61,"69734 E Carrillo St,Mc Minnville",290123298)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Gladys	Rim",30,"322 New Horizon Blvd,Milwaukee",286411536)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Yuki	Whobrey",36,"1 State Route 27,Taylor",294860856)
  INSERT INTO [Passenger]([P_name],[P_age],[P_address],[P_ssn]) VALUES("Fletcher	Flosi",60,"394 Manchester Blvd,Rockford",317434088)



/* Ticket */
Create Table Ticket
  (
    Ti_ssn   INT(9)        NOTNULL,
    Ti_train_number  INT   NOTNULL,
    Ti_type     VARCHAR(10)   NOTNULL,
    Ti_status   VARCHAR(10)  NOTNULL,
    PRIMARY KEY(),
    UNIQUE(),
    FOREIGN KEY(), REFERENCES()
  );

/*data for Ticket */
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(264816896,3,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(240471168,2,"General","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(285200976,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(285200976,2,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(317434088,2,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(310908858,2,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(322273872,2,"General","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(256558303,3,"Premium","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(302548590,2,"General","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(284965676,3,"Premium","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(277292710,3,"General","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(331160133,3,"General","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(331293204,3,"General","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(290123298,3,"General","WaitList")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(286411536,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(294860856,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(317434088,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(310908858,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(322273872,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(256558303,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(302548590,4,"Premium","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(284965676,4,"General","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(277292710,4,"General","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(331160133,4,"General","Booked")
   INSERT INTO [Ticket]([Ti_ssn],[Ti_],[Ti_G],[Ti_status]) VALUES(331293204,4,"General","Booked")
