/* QUERIES */

-- 1: Insert yourself as a New Customer. Do not provide the CustomerID in your query. 
ALTER TABLE Customer AUTO_INCREMENT = 1;

INSERT INTO Customer (Name, Phone)
VALUES ('N.Alyasiri','(123)456-7890');


-- 2: Update your phone number to (837) 721-8965
UPDATE Customer
SET Phone='(837) 721-8965'
WHERE CustID = '232';


-- 3: Increase only daily rates for luxury vehicles by 5%



-- 4-a: Insert a new luxury van with the following info: Honda Odyssey 2019, vehicle id: 
-- 5FNRL6H58KB133711 



-- 4-b: You also need to insert the following rates: 



-- 5: Return all Compact(1) & Luxury(1) vehicles that were available for rent from June 01, 2019 
-- until June 20, 2019. List VechicleID as VIN, Description, year, and how many days have been rented so 
-- far. You need to change the weeks into days. 



-- 6: Return a list with the remaining balance for the customer with the id ‘221’. List customer 
-- name, and the balance.



-- 7: Create a report that will return all vehicles. List the VehicleID as VIN, Description, Year, 
-- Type, Category, and Weekly and Daily rates. For the vehicle Type and Category, you need to use the 
-- SQL Case statement to substitute the numbers with text. Order your results based on Category (first 
-- Luxury and then Basic) and Type based on the Type number, not the text.



-- 8: What is the total of money that customers paid to us until today?



-- 9-a: Create a report for the J. Brown customer with all vehicles he rented. List the description, 
-- year, type, and category. Also, calculate the unit price for every rental, the total duration mention if it is 
-- on weeks or days, the total amount, and if there is any payment. Similarly, as in Question 7, you need to 
-- change the numeric values to the corresponding text. Order the results by the StartDate.  



-- 9-b: For the same customer return the current balance



-- 10: Retrieve all weekly rentals for the vechicleID ‘19VDE1F3XEE414842’ that are not paid 
-- yet. List the Customer Name, the start and return date, and the amount.
SELECT C.Name, R.StartDate, R.ReturnDate, R.TotalAmount
FROM CUSTOMER as C, VEHICLE as V, RENTAL as R
WHERE C.CustID = R.CustID
	AND R.VehicleID = V.VehicleID
	AND V.VehicleID = "19VDE1F3XEE414842" 
 	AND R.RentalType = '7'
	AND R.PaymentDate = NULL;


-- 11: Return all customers that they never rent a vehicle. 



-- 12: Return all rentals that the customer paid on the StartDate. List Customer Name, Vehicle 
-- Description, StartDate, ReturnDate, and TotalAmount. Order by Customer Name. 
SELECT C.Name, V.Description, R.StartDate, R.ReturnDate, R.TotalAmount
FROM CUSTOMER as C, VEHICLE as V, RENTAL as R
WHERE C.CustID = R.CustID
	AND R.VehicleID = V.VehicleID
	AND R.StartDate = R.PaymentDate
	ORDER BY C.Name;