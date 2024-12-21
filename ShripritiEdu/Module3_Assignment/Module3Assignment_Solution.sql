 -- ------------1.)CASE STUDY:CUSTOMER DATA ANALYSIS (STARTS)---------
use customer;
-- IMPORTED THAT GIVEN XL FILE TO THE DATABASE AND CREATED TABLE CUSTOMER_DATA_SET---
SELECT * FROM CUSTOMER_DATA_SET;

-- ANSWERS---------
SELECT NAME,AGE FROM CUSTOMER_DATA_SET ORDER BY AGE ASC;
SELECT NAME,BALANCE FROM CUSTOMER_DATA_SET ORDER BY BALANCE DESC LIMIT 10;
select avg(balance) as avarage,region from CUSTOMER_DATA_SET group by region having avg(balance)>60000;
SELECT JOB,BALANCE FROM CUSTOMER_DATA_SET GROUP BY JOB,BALANCE ORDER BY JOB,BALANCE DESC LIMIT 3;
SELECT  SUM(BALANCE) AS TOTAL FROM CUSTOMER_DATA_SET WHERE AGE>=25 AND AGE<=35 ;
SELECT NAME,GENDER FROM CUSTOMER_DATA_SET WHERE BALANCE>50000 AND GENDER='MALE';
 -- ------------1.)CASE STUDY:CUSTOMER DATA ANALYSIS (ENDS)---------
 
  -- ------------2.)CASE STUDY:TECHMART DATA CREAION (STARTS)---------
  use TechMart
  -- ---------------------ANSWEWR 1---------------------
  CREATE TABLE PRODUCTS
  (
	Product_id int Unique,
    Product_Name varchar(100),
    Price decimal,
    category varchar(50),    
    primary key (product_id)
  );
  create table Customers
  (
	customer_id int unique,
    customer_name varchar(100),
    Email varchar(150),
    phone varchar(150),
    primary key (customer_id)
  );
  create table Orders 
  (
	Order_id int unique,
    customer_id int,
    product_id int ,
    quantity int,
    Order_Date Date,
    foreign key (product_id) references products (product_id),
    foreign key (customer_id) references customers (customer_id),
    primary key(order_id)
  );
  
    -- ---------------------ANSWEWR 2---------------------
    INSERT INTO PRODUCTS
    (Product_id,Product_Name,Price,Category)
    VALUES
    (1001,'Drone Toy',8000,'Toy');
    INSERT INTO PRODUCTS
    (Product_id,Product_Name,Price,Category)
    VALUES
    (1002,'Hd Display TV',35000,'Appliances');
    INSERT INTO PRODUCTS
    (Product_id,Product_Name,Price,Category)
    VALUES
    (1003,'Flying Car',7200,'Toy');
    INSERT INTO PRODUCTS
    (Product_id,Product_Name,Price,Category)
    VALUES
    (1004,'Advance AC',60000,'Appliances');
    INSERT INTO PRODUCTS
    (Product_id,Product_Name,Price,Category)
    VALUES
    (1005,'Automatic Washing MAchine',26000,'Appliances');
    SELECT * FROM PRODUCTS
    
        -- ---------------------ANSWEWR 3---------------------
	  INSERT INTO  CUSTOMERS
    (Customer_id,Customer_Name,Email,Phone)
    VALUES
    (24001,'Amit Roy','amit@mail.com','7571542310');
     INSERT INTO  CUSTOMERS
    (Customer_id,Customer_Name,Email,Phone)
    VALUES
    (24002,'Gopal Sharma','gopal@mail.com','686505519');
     INSERT INTO  CUSTOMERS
    (Customer_id,Customer_Name,Email,Phone)
    VALUES
    (24003,'Shaban Irshad','shabanirshad408@mail.com','7570065060');
    SELECT * FROM CUSTOMERS
    
            -- ---------------------ANSWEWR 4---------------------
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2001,24001,1002,3,'2023-10-25');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2002,24002,1004,2,'2023-09-25');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2003,24002,1001,3,'2023-01-21');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2004,24001,1005,1,'2024-10-25');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2005,24003,1001,1,'2023-08-12');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2006,24002,1003,1,'2024-05-25');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2007,24001,1004,3,'2023-04-26');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2008,24002,1001,2,'2023-11-25');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2009,24001,1002,3,'2023-09-25');
    INSERT INTO  ORDERS
    (Order_id,Customer_id,Product_id,Quantity,Order_Date)
    VALUES
    (2010,24003,1005,1,'2024-10-02');
    SELECT * FROM ORDERS;
    select * from customers;
    select * from products;
