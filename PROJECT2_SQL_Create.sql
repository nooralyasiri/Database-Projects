  /* CREATING TABLES */
  
  /* CUSTOMER TABLE */
  CREATE TABLE Customer 
  (
    [CustID]           INTEGER      NOT NULL,
    [Name]             VARCHAR(30)  NOT NULL, /* INTEGER(10)?...given we assume no -'s, just a standard #? */
    [Phone]            VARCHAR(10)  NOT NULL,
    PRIMARY KEY([CustID])
  );

  /* RENTAL TABLE */
  CREATE TABLE Rental 
  (
    [CustID]           INTEGER      NOT NULL,
    [VehicleID]        INTEGER      NOT NULL,
    [StartDate]        DATE         NOT NULL,
    [OrderDate]        DATE         NOT NULL,
    [RentalType]       INTEGER      NOT NULL, /* 1 for daily, 7 for weekly */
    [Qty]              INTEGER      NOT NULL,
    [ReturnDate]       DATE         NOT NULL,
    [TotalAmount]      INTEGER      NOT NULL,
    [PaymentDate]      DATE         NOT NULL,
    FOREIGN KEY([CustID]) REFERENCES [Customer] ([CustID])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([VehicleID]) REFERENCES [Vehicle] ([VehicleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION,

    /* not sure about this at all, but given daily and weekly in the Rate table, do we tie them together
       or are we to assume they will hold different values/serve different purposes? */
    FOREIGN KEY([RentalType]) REFERENCES [Rate] ([Weekly])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([RentalType]) REFERENCES [Rate] ([Daily])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  );

  /* VEHICLE TABLE */
  CREATE TABLE Vehicle 
  (
    [VehicleID]       INTEGER      NOT NULL,
    [Description]     VARCHAR(30)  NOT NULL, /* not too sure what it's asking for here...*/
    [Year]            INTEGER(4)   NOT NULL,
    [Type]            INTEGER(1)   NOT NULL, /* 1:Compact, 2:Medium, 3:Large, 4:SUV, 5:Truck, 6:VAN */
    [Category]        BOOLEAN      NOT NULL, /* 0:Basic, 1:Luxury */
    PRIMARY KEY([VehicleID]),
    FOREIGN KEY([Type]) REFERENCES [Rate] ([Type])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([Category]) REFERENCES [Rate] ([Category])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  );

  /* RATE TABLE */
  CREATE TABLE RATE
  (
    [Type]            INTEGER(1)   NOT NULL, /* 1:Compact, 2:Medium, 3:Large, 4:SUV, 5:Truck, 6:VAN */
    [Category]        BOOLEAN      NOT NULL, /* 0:Basic, 1:Luxury */
    [Weekly]          INTEGER(1)   NOT NULL, /* 7 for weekly */
    [Daily]           INTEGER(1)   NOT NULL, /* 1 for daily */
  );

/* ============================================================================================================================ */

/* note: i put not null for everything just to be safe for the time being lol but we can change it up! 4/8/22 */
