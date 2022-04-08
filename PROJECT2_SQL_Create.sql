 /* CREATING TABLES */
  
  /* CUSTOMER TABLE */
  CREATE TABLE Customer 
  (
    [CustID]           INTEGER      NOT NULL AUTO_INCREMENT,
    [Name]             VARCHAR(30)  NOT NULL, 
    [Phone]            VARCHAR(15)  NOT NULL,
    PRIMARY KEY([CustID])
  );
  
 /* VEHICLE TABLE */
  CREATE TABLE Vehicle 
  (
    [VehicleID]       VARCHAR      NOT NULL,
    [Description]     VARCHAR(30)  NOT NULL,
    [Year]            INTEGER(4)   NOT NULL,
    [Type]            INTEGER(1)   NOT NULL, /* 1:Compact, 2:Medium, 3:Large, 4:SUV, 5:Truck, 6:VAN */
    [Category]        INTEGER      NOT NULL, /* 0:Basic, 1:Luxury */
    PRIMARY KEY([VehicleID]),
    FOREIGN KEY([Type]) REFERENCES [Rate] ([Type])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([Category]) REFERENCES [Rate] ([Category])
    ON DELETE NO ACTION ON UPDATE NO ACTION
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
    [PaymentDate]      DATE,
    FOREIGN KEY([CustID]) REFERENCES [Customer] ([CustID])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([VehicleID]) REFERENCES [Vehicle] ([VehicleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION,

    /* not sure about this at all, but given daily and weekly in the Rate table, do we tie them together
       or are we to assume they will hold different values/serve different purposes? */
    FOREIGN KEY([RentalType]) REFERENCES [Rate] ([Weekly])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([RentalType]) REFERENCES [Rate] ([Daily])
    ON DELETE NO ACTION ON UPDATE NO ACTION
  );

  /* RATE TABLE */
  CREATE TABLE RATE
  (
    [Type]            INTEGER(1)   NOT NULL, /* 1:Compact, 2:Medium, 3:Large, 4:SUV, 5:Truck, 6:VAN */
    [Category]        INTEGER      NOT NULL, /* 0:Basic, 1:Luxury */
    [Weekly]          INTEGER(1)   NOT NULL, /* 7 for weekly */
    [Daily]           INTEGER(1)   NOT NULL /* 1 for daily */
  );

/* ============================================================================================================================ */
/* FOREIGN KEY INDEXES */

CREATE INDEX [IFK_Customer] ON [Customer] ([CustID]);
CREATE INDEX [IFK_Vehicle] ON [Vehicle] ([VehicleID]);

/* ============================================================================================================================ */
/* POPULATING TABLES */

/* CUSTOMER DATA */


/* VEHICLE DATA */


/* RATE DATA */
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (1,0,480,80);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (1,1,600,100);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (2,0,530,90);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (2,1,660,110);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (3,0,600,100);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (3,1,710,120);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (4,0,685,115);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (4,1,800,135);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (5,0,780,130);
INSERT INTO [Rate] ([Type],[Category],[Weekly],[Daily]) VALUES (6,0,685,115);

/* RENTAL DATA  */
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (203,'JM3KE4DY4F0441471','2019-09-09','2019-05-22',1,4,'2019-09-13',460,'2019-09-09');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'19VDE1F3XEE414842','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'JTHFF2C26F135BX45','2019-05-01','2019-04-15',7,1,'2019-05-08',600,'2019-05-08');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'JTHFF2C26F135BX45','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WAUTFAFH0E0010613','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WBA3A9G51ENN73366','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WBA3B9C59EP458859','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WDCGG0EB0EG188709','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (212,'19VDE1F3XEE414842','2019-06-10','2019-04-15',7,3,'2019-07-01',1800,'2019-06-10');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (216,'1N6BF0KM0EN101134','2019-08-02','2019-03-15',7,4,'2019-08-30',2740,'2019-08-02');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (216,'1N6BF0KM0EN101134','2019-08-30','2019-03-15',1,2,'2019-09-01',230,'2019-08-02');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'19VDE1F3XEE414842','2019-07-01','2019-06-12',7,1,'2019-07-08',600,'2019-07-01');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'19VDE1F3XEE414842','2019-07-09','2019-06-12',1,2,'2019-07-11',200,'2019-07-01');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'19VDE1F3XEE414842','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'JTHFF2C26F135BX45','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WAUTFAFH0E0010613','2019-07-01','2019-06-12',7,1,'2019-07-08',600,'2019-07-01');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WAUTFAFH0E0010613','2019-07-09','2019-06-12',1,2,'2019-07-11',200,'2019-07-01');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WAUTFAFH0E0010613','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WBA3A9G51ENN73366','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WBA3B9C59EP458859','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WDCGG0EB0EG188709','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (229,'19VDE1F3XEE414842','2019-05-06','2019-04-12',1,4,'2019-05-10',400,'2019-05-06');
INSERT INTO [Rental] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (229,'WAUTFAFH0E0010613','2019-05-06','2019-04-12',1,4,'2019-05-10',400,'2019-05-06');

