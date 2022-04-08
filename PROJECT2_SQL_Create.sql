 /* CREATING TABLES */
  
  /* CUSTOMER TABLE */
  CREATE TABLE CUSTOMER
  (
    [CustID]           INTEGER      NOT NULL AUTO_INCREMENT,
    [Name]             VARCHAR(30)  NOT NULL, 
    [Phone]            VARCHAR(15)  NOT NULL,
    PRIMARY KEY([CustID])
  );
  
 /* VEHICLE TABLE */
  CREATE TABLE VEHICLE 
  (
    [VehicleID]       VARCHAR      NOT NULL,
    [Description]     VARCHAR(30)  NOT NULL,
    [Year]            INTEGER(4)   NOT NULL,
    [Type]            INTEGER(1)   NOT NULL, /* 1:Compact, 2:Medium, 3:Large, 4:SUV, 5:Truck, 6:VAN */
    [Category]        INTEGER      NOT NULL, /* 0:Basic, 1:Luxury */
    PRIMARY KEY([VehicleID]),
    FOREIGN KEY([Type]) REFERENCES [RATE] ([Type])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([Category]) REFERENCES [RATE] ([Category])
    ON DELETE NO ACTION ON UPDATE NO ACTION
  );

  /* RENTAL TABLE */
  CREATE TABLE RENTAL 
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
    FOREIGN KEY([CustID]) REFERENCES [CUSTOMER] ([CustID])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([VehicleID]) REFERENCES [VEHICLE] ([VehicleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([RentalType]) REFERENCES [RATE] ([Weekly])
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY([RentalType]) REFERENCES [RATE] ([Daily])
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

CREATE INDEX [IFK_Customer] ON [CUSTOMER] ([CustID]);
CREATE INDEX [IFK_Vehicle] ON [VEHICLE] ([VehicleID]);

/* ============================================================================================================================ */
/* POPULATING TABLES */

/* CUSTOMER DATA */
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(201,"A. Parks","(214) 555-0127");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(202,"S. Patel","(849) 811-6298");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(203,"A. Hernandez","(355) 572-5385");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(204,"G. Carver","(753) 763-8656");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(205,"Sh. Byers","(912) 925-5332");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(206,"L. Lutz","(931) 966-1775)";
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(207,"L. Bernal","(884) 727-0591");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(208,"I. Whyte","(811) 979-7345");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(209,"L. Lott","(954) 706-2219");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(210,"G. Clarkson","(309) 625-1838");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(211,"Sh. Dunlap","(604) 581-6642)";
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(212,"H. Gallegos","(961) 265-8638");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(213,"L. Perkins","(317) 996-3104");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(214,"M. Beach","(481) 422-0282");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(215,"C. Pearce","(599) 881-5189");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(216,"A. Hess","(516) 570-6411");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(217,"M. Lee","(369) 898-6162");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(218,"R. Booker","(730) 784-6303");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(219,"A. Crowther","(325) 783-4081");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(220,"H. Mahoney","(212) 262-8829");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(221,"J. Brown","(644) 756-0110");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(222,"H. Stokes","(931) 969-7317");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(223,"J. Reeves","(940) 981-5113");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(224,"A. Mcghee","(838) 610-5802");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(225,"L. Mullen","(798) 331-7777");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(226,"R. Armstrong","(325) 783-4081");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(227,"J. Greenaway","(212) 262-8829");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(228,"K. Kaiser Acosta","(228) 576-1557");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(229,"D. Kirkpatrick","(773) 696-8009");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(230,"A. Odonnell","(439) 536-8929");
INSERT INTO [CUSTOMER] ([CustID],[Name],[Phone]) VALUES(231,"K. Kay","(368) 336-5403");
                                                      

/* VEHICLE DATA */
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('19VDE1F3XEE414842',"Acura ILX",2014,1,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1FDEE3FL6EDA29122',"Ford E 350",2014,6,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1FDRF3B61FEA87469',"Ford Super Duty Pickup",2015,5,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1FTNF1CF2EKE54305',"Ford F Series Pickup",2014,5,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1G1JD5SB3E4240835',"Chevrolet Optra",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1GB3KZCG1EF117132',"Chevrolet Silverado",2014,5,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1HGCR2E3XEA305302',"Honda Accord",2014,2,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1N4AB7AP2EN855026',"Nissan Sentra",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1N6BA0EJ9EN516565',"Nissan Titan",2014,5,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1N6BF0KM0EN101134',"Nissan NV",2014,6,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('1VWCH7A3XEC037969',"Volkswagen Passat",2014,2,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('2HGFB2F94FH501940',"Honda Civic",2015,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('2T3DFREV0FW317743',"Toyota RAV4",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('3MZBM1L74EM109736',"Mazda 3",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('3N1CE2CP0FL409472',"Nissan Versa Note",2015,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('3N1CN7APXEK444458',"Nissan Versa",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('3VW2A7AU1FM012211',"Volkswagen Golf",2015,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('4S4BRCFC1E3203823',"Subaru Outback",2014,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('4S4BSBF39F3261064',"Subaru Outback",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('4S4BSELC0F3325370',"Subaru Outback",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5J6RM4H90FL028629',"Honda CR-V",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5N1AL0MM8EL549388',"Infiniti JX35",2014,4,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5NPDH4AE2FH565275',"Hyundai Elantra",2015,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5TDBKRFH4ES26D590',"Toyota Highlander",2014,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5XYKT4A75FG610224',"Kia Sorento",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5XYKU4A7XFG622415',"Kia Sorento",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('5XYKUDA77EG449709',"Kia Sorento",2014,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JF1GPAA61F8314971',"Subaru Impreza",2015,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JH4KC1F50EC800004',"Acura RLX",2014,3,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JH4KC1F56EC000095',"Acura RLX",2014,3,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JM1BM1V35E1210570',"Mazda 3",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JM3KE4DY4F0441471',"Mazda CX5",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JM3TB3DV0E0015742',"Mazda CX9",2014,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JN8AS5MV0FW760408',"Nissan Rogue Select",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTEZUEJR7E5081641',"Toyota 4Runner",2014,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTHBW1GG1F120DU53',"Lexus ES 300h",2015,2,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTHCE1BL3F151DE04',"Lexus GS 350",2015,2,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTHDL5EF9F5007221',"Lexus LS 460",2015,3,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTHFF2C26F135BX45',"Lexus IS 250C",2015,1,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTJHY7AX2F120EA11',"Lexus LX 570",2015,4,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTJJM7FX2E152CD75',"Lexus GX460",2014,4,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('JTMBFREV1FJ019885',"Toyota RAV4",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KM8SN4HF0FU107203',"Hyundai Santa Fe",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KMHJT3AF1FU028211',"Hyundai Tucson",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KMHTC6AD8EU998631',"Hyundai Veloster",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KNAFZ4A86E5195865',"KIA Sportage",2014,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KNAFZ4A86E5195895',"KIA Forte",2014,1,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KNAGN4AD2F5084324',"Kia Optima Hybrid",2015,2,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KNALN4D75E5A57351',"Kia Cadenza",2014,3,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KNALU4D42F6025717',"Kia K900",2015,3,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('KNDPCCA65F7791085',"KIA Sportage",2015,4,0);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('WA1LGAFE8ED001506',"Audi Q7",2014,4,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('WAU32AFD8FN005740',"Audi A8",2015,3,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('WAUTFAFH0E0010613',"Audi A5",2014,1,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('WBA3A9G51ENN73366',"BMW 3 Series",2014,1,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('WBAVL1C57EVR93286',"BMW X1",2014,4,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('WDCGG0EB0EG188709',"Mercedes_Benz GLK",2014,1,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('YV440MDD6F2617077',"Volvo XC60",2015,4,1);
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) VALUES ('YV4940NB5F1191453',"Volvo XC70",2015,4,1);

                                                      
/* RATE DATA */
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (1,0,480,80);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (1,1,600,100);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (2,0,530,90);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (2,1,660,110);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (3,0,600,100);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (3,1,710,120);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (4,0,685,115);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (4,1,800,135);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (5,0,780,130);
INSERT INTO [RATE] ([Type],[Category],[Weekly],[Daily]) VALUES (6,0,685,115);

                                                      
/* RENTAL DATA  */
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (203,'JM3KE4DY4F0441471','2019-09-09','2019-05-22',1,4,'2019-09-13',460,'2019-09-09');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'19VDE1F3XEE414842','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'JTHFF2C26F135BX45','2019-05-01','2019-04-15',7,1,'2019-05-08',600,'2019-05-08');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'JTHFF2C26F135BX45','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WAUTFAFH0E0010613','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WBA3A9G51ENN73366','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WBA3B9C59EP458859','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (210,'WDCGG0EB0EG188709','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (212,'19VDE1F3XEE414842','2019-06-10','2019-04-15',7,3,'2019-07-01',1800,'2019-06-10');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (216,'1N6BF0KM0EN101134','2019-08-02','2019-03-15',7,4,'2019-08-30',2740,'2019-08-02');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (216,'1N6BF0KM0EN101134','2019-08-30','2019-03-15',1,2,'2019-09-01',230,'2019-08-02');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'19VDE1F3XEE414842','2019-07-01','2019-06-12',7,1,'2019-07-08',600,'2019-07-01');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'19VDE1F3XEE414842','2019-07-09','2019-06-12',1,2,'2019-07-11',200,'2019-07-01');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'19VDE1F3XEE414842','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'JTHFF2C26F135BX45','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WAUTFAFH0E0010613','2019-07-01','2019-06-12',7,1,'2019-07-08',600,'2019-07-01');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WAUTFAFH0E0010613','2019-07-09','2019-06-12',1,2,'2019-07-11',200,'2019-07-01');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WAUTFAFH0E0010613','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WBA3A9G51ENN73366','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WBA3B9C59EP458859','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (221,'WDCGG0EB0EG188709','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL);
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (229,'19VDE1F3XEE414842','2019-05-06','2019-04-12',1,4,'2019-05-10',400,'2019-05-06');
INSERT INTO [RENTAL] ([CustID],[VehicleID],[StartDate],[OrderDate],[RentalType],[Qty],[ReturnDate],[TotalAmount],[PaymentDate]) VALUES (229,'WAUTFAFH0E0010613','2019-05-06','2019-04-12',1,4,'2019-05-10',400,'2019-05-06');

