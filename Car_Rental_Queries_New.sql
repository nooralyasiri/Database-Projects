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
  --Total Days per Rental as TotalDays, -- you need to change weeks to days 
  JULIANDAY(R.returnDate) - JULIANDAY(R.startDate) AS 'TotalDays', 
  V.VehicleID as VIN, 
  V.Description as Vehicle,
  --you need to use the description of the type  
  CASE
	WHEN V.Type = '1' THEN 'Compact'
	WHEN V.Type = '2' THEN 'Medium'
	WHEN V.Type = '3' THEN 'Large'
	WHEN V.Type = '4' THEN 'SUV'
	WHEN V.Type = '5' THEN 'Truck'
	WHEN V.Type = '6' THEN 'VAN'
  END AS Type,
  --you need to use the description of the category  
  CASE
    WHEN V.Category = '0' THEN 'Basic'
    WHEN V.Category = '1' THEN 'Luxury'
  END AS Category,
  C.CustID AS CustomerID,  
  C.Name as CustomerName,  
  TotalAmount as OrderAmount, 
  (
    SELECT SUM(TotalAmount) AS 'RentalBalance'
    FROM Rental as R
    WHERE PaymentDate IS NULL;
  )
FROM
  RENTAL as R, VEHICLE AS V, RATE AS T, CUSTOMER AS C
WHERE
  V.Type = T.Type
  AND V.Category = T.Category
  AND C.CustID = V.CustID
  ORDER BY StartDate ASC;
 
 ----Needs Testing----
