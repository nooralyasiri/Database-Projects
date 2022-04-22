-- Q1
ALTER TABLE RENTAL
  ADD Returned INT;

UPDATE RENTAL
SET Returned = 1
WHERE PaymentDate IS NOT NULL;

UPDATE RENTAL
SET Returned = 0
WHERE PaymentDate IS NULL;

---- Needs testing ----

--Q2
CREATE VIEW vRentalInfo
AS
SELECT 
  OrderDate, 
  StartDate, -- in an ascending order  
  ReturnDate, 
  JULIANDAY(R.returnDate) - JULIANDAY(R.startDate) AS 'TotalDays',
  	--Total Days per Rental as TotalDays, -- you need to change weeks to days  
  Vehicle’s ID as VIN, 
  Vehicle’s Description as Vehicle,
  Vehicle’s Type as Type, --you need to use the description of the type  
  CASE
	WHEN Type = '1' THEN 'Compact'
	WHEN Type = '2' THEN 'Medium'
	WHEN Type = '3' THEN 'Large'
	WHEN Type = '4' THEN 'SUV'
	WHEN Type = '5' THEN 'Truck'
	WHEN Type = '6' THEN 'VAN'
  END AS Type,
  Vehicle’s Category as Category, --you need to use the description of the category  
  CASE
    WHEN Category = '0' THEN 'Basic'
    WHEN Category = '1' THEN 'Luxury'
  END AS Category,
  Customer’s ID as CustomerID,  
  Customer’s Name as CustomerName,  
  Order Total Amount as OrderAmount,  
  Order Remaining Amount as RentalBalance
FROM
  RENTAL
WHERE
  V.Type = T.Type
  AND V.Category = T.Category
  ORDER BY StartDate ASC, R.StartDate;
 
 ----Needs editing----
 
 CREATE VIEW vRentalInfo
AS
SELECT 
  OrderDate, 
  StartDate, -- in an ascending order  
  ReturnDate, 
  Total Days per Rental as TotalDays, -- you need to change weeks to days  
  VehicleID as VIN, 
  Description as Vehicle,

  Type, --you need to use the description of the type  
  CASE
		WHEN Type = '1' THEN 'Compact'
		WHEN Type = '2' THEN 'Medium'
		WHEN Type = '3' THEN 'Large'
		WHEN Type = '4' THEN 'SUV'
		WHEN Type = '5' THEN 'Truck'
		WHEN Type = '6' THEN 'VAN'
	END AS Type,
 
  CASE
    WHEN Category = '0' THEN 'Basic'
    WHEN Category = '1' THEN 'Luxury'
  END AS Category,

  CustID AS CustomerID,  
  Name as CustomerName,  
  TotalAmount as OrderAmount, 
  TotalAmount as RentalBalance
FROM
  RENTAL
WHERE
  V.Type = T.Type
  AND V.Category = T.Category
  ORDER BY StartDate ASC, R.StartDate;
