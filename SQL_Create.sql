
/* Train Status */
Create Table TrainStatus
 (
   TrainDate           DATE           NOTNULL,
   TrainName           VARCHAR(50)    NOTNULL,
   PremSeatsOpen       INT            NOTNULL,
   GenSeatsOpen        INT            NOTNULL,
   PremSeatsOccupied   INT            NOTNULL,
   GenSeatsOccupied    INT            NOTNULL,
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES()
 );

/*data for train status*/
INSERT INTO [TrainStatus]([TrainDate],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(19/02/2022,"Orient Express",10,10,0,0)
INSERT INTO [TrainStatus]([TrainDate],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(20/02/2022,"Flying Scottsman",8,5,2,5)
INSERT INTO [TrainStatus]([TrainDate],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(21/02/2022,"Guwahati Express",7,6,3,4)
INSERT INTO [TrainStatus]([TrainDate],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(21/02/2022,"Golden Chariot",6,3,4,7)

/* Train table */
Create Table Train
  (
   TrainNumber       INT         NOTNULL,
   TrainName         VARCHAR(15) NOTNULL,
   TrainSource       VARCHAR(15) NOTNULL,
   TrainDestination  VARCHAR(15) NOTNULL,
   PremiumFare       INT
   GeneralFare       INT
   Schedule          VARCHAR(50)
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES()
  );

/*data for train */
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(1,"Orient Express","Paris","Istanbul",800,600,"Weekdays")
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(2,"Flying Scotsman","Edinburgh","London",4000,3500,"Friday,Saturday,Sunday")
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(3,"Golden Arrow","Victoria","Dover",980,860,"Monday,Tuesday,Wednesday")
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(4,"Golden Chariot","Bangalore","Goa",4300,3800,"Saturday,Sunday")
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(5,"Maharaja Express","Delhi","Mumbai",5980,4510,"Wednesday,Thursday,Friday")



/*Passenger table*/
Create Table Passenger
  (
   PassengerName      VARCHAR(30)  NOTNULL,
   PassengerAge       INT          NOTNULL,
   PassengerAddress   VARCHAR(100) NOTNULL,
   PassengerSSN       INT(9)       NOTNULL,
   PRIMARY KEY(),
   UNIQUE(),
   FOREIGN KEY(), REFERENCES()
 );

/*data for Passenger */
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("James	Butt",53,"6649 N Blue Gum St, New Orleans",264816896)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Josephine	Darakjy",46,"4 B Blue Ridge Blvd, Brighton",240471168)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Art	Venere",39,"8 W Cerritos Ave #54, Bridgeport",285200976)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Lenna	Paprocki",43,"639 Main St, Anchorage",309323096)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Donette	Foller",31,"34 Center St, Hamilton",272610795)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Simona Morasca",27,"3 Mcauley Dr, Ashland",250951162)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Mitsue Tollner",37,"7 Eads St, Chicago",272913578)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Leota	Dilliard",30,"7 W Jackson Blvd, San Jose",268682534)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Sage	Wieser",39,"5 Boston Ave #88, Sioux Falls",310908858)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Kris	Marrier",65,"228 Runamuck Pl #2808,Baltimore",322273872)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Minna	Amigon",26,"2371 Jerrold Ave, Kulpsville",256558303)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Abel	Maclead",61,"37275 St  Rt 17m M, Middle Island",302548590)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Kiley	Caldarera",40,"25 E 75th St #69, Los Angeles",284965676)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Graciela	Ruta",41,"98 Connecticut Ave Nw, Chagrin Falls",277292710)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Cammy	Albares",65,"56 E Morehead St, Laredo",331160133)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Mattie	Poquette",26,"73 State Road 434 E, Phoenix",331293204)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Meaghan	Garufi",61,"69734 E Carrillo St, Mc Minnville",290123298)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Gladys	Rim",30,"322 New Horizon Blvd, Milwaukee",286411536)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Yuki	Whobrey",36,"1 State Route 27, Taylor",294860856)
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Fletcher	Flosi",60,"394 Manchester Blvd, Rockford",317434088)



/* Ticket */
Create Table Ticket
  (
    PassengerSSN   INT(9)        NOTNULL,
    TrainNumber    INT   NOTNULL,
    TicketType     VARCHAR(10)   NOTNULL,
    TicketStatus   VARCHAR(10)  NOTNULL,
    PRIMARY KEY(),
    UNIQUE(),
    FOREIGN KEY(), REFERENCES()
  );

/*data for Ticket */
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(264816896,3,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(240471168,2,"General","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(285200976,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(285200976,2,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(317434088,2,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(310908858,2,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(322273872,2,"General","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(256558303,3,"Premium","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(302548590,2,"General","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(284965676,3,"Premium","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(277292710,3,"General","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331160133,3,"General","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331293204,3,"General","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(290123298,3,"General","WaitList")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(286411536,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(294860856,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(317434088,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(310908858,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(322273872,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(256558303,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(302548590,4,"Premium","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(284965676,4,"General","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(277292710,4,"General","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331160133,4,"General","Booked")
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331293204,4,"General","Booked")