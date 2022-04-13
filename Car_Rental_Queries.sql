/* QUERIES 
INSERT QUERIES WILL BE DONE LAST
1.
2.
3.
4.
4-a.
4-b.
------------------------------
5. DONE (Comments)
6. DONE
7. DONE
8. DONE
9-a. WORK IN PROGRESS...
9-b. 
10. DONE
11. DONE
12. DONE 
*/

-- 1: Insert yourself as a New Customer. Do not provide the CustomerID in your query. 
ALTER TABLE Customer AUTO_INCREMENT = 1;

INSERT INTO Customer (Name, Phone)
VALUES ('N.Alyasiri','(123)456-7890');


-- 2: Update your phone number to (837) 721-8965
UPDATE Customer
SET Phone='(837) 721-8965'
WHERE CustID = '232';


-- 3: Increase only daily rates for luxury vehicles by 5%
UPDATE Rate
SET Daily=(Daily * 0.05) + Daily 
WHERE Category=1;


-- 4-a: Insert a new luxury van with the following info: Honda Odyssey 2019, vehicle id: 
-- 5FNRL6H58KB133711 
INSERT INTO [VEHICLE] ([VehicleID],[Description],[Year],[Type],[Category]) 
VALUES ('5FNRL6H58KB133711',"Honda Odyssey",2019,6,1);


-- 4-b: You also need to insert the following rates: 

INSERT INTO Rate (Type, Category, Weekly, Daily)
VALUES (5,1,900,150);

INSERT INTO Rate (Type, Category, Weekly, Daily)
VALUES (6,1,800,135);

-- ✓✓ 5: Return all Compact(1) & Luxury(1) vehicles that were available for rent from June 01, 2019 
-- until June 20, 2019. List VehicleID as VIN, Description, year, and how many days have been rented so 
-- far. You need to change the weeks into days. 

SELECT V.VehicleID AS VIN, Description, Year, JULIANDAY(R.returnDate) - JULIANDAY(R.startDate) AS 'Days Rented' 
FROM Vehicle V JOIN Rental R ON V.VehicleID = R.VehicleID 
WHERE Type = 1 AND Category = 1 AND (R.startDate NOT BETWEEN '2019-06-01' AND '2019-06-20') AND (R.returnDate NOT BETWEEN '2019-06-01' AND '2019-06-20');

/* I'm assuming they meant vehicles that WEREN'T available in the question (typo)? Also had to change to JULIANDAY for SQLite */


-- ✓✓ 6: Return a list with the remaining balance for the customer with the id ‘221’. List customer 
-- name, and the balance.
SELECT Name, SUM(TotalAmount) AS 'Remaining Balance'
FROM Customer C 
JOIN Rental R ON C.CustID = R.CustID
WHERE C.CustID = '221';


-- ✓✓ 7: Create a report that will return all vehicles. List the VehicleID as VIN, Description, Year, 
-- Type, Category, and Weekly and Daily rates. For the vehicle Type and Category, you need to use the 
-- SQL Case statement to substitute the numbers with text. Order your results based on Category (first 
-- Luxury and then Basic) and Type based on the Type number, not the text.
SELECT VehicleID AS VIN,
	Description, 
	Year, 
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
	Weekly AS 'Weekly Rate',
	Daily AS 'Daily Rate'
FROM VEHICLE AS V, RATE AS T
WHERE V.Type = T.Type
	AND V.Category = T.Category
ORDER BY Category DESC, V.Type;

-- 8: ✓✓ What is the total of money that customers paid to us until today?
SELECT SUM(TotalAmount) AS 'Total Amount'
FROM Rental;


-- 9-a: Create a report for the J. Brown customer with all vehicles he rented. List the description, 
-- year, type, and category. Also, calculate the unit price for every rental, the total duration mention if it is 
-- on weeks or days, the total amount, and if there is any payment. Similarly, as in Question 7, you need to 
-- change the numeric values to the corresponding text. Order the results by the StartDate.  
SELECT Description, 
	Year, 
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
	CASE
		WHEN RentalType = '1' THEN 'Daily'
      	WHEN RentalType = '7' THEN 'Weekly'
	END AS RentalType,
	SUM(TotalAmount)
FROM CUSTOMER as C, VEHICLE as V, RENTAL as R
WHERE C.CustID = R.CustID
	AND R.VehicleID = V.VehicleID
  	AND C.Name = 'J. Brown'
ORDER BY StartDate DESC;

/* CURRENTLY WORKING ON THIS*/

-- 9-b: For the same customer return the current balance



-- ✓✓ 10: Retrieve all weekly rentals for the vechicleID ‘19VDE1F3XEE414842’ that are not paid 
-- yet. List the Customer Name, the start and return date, and the amount. 
SELECT C.Name, R.StartDate, R.ReturnDate, R.TotalAmount
FROM CUSTOMER as C, VEHICLE as V, RENTAL as R
WHERE C.CustID = R.CustID
	AND R.VehicleID = V.VehicleID
	AND V.VehicleID = "19VDE1F3XEE414842" 
 	AND R.RentalType = '7'
	AND R.PaymentDate IS NULL;


-- ✓✓ 11: Return all customers that they never rent a vehicle. 
SELECT DISTINCT Customer.* 
FROM Customer 
WHERE Customer.CustID NOT IN (SELECT Rental.CustID FROM RENTAL);


-- ✓✓ 12: Return all rentals that the customer paid on the StartDate. List Customer Name, Vehicle 
-- Description, StartDate, ReturnDate, and TotalAmount. Order by Customer Name. 
SELECT C.Name, V.Description, R.StartDate, R.ReturnDate, R.TotalAmount
FROM CUSTOMER as C, VEHICLE as V, RENTAL as R
WHERE C.CustID = R.CustID
	AND R.VehicleID = V.VehicleID
	AND R.StartDate = R.PaymentDate
	ORDER BY C.Name;
