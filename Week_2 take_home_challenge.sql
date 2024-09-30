DROP DATABASE E_COMMERCE;

CREATE DATABASE E_COMMERCE;

USE E_COMMERCE;

CREATE TABLE Customers(
cust_id INT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR (100)
);

CREATE TABLE Products(
product_id INT PRIMARY KEY ,
product_name VARCHAR(100),
price DECIMAL (10,4)
);

CREATE TABLE Orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE 
);

CREATE TABLE Suppliers (
supplier_id INT PRIMARY KEY,
product_id INT,
quantity INT 
);

INSERT INTO Customers(cust_id,first_name,last_name,email)
VALUES (1,'John','Doe','johndoe@email.com'),
(2,'Jane','Smith','janesmith@email.com'),
 (3,'Bob','Johnson','bobjohnson@email.com'),
 (4,'Alice','Brown','alicebrown@email.com'),
 (5,'Charlie','Davis','charliedavis@email.com'),
 (6,'Eva','Fisher','evafisher@email.com');
 
 INSERT INTO Orders(order_id,customer_id,order_date)
VALUES (1,1,'2023-05-01'),
 (2,2,'2023-05-02'),
 (3,3,'2023-05-03'),
 (4,1,'2023-05-04'),
 (5,2,'2023-05-05'),
 (6,3,'2023-05-06'),
 (7,4,'2023-05-07'),
 (8,5,'2023-05-08'),
 (9,6,'2023-05-09'),
 (10,7,'2023-05-10'),
 (11,8,'2023-05-11');
 
 INSERT INTO Products(product_id,product_name,price)
VALUES (1,'PRODUCT A',10.00),
 (2,'PRODUCT B',15.00),
 (3,'PRODUCT C',20.00),
 (4,'PRODUCT D',25.00),
 (5,'PRODUCT E',30.00),
 (6,'PRODUCT F',35.00),
 (7,'PRODUCT G',40.00),
 (8,'PRODUCT H',45.00),
 (9,'PRODUCT I',50.00),
 (10,'PRODUCT J',55.00),
 (11,'PRODUCT K',60.00);
 
 INSERT INTO Suppliers(supplier_id,product_id,quantity)
VALUES (001,1,6),
 (002,2,8),
 (003,3,10),
 (004,4,3),
 (005,5,9),
 (006,6,4),
 (007,7,3),
 (008,8,7),
 (009,9,2),
 (010,10,4),
 (011,11,6);
 
 -- Find the names of the distinct number of customers 
 
 SELECT DISTINCT cust_id,first_name,last_name
 FROM customers;

-- find the customers with most number of orders

SELECT
  c.first_name,
  c.last_name,
  COUNT(o.order_id) AS order_count
FROM
  customers c
  JOIN Orders o ON c.cust_id = o.customer_id
GROUP BY
  c.cust_id
ORDER BY
  order_count DESC
LIMIT
  1;
  
-- find the number of products supplied by each supplier
SELECT
supplier_id,
product_id,
count(quantity)
FROM suppliers
GROUP BY supplier_id;

