-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example. 

ALTER SESSION SET CURRENT_SCHEMA = SalesOrdersSample;

SELECT C.CustFirstName, C.CustLastName
FROM 
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Bike') C
INNER JOIN
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Skateboard') C2
ON C.CustFirstName = C2.CustFirstName
  AND C.CustLastName = C2.CustLastName;
  
-- Sample query that returns results:
SELECT C.CustFirstName, C.CustLastName
FROM 
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Bike%') C
INNER JOIN
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Skateboard%') C2
ON C.CustFirstName = C2.CustFirstName
  AND C.CustLastName = C2.CustLastName;

