-- ------------------- PART A STARTS -------------------------------------------------
use bookstore
CREATE TABLE Books (
 ISBN int NOT NULL,
 Title nvarchar(255),
 Author nvarchar(255),
 Genre nvarchar(100),
 Price double,
 PRIMARY KEY (ISBN)
);
select * from  books
CREATE TABLE Authors (
 author_id int NOT NULL,
 AuthorName nvarchar(255), 
 Nationality nvarchar(100),

 PRIMARY KEY (author_id)
);
select * from authors
CREATE TABLE Customers (
 Customer_id int NOT NULL,
 CustomerName nvarchar(255),
 Email nvarchar(255),
 Address nvarchar(255), 
 PRIMARY KEY (Customer_id)
);
select * from customers
CREATE TABLE Orders (
 Order_id int NOT NULL,
 Customer_id int not null,
 Order_Date datetime,
 Total_amount double, 
 PRIMARY KEY (Order_id),
 foreign key (Customer_id) REFERENCES Customers(Customer_id)

);
select * from Orders

-- Insertig into books table
select * from books
Alter table books rename column Auhor To author
Insert into books (ISBN,Title,Author,Genre,price)values(002,'The Discipline','Shaban Irshad','Career',1200);
select * from books

-- Inserting Data into Authors Table
select * from authors
Insert into authors (author_id,AuthorName,Nationality) values (1,'Shaban Irshad','Indian');
Insert into authors (author_id,AuthorName,Nationality) values (2,'Benjamin','Austria');
Insert into authors (author_id,AuthorName,Nationality) values (3,'Lauren Apostoleanu','Romanian');

-- Inserting  Data into Customers Table
select * from customers
Insert into customers (Customer_id,CustomerName,Email,Address) values (1,'Haider','haider@mail.com','Bostania');
Insert into customers (Customer_id,CustomerName,Email,Address) values (2,'Rohan Bajpai','Rohan@mail.com','Delhi');
Insert into customers (Customer_id,CustomerName,Email,Address) values (3,'Shweta Bhirani','sBhirani@mail.com','Nagpur');

-- Inserting Data into Orders Table
use bookstore
Select * from Orders
Insert into Orders (Order_id,customer_id,Order_Date,Total_amount) value (101,2,'2023-10-25',2500);
Insert into Orders (Order_id,customer_id,Order_Date,Total_amount) value (102,2,'2024-09-28',500);
Insert into Orders (Order_id,customer_id,Order_Date,Total_amount) value (103,3,'2024-01-26',200);
-- --------------------- PART A ENDS ----------------------------------------

-- --------------------------- PART B (Titanic) START HERE ---------------------------------------------
use titanic
 -- THE GIVEN EXCEL FILE HAS BEEN IMPORTED TO DATABASE FOR QUERY EXECUTION--
select * from titanic;
select distinct(embarked) from titanic;
select first_name,last_name,age from titanic where survived=1;
select first_name,last_name,deck_number from titanic where fare>60000;
select first_name,last_name,age from titanic where first_name like'j%';
select first_name,last_name from titanic where deck_number in (90,70);
select first_name,last_name,age from titanic where age between 20 and 30;
select first_name,last_name,age from titanic where age in (20,25,30);

--   -----------------------PART B ENDS HERE-------------------------------
