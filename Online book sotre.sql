CREATE DATABASE Onlinebookstore;

CREATE TABLE Books(
Book_ID SERIAL PRIMARY KEY,
Title VARCHAR (100),
Author VARCHAR(100),
Genre VARCHAR(50),
Published_Year INT,
Price NUMERIC(10,2),
Stock INT
);


CREATE TABLE customers(
Customer_ID SERIAL PRIMARY KEY,
Name VARCHAR (100),
Email VARCHAR (100),
Phone VARCHAR (15),
City VARCHAR (50),
Country VARCHAR (150)
);

CREATE TABLE Orders(
Order_ID SERIAL PRIMARY KEY,
Customer_ID  INT REFERENCES Customers(Customer_ID),
Book_ID INT REFERENCES Books (Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2) 
);

SELECT * FROM Books;

SELECT * FROM Customers;

SELECT * FROM Orders;

-- IMPORT DATA INTO TABLES 

SELECT *
FROM books
WHERE genre = 'Fiction';

SELECT * FROM Books
WHERE published_year > 1950;

SELECT * 
FROM Customers
WHERE country = 'Canada';



SELECT *
FROM orders
WHERE order_date >= '2023-11-01' AND order_date < '2023-12-01';

SELECT SUM(stock) AS total_stock
FROM books;


SELECT MAX (price) AS maximum_price
FROM Books;

SELECT * 
FROM Orders
WHERE quantity >1;



SELECT *
FROM orders
WHERE total_amount > 20;

SELECT * 
FROM Books
WHERE genre;

SELECT DISTINCT genre
FROM Books;

SELECT genre
FROM Books;


SELECT author
FROM Books;

SELECT 

SELECT MIN (stock) AS maximum_price
FROM Books;


SELECT *
FROM Books
WHERE stock = (
    SELECT MIN(stock)
    FROM Books
);

SELECT *
FROM Books
WHERE price = (
    SELECT MAX(price)
    FROM Books
);

SELECT *
FROM Books
WHERE price = (
    SELECT MAX(price)
    FROM Books
);

SELECT *
FROM Books
WHERE stock = (
    SELECT MAX(stock)
    FROM Books
);

 
SELECT SUM (total_amount) AS SUMS
FROM Orders;













