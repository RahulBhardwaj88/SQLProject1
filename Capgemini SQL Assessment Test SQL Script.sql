Show Databases;
Use classicmodels;
Show tables;

# Describe all tables
Describe Products;
Describe Productlines;
Describe Customers;
Describe Payments;
Describe orders;
Describe orderdetails;
Describe employees;
Describe offices;

#Assignment 1. Fetch unique values of "city" from "customers" table using the alias name as "CUSTOMER_CITY".
SELECT distinct CITY AS CUSTOMER_CITY
FROM CUSTOMERS;

#Assignment 2. Print all details of employees, excluding those with first names "Gerard" and "Mary"
Select *
From Employees
Where firstName != "Gerard" AND firstName != "Mary";

Select *
From Employees
Where firstName Not In ("Gerard", "Mary");

#Assignment 3. print full name as concatenation of first and last name of employees whose last name ends with ‘n’
Select concat (firstName, " ", Lastname) as 'Full Name'
From Employees
Where lastName LIKE "%N";

# Additonal Syntax
Select firstName, lastName, concat (firstName, " ", Lastname) as 'Full Name'
From Employees
Where lastName LIKE "%N";

#Assignment 4. print all details of all employees located in offices within territory “EMEA”
Select * From Employees;
Select * From offices;

Select * From Employees e
Inner Join offices o on e.officeCode = o.officeCode
Where Territory = 'EMEA';

#Assignment 5. fetch the no. of employees for each territory. Sort by no. of employees in the descending order
Select * From Employees;
Select * From Offices;

Select Territory, count(employeenumber) as 'Number_Employees' From Employees e
Inner Join offices o on e.officeCode = o.officeCode
Group By Territory
Order by 'Number_Employees' DESC;

#Assignment 6. Query to print “productName” from “products” table next to the corresponding “textDescription” with alias “productLine” from the “productlines” 
table order by “productLine” Ascending and “productName” Descending

Select * From Products;
Select * From Productlines;

Select p.ProductName, pl.TextDescription As productLine
From Products P
Join Productlines pl on p.productline = pl.productline
order by productLine ASC, ProductName DESC;

#Assignment 7. query to print top 5 products with highest total quantity sold in April, 2005. Quantities should also be displayed.
Select * From Products;
Select * From Orders;
Select * From OrderDetails;
Select * From Payments;

Select p.productName, SUM(od.quantityOrdered) AS Total_Quantity from Products p
Join OrderDetails od on p.productCode = od.productCode
Join orders o on od.orderNumber = o.orderNumber
Where o.orderDate between '2005-04-01' AND '2005-04-30'
Group by p.productName
order by Total_Quantity DESC
Limit 5;

#Assignment 8. query to print total revenue (calculated as “quantityOrdered” *  “priceEach”) along with product names for all products in the database, including those where no sales were registered (display revenue as 0 in such cases)
Select * From Products;
Select * From OrderDetails;

Select P.ProductName, IFNULL(SUM(od.quantityOrdered * priceEach), 0) as Total_Revenue
From Products p
Left Join Orderdetails od on p.productCode = od.productCode
Group By P.productName
Order by Total_Revenue;