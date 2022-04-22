-- Q1
ALTER TABLE RENTAL
  ADD Returned INT;

UPDATE RENTAL
SET Returned = 1
WHERE PaymentDate IS NOT NULL;

UPDATE RENTAL
SET Returned = 0
WHERE PaymentDate IS NULL;

-- Q2
CREATE VIEW vRentalInfo
AS
SELECT 
	OrderDate, 
	StartDate,
	ReturnDate, 
	JULIANDAY(R.returnDate) - JULIANDAY(R.startDate) AS 'TotalDays', 
	V.VehicleID as VIN, 
	Description as Vehicle, 
	CASE
		WHEN V.Type = '1' THEN 'Compact'
		WHEN V.Type = '2' THEN 'Medium'
		WHEN V.Type = '3' THEN 'Large'
		WHEN V.Type = '4' THEN 'SUV'
		WHEN V.Type = '5' THEN 'Truck'
		WHEN V.Type = '6' THEN 'VAN'
	END AS Type,
	CASE
		WHEN V.Category = '0' THEN 'Basic'
		WHEN V.Category = '1' THEN 'Luxury'
	END AS Category,
	C.CustID AS CustomerID,  
	C.Name as CustomerName,  
	TotalAmount as OrderAmount, 
	CASE
		WHEN Returned = '1' THEN '0'
		WHEN Returned = '0' THEN TotalAmount
		END AS RentalBalance
	FROM
	CUSTOMER as C, RENTAL as R, VEHICLE AS V, RATE AS T
	WHERE
	V.Type = T.Type
	AND V.Category = T.Category
	AND C.custID = R.custID
	AND R.VehicleID = V.VehicleID
	ORDER BY StartDate ASC;
