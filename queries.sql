-- Problem 1 & 2  
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.

-- SELECT * FROM sales inner join products on sales.ProductID = products.ProductID inner join employees on sales.SalesPersonID = employees.EmployeeID;

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!

-- create view all_sales as SELECT sales.SalesID, sales.CustomerID, sales.quantity, products.name, products.Price, products.ProductID, employees.EmployeeID, employees.Firstname, employees.MiddleInitial, employees.Lastname from sales inner join products on sales.ProductID = products.ProductID inner join employees on sales.SalesPersonID = employees.EmployeeID;

-- 2b. Test your View by selecting all rows and columns from the View

-- SELECT * FROM all_sales;

-- Problem 3
-- Find the average sale amount for each sales person

-- SELECT AVG(price), FirstName FROM all_sales
-- GROUP BY FirstName;

-- Problem 4 
-- Find the top three sales persons by total sales

-- SELECT sum(price), Firstname FROM all_sales
-- GROUP BY Firstname
-- ORDER BY sum(price) DESC
-- LIMIT 3;

-- Problem 5
-- Find the product that has the highest price

-- SELECT max(price), name FROM all_sales
-- GROUP BY name
-- ORDER BY max(price) DESC
-- LIMIT 1;


-- Problem 6
-- Find the product that was sold the most times

-- SELECT max(quantity), name FROM all_sales
-- GROUP BY name
-- ORDER BY max(quantity) DESC
-- LIMIT 1;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products

-- SELECT name, price FROM all_sales
-- WHERE price > (SELECT avg(price) FROM all_sales);

-- Problem 8
-- Find the customer who spent the most money in purchased products

-- SELECT CustomerID, sum(quantity*price) AS total_quantity FROM all_sales
-- GROUP BY CustomerID
-- ORDER BY sum(quantity*price) DESC
-- LIMIT 1;

-- Problem 9
-- Find the total number of sales for each sales person

-- SELECT sum(price * quantity), FirstName FROM all_sales
-- GROUP BY FirstName
-- ORDER BY sum(price * quantity) DESC;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8

-- SELECT DISTINCT FirstName, LastName FROM all_sales WHERE CustomerID=18723;