-- ------------2.)CASE STUDY:TECHMART DATA CREAION (ENDS)---------

-- ------------3.)CASE STUDY:DATA ANALYSIS ON CUSTOMER DATABASE(STARTS)---------
USE CUSTOMER;
SELECT * FROM CUSTOMER_DATA_SET;
-- ANSWERE--------
UPDATE CUSTOMER_DATA_SET SET JOB='Data Scientist' WHERE CUSTOMERID=200000008;
UPDATE CUSTOMER_DATA_SET SET BALANCE=(BALANCE+(BALANCE*10/100));
UPDATE CUSTOMER_DATA_SET SET BALANCE=0 WHERE AGE<30;
UPDATE CUSTOMER_DATA_SET SET REGION='Wales' WHERE NAME='Thomas' AND SURNAME='Lawrence';
UPDATE CUSTOMER_DATA_SET SET JOB='Engineer' WHERE GENDER='Male';
ROLLBACK;
COMMIT;
UPDATE CUSTOMER_DATA_SET SET BALANCE=BALANCE*2 WHERE NAME LIKE 'J%';
UPDATE CUSTOMER_DATA_SET SET JOB='Manager' WHERE BALANCE=(SELECT MAX_BALANCE FROM (SELECT MAX(BALANCE) AS MAX_BALANCE FROM CUSTOMER_DATA_SET) AS T);
UPDATE CUSTOMER_DATA_SET SET BALANCE=50000 WHERE REGION='England';

-- ------------3.)CASE STUDY:DATA ANALYSIS ON CUSTOMER DATABASE(ENDS)---------

-- ------------4.)CASE STUDY:CUSTOMER DATABASE MANAGEMENT(STARTS)---------
-- ---------ANSWERES--------------
DELETE FROM CUSTOMER_DATA_SET WHERE AGE>50;
SELECT * FROM CUSTOMER_DATA_SET WHERE CUSTOMERID=300000812; -- NO DATA REPRESENTS
DELETE FROM CUSTOMER_DATA_SET WHERE JOB='oTHER';
DELETE FROM CUSTOMER_DATA_SET WHERE GENDER='MALE' AND AGE>40;
DELETE FROM CUSTOMER_DATA_SET WHERE REGION='SCOTLAND';

-- ------------4.)CASE STUDY:CUSTOMER DATABASE MANAGEMENT(ENDS)---------

-- ------------5.)CASE STUDY:ANALYSING CUSTOMER DATA (STARTS)---------
-- ------------ANSWERES------------
SELECT GENDER,COUNT(GENDER) AS TOTAL  FROM CUSTOMER_DATA_SET GROUP BY GENDER;
SELECT MAX(AGE) MaximumAge,MIN(AGE) MinimunAge FROM CUSTOMER_DATA_SET;
SELECT REGION,COUNT(NAME) CUSTOMERS FROM CUSTOMER_DATA_SET GROUP BY REGION ORDER BY CUSTOMERS DESC LIMIT 1;
SELECT NAME,AGE,REGION,BALANCE FROM CUSTOMER_DATA_SET WHERE AGE=(SELECT MIN(AGE) FROM CUSTOMER_DATA_SET) OR AGE=(SELECT MAX(AGE) FROM CUSTOMER_DATA_SET); -- 5 RECORDS RETURNED
SELECT GENDER,SUM(BALANCE) TOTALBALANCE FROM CUSTOMER_DATA_SET GROUP BY GENDER;
SELECT JOB, AVG(BALANCE) AS AvarageBalance,MAX(BALANCE) HighestBalance,MIN(BALANCE) LowestBalance FROM CUSTOMER_DATA_SET GROUP BY JOB;
SELECT JOB,COUNT(*) JOBCOUNT  FROM CUSTOMER_DATA_SET GROUP BY JOB ORDER BY JOBcOUNT DESC LIMIT 1;
SELECT REGION,AVG(BALANCE) AvarageBalance FROM CUSTOMER_DATA_sET GROUP BY REGION;
SELECT REGION,SUM(BALANCE) TotalBalance FROM CUSTOMER_DATA_sET GROUP BY REGION ORDER BY TOTALBALANCE DESC LIMIT 3;

-- ------------5.)CASE STUDY:ANALYSING CUSTOMER DATA (ENDS)---------
  
  