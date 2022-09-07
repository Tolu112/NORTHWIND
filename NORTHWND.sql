-- Select all the rows from the "Customers" table. 
SELECT * FROM Customers

-- Get distinct countries from the Customers table.
SELECT DISTINCT Country
FROM Customers

-- Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
SELECT CustomerId
FROM Customers
WHERE CustomerID LIKE 'BL%'

-- Get the first 100 records of the orders table. 
SELECT TOP 100 * FROM Orders
--DISCUSS: Why would you do this? 
--You might need this if you have a promo/sweepstakes for the first x number of orders in a given time period
--What else would you likely need to include in this query?
--You might need the order date and/or time to see if the promo/sweepstakes requirements were met.

-- Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
SELECT * FROM Customers
WHERE PostalCode IN ('1010', '3012', '12209', '05023')

-- Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM Orders
WHERE ShipRegion != 'NULL'

-- Get all customers ordered by the country, then by the city.
SELECT *
FROM Customers
ORDER BY Country, City

-- Add a new customer to the customers table. You can use whatever values.
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('OLUBU', 'Inspiduds', 'Tolu Olubunmi', 'Owner', '12345 Ventura Blvd', 'Sherman Oaks', 'NULL', '91304', 'USA', '(555) 555-5555', '(555) 555-9999')

-- Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.  
UPDATE Orders
SET ShipRegion = 'EuroZone'
Where ShipCountry = 'France'

-- Delete all orders from OrderDetails that have quantity of 1. 
DELETE FROM [Order Details Extended]
WHERE Quantity = 1

SELECT *
FROM [Order Details Extended]
WHERE Quantity = 1

-- Find the CustomerID that placed order 10290 (orders table).
SELECT CustomerID FROM Orders
WHERE OrderID = 10290

-- Join the orders table to the customers table.
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Get employees’ firstname for all employees who report to no one.
SELECT FirstName FROM Employees
WHERE ReportsTo IS NULL

-- Get employees’ firstname for all employees who report to Andrew.
SELECT FirstName FROM Employees
WHERE ReportsTo = 2

-- Calculate the average, max, and min of the quantity at the orderdetails table, grouped by the orderid. 
SELECT OrderID, AVG(Quantity) AS 'Average Quantity Ordered', MAX(Quantity) AS 'Highest Quantity Ordered', MIN(Quantity) AS 'Lowest Quantity Ordered'
FROM [Order Details Extended] 
GROUP BY OrderID

-- Calculate the average, max, and min of the quantity at the orderdetails table.
SELECT AVG(Quantity) AS 'Average Quantity Ordered', MAX(Quantity) AS 'Highest Quantity Ordered', MIN(Quantity) AS 'Lowest Quantity Ordered'
FROM [Order Details Extended] 

-- Find all customers living in London or Paris
SELECT * FROM Customers
WHERE City IN ('London','Paris')

-- Do an inner join, left join, right join on orders and customers tables. 
SELECT * FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT * FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT * FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Make a list of cities where customers are coming from. The list should not have any duplicates or nulls.
SELECT DISTINCT City FROM Customers
WHERE City != 'Null'

-- Show a sorted list of employees’ first names. 
SELECT FirstName FROM Employees
ORDER BY FirstName 

-- Find total for each order
SELECT OrderID, 
Round (Sum((UnitPrice * Quantity) - Discount), 2) AS 'Order Total' 
FROM [Order Details Extended]  
GROUP BY OrderID    
ORDER BY OrderID  

-- Get a list of all employees who got hired between 1/1/1994 and today
SELECT * FROM Employees
WHERE HireDate BETWEEN '1994-01-01' AND '2022-09-04'

-- Find how long employees have been working for Northwind (in years!)
SELECT EmployeeID, LastName, FirstName, 
DATEDIFF (year, HireDate, GETDATE())AS 'Years of Service' 
FROM Employees

-- Get a list of all products sorted by quantity (ascending and descending order)
--Ascending. Quantity is not a column in the Products table. Used QuantityPerUnit
SELECT * FROM Products
ORDER BY QuantityPerUnit

-- SELECT * FROM [Order Details Extended]
-- ORDER BY Quantity

--Descending Quantity is not a column in the Products table. Used QuantityPerUnit
SELECT * FROM Products
ORDER BY QuantityPerUnit DESC

-- SELECT *
-- FROM [Order Details Extended]
-- ORDER BY Quantity DESC

-- Find all products that are low on stock (quantity less than 6)
SELECT * FROM Products
WHERE UnitsInStock < 6

-- Find a list of all discontinued products. 
SELECT * FROM Products
WHERE Discontinued > 0

-- Find a list of all products that have Tofu in them.
SELECT * FROM Products
WHERE ProductName LIKE '%Tofu%'

-- Find the product that has the highest unit price. 
SELECT UnitPrice, MAX (UnitPrice) AS 'Max UnitPrice'
FROM Products
GROUP BY UnitPrice

SELECT MAX (UnitPrice) AS 'Max UnitPrice'
FROM Products

-- Get a list of all employees who got hired after 1/1/1993
SELECT * FROM Employees
WHERE HireDate > '1993-01-01'

-- Get all employees who have title : “Ms.” And “Mrs.”
SELECT * FROM Employees
WHERE TitleOfCourtesy IN ('Mr.', 'Mrs.')

-- Get all employees who have a Home phone number that has area code 206
SELECT * FROM Employees
WHERE HomePhone LIKE '%206%'