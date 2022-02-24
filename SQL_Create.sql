/* CREATING TABLES */

/* TRAIN TABLE */
CREATE TABLE Train
  (
   [TrainNumber]       INTEGER      NOT NULL,
   [TrainName]         VARCHAR(30)  NOT NULL,
   [TrainSource]       VARCHAR(30)  NOT NULL,
   [TrainDestination]  VARCHAR(30)  NOT NULL,
   [PremiumFare]       INTEGER,
   [GeneralFare]       INTEGER,
   [Schedule]          VARCHAR(50),
   PRIMARY KEY([TrainName])
  );


/* PASSENGER TABLE */
CREATE TABLE Passenger
  (
   [PassengerName]      VARCHAR(30)   NOT NULL,
   [PassengerAge]       INTEGER       NOT NULL,
   [PassengerAddress]   VARCHAR(100)  NOT NULL,
   [PassengerSSN]       INTEGER(9)    NOT NULL,
   PRIMARY KEY([PassengerSSN])
 );


/* TRAIN STATUS TABLE */
CREATE TABLE TrainStatus
 (
   [TrainDate]           DATE           NOT NULL,
   [TrainName]           VARCHAR(50)    NOT NULL,
   [PremSeatsOpen]       INTEGER        NOT NULL,
   [GenSeatsOpen]        INTEGER        NOT NULL,
   [PremSeatsOccupied]   INTEGER        NOT NULL,
   [GenSeatsOccupied]    INTEGER        NOT NULL,
   FOREIGN KEY([TrainName]) REFERENCES [Train] ([TrainName])
   ON DELETE NO ACTION ON UPDATE NO ACTION
 );
 

/* TICKET TABLE */
CREATE TABLE Ticket
  (
    [PassengerSSN]   INTEGER(9)    NOT NULL,
    [TrainNumber]    INTEGER       NOT NULL,
    [TicketType]     VARCHAR(10)   NOT NULL,
    [TicketStatus]   VARCHAR(10)   NOT NULL,
    FOREIGN KEY([TrainNumber]) REFERENCES [Train] ([TrainNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([PassengerSSN]) REFERENCES [Passenger] ([PassengerSSN])
    ON DELETE NO ACTION ON UPDATE NO ACTION
  );
  
/* ============================================================================================================================ */
/* CREATING FOREIGN KEY INDEXES */

CREATE INDEX [IFK_StatusOfTrain] ON [Train] ([TrainName]);
CREATE INDEX [IFK_TrainTickets] ON [Train] ([TrainNumber]);
CREATE INDEX [IFK_PassengerTicket] ON [Passenger] ([PassengerSSN]);


/* ============================================================================================================================ */
/* POPULATING TABLES */


/* PASSENGER DATA */
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("James Butt",53,"6649 N Blue Gum St, New Orleans",264816896);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Josephine Darakjy",46,"4 B Blue Ridge Blvd, Brighton",240471168);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Art Venere",39,"8 W Cerritos Ave #54, Bridgeport",285200976);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Lenna Paprocki",43,"639 Main St, Anchorage",309323096);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Donette Foller",31,"34 Center St, Hamilton",272610795);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Simona Morasca",27,"3 Mcauley Dr, Ashland",250951162);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Mitsue Tollner",37,"7 Eads St, Chicago",272913578);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Leota Dilliard",30,"7 W Jackson Blvd, San Jose",268682534);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Sage Wieser",39,"5 Boston Ave #88, Sioux Falls",310908858);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Kris Marrier",65,"228 Runamuck Pl #2808,Baltimore",322273872);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Minna Amigon",26,"2371 Jerrold Ave, Kulpsville",256558303);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Abel Maclead",61,"37275 St  Rt 17m M, Middle Island",302548590);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Kiley Caldarera",40,"25 E 75th St #69, Los Angeles",284965676);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Graciela Ruta",41,"98 Connecticut Ave Nw, Chagrin Falls",277292710);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Cammy Albares",65,"56 E Morehead St, Laredo",331160133);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Mattie Poquette",26,"73 State Road 434 E, Phoenix",331293204);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Meaghan Garufi",61,"69734 E Carrillo St, Mc Minnville",290123298);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Gladys Rim",30,"322 New Horizon Blvd, Milwaukee",286411536);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Yuki Whobrey",36,"1 State Route 27, Taylor",294860856);
  INSERT INTO [Passenger]([PassengerName],[PassengerAge],[PassengerAddress],[PassengerSSN]) VALUES("Fletcher Flosi",60,"394 Manchester Blvd, Rockford",317434088);
  
  

/* TRAIN DATA */
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(1,"Orient Express","Paris","Istanbul",800,600,"Weekdays");
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(2,"Flying Scotsman","Edinburgh","London",4000,3500,"Friday,Saturday,Sunday");
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(3,"Golden Arrow","Victoria","Dover",980,860,"Monday,Tuesday,Wednesday");
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(4,"Golden Chariot","Bangalore","Goa",4300,3800,"Saturday,Sunday");
  INSERT INTO [Train]([TrainNumber],[TrainName],[TrainSource],[TrainDestination],[PremiumFare],[GeneralFare],[Schedule]) VALUES(5,"Maharaja Express","Delhi","Mumbai",5980,4510,"Wednesday,Thursday,Friday");
  
  
  
/* TRAIN STATUS DATA */
  INSERT INTO [TrainStatus]([TrainDate],[TrainName],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(19/02/2022,"Orient Express",10,10,0,0);
  INSERT INTO [TrainStatus]([TrainDate],[TrainName],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(20/02/2022,"Flying Scottsman",8,5,2,5);
  INSERT INTO [TrainStatus]([TrainDate],[TrainName],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(21/02/2022,"Guwahati Express",7,6,3,4);
  INSERT INTO [TrainStatus]([TrainDate],[TrainName],[PremSeatsOpen],[GenSeatsOpen],[PremSeatsOccupied],[GenSeatsOccupied]) VALUES(21/02/2022,"Golden Chariot",6,3,4,7);
  
  
  
/* TICKET DATA */
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(264816896,3,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(240471168,2,"General","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(285200976,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(285200976,2,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(317434088,2,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(310908858,2,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(322273872,2,"General","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(256558303,3,"Premium","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(302548590,2,"General","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(284965676,3,"Premium","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(277292710,3,"General","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331160133,3,"General","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331293204,3,"General","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(290123298,3,"General","WaitList");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(286411536,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(294860856,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(317434088,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(310908858,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(322273872,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(256558303,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(302548590,4,"Premium","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(284965676,4,"General","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(277292710,4,"General","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331160133,4,"General","Booked");
   INSERT INTO [Ticket]([PassengerSSN],[TrainNumber],[TicketType],[TicketStatus]) VALUES(331293204,4,"General","Booked");
