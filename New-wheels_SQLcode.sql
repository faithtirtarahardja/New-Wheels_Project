/*

-----------------------------------------------------------------------------------------------------------------------------------
                                               Guidelines
-----------------------------------------------------------------------------------------------------------------------------------

The provided document is a guide for the project. Follow the instructions and take the necessary steps to finish
the project in the SQL file			
-----------------------------------------------------------------------------------------------------------------------------------

											Database Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------
*/

-- [1] To begin with the project, you need to create the database first
-- Write the Query below to create a Database
create database vehdb;

-- [2] Now, after creating the database, you need to tell MYSQL which database is to be used.
-- Write the Query below to call your Database
use vehdb; 

/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Tables Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [3] Creating the tables:

/*Note:
---> To create the table, refer to the ER diagram and the solution architecture. 
---> Refer to the column names along with the data type while creating a table from the ER diagram.
---> If needed revisit the videos Week 2: Data Modeling and Architecture: Creating DDLs for Your Main Dataset and Normalized Datasets
---> While creating a table, make sure the column you assign as a primary key should uniquely identify each row.
---> If needed revisit the codes used to create tables for the gl_eats database. 
     This will help in getting a better understanding of table creation.*/

-- Syntax to create table-

-- To drop the table if already exists
 -- Change the name of table_name to the name you have given.                             


-- To create a table- 
CREATE TABLE temp_t (
	SHIPPER_ID INTEGER,   
	SHIPPER_NAME VARCHAR (50),
	SHIPPER_CONTACT_DETAILS VARCHAR (30),
	PRODUCT_ID INTEGER, 
    VEHICLE_MAKER VARCHAR (60),
    VEHICLE_MODEL VARCHAR (60), 
    VEHICLE_COLOR VARCHAR (60), 
    VEHICLE_MODEL_YEAR INTEGER,
    VEHICLE_PRICE DECIMAL (14,2),
	QUANTITY INTEGER, 
	DISCOUNT DECIMAL (4,2),
	CUSTOMER_ID VARCHAR (25), 
	CUSTOMER_NAME VARCHAR (25),
	GENDER VARCHAR (15),
	JOB_TITLE VARCHAR (50),
	PHONE_NUMBER VARCHAR (20),
	EMAIL_ADDRESS VARCHAR (50),
	CITY VARCHAR (25),
	COUNTRY VARCHAR (40),
	STATE VARCHAR (40),
	CUSTOMER_ADDRESS VARCHAR (50),
	ORDER_DATE DATE,
	ORDER_ID VARCHAR (25),
	SHIP_DATE DATE, 
	SHIP_MODE VARCHAR (25),
	SHIPPING VARCHAR (30),
	POSTAL_CODE INTEGER,
	CREDIT_CARD_TYPE VARCHAR (40),
	CREDIT_CARD_NUMBER BIGINT, 
	CUSTOMER_FEEDBACK VARCHAR (20),
	QUARTER_NUMBER INTEGER,
	PRIMARY KEY (ORDER_ID, PRODUCT_ID, SHIPPER_ID, CUSTOMER_ID)                    
);         
CREATE TABLE vehicles_t (
	SHIPPER_ID INTEGER,   
	SHIPPER_NAME VARCHAR (50),
	SHIPPER_CONTACT_DETAILS VARCHAR (30),
	PRODUCT_ID INTEGER, 
    VEHICLE_MAKER VARCHAR (60),
    VEHICLE_MODEL VARCHAR (60), 
    VEHICLE_COLOR VARCHAR (60), 
    VEHICLE_MODEL_YEAR INTEGER,
    VEHICLE_PRICE DECIMAL (14,2),
	QUANTITY INTEGER, 
	DISCOUNT DECIMAL (4,2),
	CUSTOMER_ID VARCHAR (25), 
	CUSTOMER_NAME VARCHAR (25),
	GENDER VARCHAR (15),
	JOB_TITLE VARCHAR (50),
	PHONE_NUMBER VARCHAR (20),
	EMAIL_ADDRESS VARCHAR (50),
	CITY VARCHAR (25),
	COUNTRY VARCHAR (40),
	STATE VARCHAR (40),
	CUSTOMER_ADDRESS VARCHAR (50),
	ORDER_DATE DATE,
	ORDER_ID VARCHAR (25),
	SHIP_DATE DATE, 
	SHIP_MODE VARCHAR (25),
	SHIPPING VARCHAR (30),
	POSTAL_CODE INTEGER,
	CREDIT_CARD_TYPE VARCHAR (40),
	CREDIT_CARD_NUMBER BIGINT, 
	CUSTOMER_FEEDBACK VARCHAR (20),
	QUARTER_NUMBER INTEGER,
	PRIMARY KEY (ORDER_ID, PRODUCT_ID, SHIPPER_ID, CUSTOMER_ID)                    
);                                                               
CREATE TABLE customer_t (
    CUSTOMER_ID VARCHAR (25), 
	CUSTOMER_NAME VARCHAR (25),
	GENDER VARCHAR (15),
	JOB_TITLE VARCHAR (50),
	PHONE_NUMBER VARCHAR (20),
	EMAIL_ADDRESS VARCHAR (50),
	CITY VARCHAR (25),
	COUNTRY VARCHAR (40),
	STATE VARCHAR (40),
	CUSTOMER_ADDRESS VARCHAR (50),
	POSTAL_CODE INTEGER,
	CREDIT_CARD_TYPE VARCHAR (40),
	CREDIT_CARD_NUMBER BIGINT,
	PRIMARY KEY (CUSTOMER_ID)                    
);   
CREATE TABLE product_t (
	PRODUCT_ID INTEGER, 
    VEHICLE_MAKER VARCHAR (60), 
    VEHICLE_MODEL VARCHAR (60), 
    VEHICLE_COLOR VARCHAR (60), 
    VEHICLE_MODEL_YEAR INTEGER,
    VEHICLE_PRICE DECIMAL (14,2),
	PRIMARY KEY (PRODUCT_ID)                    
);   
CREATE TABLE shipper_t (
	SHIPPER_ID INTEGER, 
    SHIPPER_NAME VARCHAR (50),
    SHIPPER_CONTACT_DETAILS VARCHAR (30),
	PRIMARY KEY (SHIPPER_ID)                    
);
CREATE TABLE order_t (
	ORDER_ID VARCHAR (25),
    CUSTOMER_ID VARCHAR (25), 
    SHIPPER_ID INTEGER, 
    PRODUCT_ID INTEGER, 
    QUANTITY INTEGER, 
	DISCOUNT DECIMAL (4,2),
    VEHICLE_PRICE DECIMAL (10,2), 
    ORDER_DATE DATE, 
	SHIP_DATE DATE, 
	SHIP_MODE VARCHAR (25),
	SHIPPING VARCHAR (30),
	CUSTOMER_FEEDBACK VARCHAR (20),
	QUARTER_NUMBER INTEGER,
	PRIMARY KEY (ORDER_ID)                    
);     
/* List of tables to be created.

 Create a table temp_t, vehicles_t, order_t, customer_t, product_t, shipper_t */


/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Stored Procedures Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [4] Creating the Stored Procedures:

/*Note:

---> If needed revisit the video: Week 2: Data Modeling and Architecture: Introduction to Stored Procedures.
---> Also revisit the codes used to create stored procedures for the gl_eats database. 
	 This will help in getting a better understanding of the creation of stored procedures.*/

-- Syntax to create stored procedure-

-- To drop the stored procedure if already exists- 
DROP PROCEDURE IF EXISTS shipper_p;

-- Syntax to create a stored procedure-
DELIMITER $$ 
CREATE PROCEDURE vehicles_p()
BEGIN
	INSERT INTO vehdb.vehicles_t (
		SHIPPER_ID,   
		SHIPPER_NAME,
		SHIPPER_CONTACT_DETAILS,
		PRODUCT_ID, 
		VEHICLE_MAKER,
		VEHICLE_MODEL, 
		VEHICLE_COLOR, 
		VEHICLE_MODEL_YEAR,
		VEHICLE_PRICE,
		QUANTITY, 
		DISCOUNT,
		CUSTOMER_ID, 
		CUSTOMER_NAME,
		GENDER,
		JOB_TITLE,
		PHONE_NUMBER,
		EMAIL_ADDRESS,
		CITY,
		COUNTRY,
		STATE,
		CUSTOMER_ADDRESS,
		ORDER_DATE,
		ORDER_ID,
		SHIP_DATE, 
		SHIP_MODE,
		SHIPPING,
		POSTAL_CODE,
		CREDIT_CARD_TYPE,
		CREDIT_CARD_NUMBER, 
		CUSTOMER_FEEDBACK,
		QUARTER_NUMBER
	) SELECT * FROM vehdb.temp_t;
END;

DELIMITER $$
CREATE PROCEDURE customer_p()
BEGIN
	INSERT INTO customer_t (
        CUSTOMER_ID, 
		CUSTOMER_NAME,
		GENDER,
		JOB_TITLE,
		PHONE_NUMBER,
		EMAIL_ADDRESS,
		CITY,
		COUNTRY,
		STATE,
		CUSTOMER_ADDRESS,
		POSTAL_CODE,
		CREDIT_CARD_TYPE,
		CREDIT_CARD_NUMBER
    )
    SELECT DISTINCT 
		CUSTOMER_ID, 
		CUSTOMER_NAME,
		GENDER,
		JOB_TITLE,
		PHONE_NUMBER,
		EMAIL_ADDRESS,
		CITY,
		COUNTRY,
		STATE,
		CUSTOMER_ADDRESS,
		POSTAL_CODE,
		CREDIT_CARD_TYPE,
		CREDIT_CARD_NUMBER
	FROM vehicles_t WHERE CUSTOMER_ID NOT IN (SELECT DISTINCT CUSTOMER_ID FROM customer_t);
END;

DELIMITER $$
CREATE PROCEDURE product_p()
BEGIN
	INSERT INTO product_t (
        PRODUCT_ID, 
			VEHICLE_MAKER, 
			VEHICLE_MODEL, 
			VEHICLE_COLOR, 
			VEHICLE_MODEL_YEAR,
			VEHICLE_PRICE
    )
    SELECT DISTINCT 
		PRODUCT_ID, 
			VEHICLE_MAKER, 
			VEHICLE_MODEL, 
			VEHICLE_COLOR, 
			VEHICLE_MODEL_YEAR,
			VEHICLE_PRICE
	FROM vehicles_t WHERE PRODUCT_ID NOT IN (SELECT DISTINCT PRODUCT_ID FROM product_t);
END;

DELIMITER $$
CREATE PROCEDURE shipper_p()
BEGIN
	INSERT INTO shipper_t (
        SHIPPER_ID, 
			SHIPPER_NAME,
			SHIPPER_CONTACT_DETAILS
    )
    SELECT DISTINCT 
		SHIPPER_ID, 
			SHIPPER_NAME,
			SHIPPER_CONTACT_DETAILS
	FROM vehicles_t WHERE SHIPPER_ID NOT IN (SELECT DISTINCT SHIPPER_ID FROM shipper_t);
END;

DELIMITER $$
CREATE PROCEDURE order_p(quarternum INTEGER)
BEGIN
	INSERT INTO order_t (
        ORDER_ID,
			CUSTOMER_ID, 
			SHIPPER_ID, 
			PRODUCT_ID, 
			QUANTITY, 
            DISCOUNT,
			VEHICLE_PRICE, 
			ORDER_DATE, 
			SHIP_DATE, 
			SHIP_MODE,
			SHIPPING,
			CUSTOMER_FEEDBACK,
			QUARTER_NUMBER
    )
    SELECT DISTINCT 
		ORDER_ID,
			CUSTOMER_ID, 
			SHIPPER_ID, 
			PRODUCT_ID, 
			QUANTITY, 
            DISCOUNT, 
			VEHICLE_PRICE, 
			ORDER_DATE, 
			SHIP_DATE, 
			SHIP_MODE,
			SHIPPING,
			CUSTOMER_FEEDBACK,
			QUARTER_NUMBER
	FROM vehicles_t WHERE QUARTER_NUMBER = quarternum;
END;

/* List of stored procedures to be created.

   Creating the stored procedure for vehicles_p, order_p, customer_p, product_p, shipper_p*/

/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Data Ingestion
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [5] Ingesting the data:
-- Note: Revisit the video: Week-2: Data Modeling and Architecture: Ingesting data into the main table

TRUNCATE temp_t;

LOAD DATA LOCAL INFILE "C:/Users/15612/Downloads/Week 1 SQL/Data/new_wheels_sales_qtr_4.csv" -- change this location to load another week
INTO TABLE temp_t
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

call vehicles_p();
call customer_p();
call product_p();
call shipper_p();
call order_p(4);

/* Note: 

---> With the help of the above code, you can ingest the data into temp_t table by ingesting the quarterly data and by calling the stored 
     procedures you can ingest the data into separate table.
---> You have to run the above ingestion code 4 times as 4 quarters of data are present and you also need to call all the stored procedures 
     4 times. Please change the argument value while calling the stored procedure order_p(n). (n = 1,2,3,4)
---> If needed revisit the videos: Week 2: Data Modeling and Architecture: Ingesting data into the main table and Ingesting future weeks of data
---> Also revisit the codes used to ingest the data for the gl_eats database. 
     This will help in getting a better understanding of how to ingest the data into various respective tables.*/


/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Views Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [6] Creating the views:

/*Note: 

---> If needed revisit the videos: Week-2: Data Modeling and Architecture: Creating views for answers to business questions
---> Also revisit the codes used to create views for the gl_eats database. 
	 This will help in getting a better understanding of the creation of views.*/

-- Syntax to create view-

-- To drop the views if already exists- 
DROP VIEW IF EXISTS view_name;

-- To create a view-
CREATE VIEW veh_ord_cust_v AS
    SELECT
		cust.CUSTOMER_ID,
        cust.CUSTOMER_NAME,
        cust.CITY, 
        cust.STATE,
        cust.CREDIT_CARD_TYPE,
        ord.ORDER_ID,
        ord.SHIPPER_ID,
        ord.PRODUCT_ID,
        ord.QUANTITY,
        ord.VEHICLE_PRICE,
        ord.ORDER_DATE,
        ord.SHIP_DATE,
        ord.DISCOUNT,
        ord.CUSTOMER_FEEDBACK,
        ord.QUARTER_NUMBER
FROM customer_t cust
	INNER JOIN order_t ord
	    ON cust.CUSTOMER_ID = ord.CUSTOMER_ID;
        
CREATE VIEW veh_prod_cust_v AS
    SELECT
		cust.CUSTOMER_ID,
        cust.CUSTOMER_NAME,
        cust.CREDIT_CARD_TYPE,
        cust.STATE,
        ord.ORDER_ID,
        ord.CUSTOMER_FEEDBACK,
        prod.PRODUCT_ID,
        prod.VEHICLE_MAKER,
        prod.VEHICLE_MODEL, 
        prod.VEHICLE_COLOR,
        prod.VEHICLE_MODEL_YEAR
FROM customer_t cust
		JOIN order_t ord
	    ON cust.CUSTOMER_ID = ord.CUSTOMER_ID
        JOIN product_t prod
        ON prod.PRODUCT_ID = ord.PRODUCT_ID
        
	
-- List of views to be created are "veh_prod_cust_v" , "veh_ord_cust_v"


/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Functions Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [7] Creating the functions:

/*Note: 

---> If needed revisit the videos: Week-2: Data Modeling and Architecture: Creating User Defined Functions
---> Also revisit the codes used to create functions for the gl_eats database. 
     This will help in getting a better understanding of the creation of functions.*/

-- Create the function calc_revenue_f

-- Syntax to create function-

DELIMITER $$  
CREATE FUNCTION calc_revenue_f (QUANTITY INTEGER, DISCOUNT BIGINT, VEHICLE_PRICE DECIMAL(10,2)) 
RETURNS DECIMAL 
DETERMINISTIC  
BEGIN 
DECLARE revenue DECIMAL;
	SET revenue = quantity * (vehicle_price - ((discount/100)*vehicle_Price));  
RETURN revenue;
END;

-- Create the function days_to_ship_f-

DELIMITER $$
CREATE FUNCTION days_to_ship_f (ORDER_DATE DATE, SHIP_DATE DATE) 
RETURNS INTEGER
DETERMINISTIC
BEGIN
DECLARE ship_days int;
	SET ship_days = DATEDIFF(ship_date, order_date);   
RETURN ship_days;
END;

/*-----------------------------------------------------------------------------------------------------------------------------------
Note: 
After creating tables, stored procedures, views and functions, attempt the below questions.
Once you have got the answer to the below questions, download the csv file for each question and use it in Python for visualisations.
------------------------------------------------------------------------------------------------------------------------------------ 

  
  
-----------------------------------------------------------------------------------------------------------------------------------

                                                         Queries
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/
/*-- QUESTIONS RELATED TO CUSTOMERS
     [Q1] What is the distribution of customers across states? (works)
     Hint: For each state, count the number of customers.*/
SELECT 
    STATE, 
    COUNT(CUSTOMER_ID) AS CUSTOMER_COUNT
FROM customer_t
GROUP BY 1
ORDER BY 2 DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q2] What is the average rating in each quarter?
-- Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5.

Hint: Use a common table expression and in that CTE, assign numbers to the different customer ratings. 
      Now average the feedback for each quarter. 

Note: For reference, refer to question number 10. Week-2: Hands-on (Practice)-GL_EATS_PRACTICE_EXERCISE_SOLUTION.SQL. 
      You'll get an overview of how to use common table expressions from this question.*/

WITH RATING_BUCKET AS
(
	SELECT
    QUARTER_NUMBER,
        CASE 
			WHEN CUSTOMER_FEEDBACK = "Very Bad" THEN "1"
            WHEN CUSTOMER_FEEDBACK = "Bad" THEN "2"
            WHEN CUSTOMER_FEEDBACK = "Okay" THEN "3"
            WHEN CUSTOMER_FEEDBACK = "Good" THEN "4"
            WHEN CUSTOMER_FEEDBACK = "Very Good" THEN "5"
		END AS CUSTOMER_RATING
	FROM veh_ord_cust_v
)
SELECT
	QUARTER_NUMBER,
    AVG(CUSTOMER_RATING) AS "AVG_RATING"
FROM RATING_BUCKET
GROUP BY 1
ORDER BY 1;


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q3] Are customers getting more dissatisfied over time?

Hint: Need the percentage of different types of customer feedback in each quarter. Use a common table expression and
	  determine the number of customer feedback in each category as well as the total number of customer feedback in each quarter.
	  Now use that common table expression to find out the percentage of different types of customer feedback in each quarter.
      Eg: (total number of very good feedback/total customer feedback)* 100 gives you the percentage of very good feedback.
      
Note: For reference, refer to question number 10. Week-2: Hands-on (Practice)-GL_EATS_PRACTICE_EXERCISE_SOLUTION.SQL. 
      You'll get an overview of how to use common table expressions from this question*/

WITH RATING_BUCKET AS
(
	SELECT
    QUARTER_NUMBER,
        CASE 
			WHEN CUSTOMER_FEEDBACK = "Very Bad" THEN "1"
            WHEN CUSTOMER_FEEDBACK = "Bad" THEN "2"
            WHEN CUSTOMER_FEEDBACK = "Okay" THEN "3"
            WHEN CUSTOMER_FEEDBACK = "Good" THEN "4"
            WHEN CUSTOMER_FEEDBACK = "Very Good" THEN "5"
		END AS CUSTOMER_RATING
	FROM veh_ord_cust_v
)
SELECT
	QUARTER_NUMBER,
	(SUM((CASE WHEN CUSTOMER_RATING = "1" THEN 1 ELSE 0 END)) / COUNT(CUSTOMER_RATING))*100 AS "VERY_BAD(%)",
    (SUM((CASE WHEN CUSTOMER_RATING = 2 THEN 1 ELSE 0 END)) / COUNT(CUSTOMER_RATING))*100 AS "BAD(%)",
    (SUM((CASE WHEN CUSTOMER_RATING = 3 THEN 1 ELSE 0 END))/ COUNT(CUSTOMER_RATING))*100 AS "OKAY(%)",
    (SUM((CASE WHEN CUSTOMER_RATING = 4 THEN 1 ELSE 0 END))/ COUNT(CUSTOMER_RATING))*100 AS "GOOD(%)",
    (SUM((CASE WHEN CUSTOMER_RATING = 5 THEN 1 ELSE 0 END))/ COUNT(CUSTOMER_RATING))*100 AS "VERY_GOOD(%)" 
FROM RATING_BUCKET
GROUP BY 1
ORDER BY 1; 
    
-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q4] Which are the top 5 vehicle makers preferred by the customer.

Hint: For each vehicle make what is the count of the customers.*/
SELECT 
	prod.VEHICLE_MAKER, 
    COUNT(DISTINCT ord.CUSTOMER_ID) AS CUSTOMER_COUNT
FROM product_t AS prod
JOIN order_t AS ord
ON prod.product_id = ord.product_id
GROUP BY 1
ORDER BY 2 DESC;


-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q5] What is the most preferred vehicle make in each state?

Hint: Use the window function RANK() to rank based on the count of customers for each state and vehicle maker. 
After ranking, take the vehicle maker whose rank is 1.*/
SELECT
	VEHICLE_MAKER, 
	STATE,
RANK () OVER (PARTITION BY VEHICLE_MAKER,STATE ORDER BY COUNT(DISTINCT CUSTOMER_ID) DESC
    ) CUSTOMER_RANK
FROM veh_prod_cust_v
GROUP BY 2;


-- ---------------------------------------------------------------------------------------------------------------------------------
/*QUESTIONS RELATED TO REVENUE and ORDERS 

-- [Q6] What is the trend of number of orders by quarters?

Hint: Count the number of orders for each quarter.*/
SELECT
	QUARTER_NUMBER,
	COUNT(ORDER_ID) AS NUMBER_OF_ORDERS
FROM order_t
GROUP BY 1
ORDER BY 1;

 ---------------------------------------------------------------------------------------------------------------------------------

/* [Q7] What is the quarter over quarter % change in revenue? 

Hint: Quarter over Quarter percentage change in revenue means what is the change in revenue from the subsequent quarter to the previous quarter in percentage.
      To calculate you need to use the common table expression to find out the sum of revenue for each quarter.
      Then use that CTE along with the LAG function to calculate the QoQ percentage change in revenue.
      
Note: For reference, refer to question number 5. Week-2: Hands-on (Practice)-GL_EATS_PRACTICE_EXERCISE_SOLUTION.SQL. 
      You'll get an overview of how to use common table expressions and the LAG function from this question.*/

WITH QoQ AS 
(
	SELECT
		QUARTER_NUMBER,
		SUM(calc_revenue_f(VEHICLE_PRICE, DISCOUNT, QUANTITY)) revenue
	FROM 
		veh_ord_cust_v
	GROUP BY 1
)
SELECT
	QUARTER_NUMBER,
    REVENUE,
    LAG(REVENUE) OVER (ORDER BY QUARTER_NUMBER) AS PREVIOUS_QUARTER_REVENUE,
    ((REVENUE - LAG(REVENUE) OVER (ORDER BY QUARTER_NUMBER))/LAG(REVENUE) OVER(ORDER BY QUARTER_NUMBER) * 100) AS "QUARTER OVER QUARTER REVENUE(%)"
FROM
	QoQ;
      
	

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q8] What is the trend of revenue and orders by quarters?

Hint: Find out the sum of revenue and count the number of orders for each quarter.*/
SELECT
		QUARTER_NUMBER,
        COUNT(DISTINCT ORDER_ID) AS NUMBER_OF_ORDERS,
		SUM(calc_revenue_f(vehicle_price, discount, quantity)) revenue
	FROM veh_ord_cust_v
	GROUP BY QUARTER_NUMBER
    ORDER BY QUARTER_NUMBER; 


-- ---------------------------------------------------------------------------------------------------------------------------------

/* QUESTIONS RELATED TO SHIPPING 
    [Q9] What is the average discount offered for different types of credit cards?

Hint: Find out the average of discount for each credit card type.works*/
SELECT 
	cust.CREDIT_CARD_TYPE,
	AVG(ord.DISCOUNT) AVG_DISCOUNT
FROM customer_t cust
JOIN order_t ord
USING(CUSTOMER_ID)
GROUP BY 1
ORDER BY 2 DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q10] What is the average time taken to ship the placed orders for each quarters?
   Use days_to_ship_f function to compute the time taken to ship the orders.

Hint: For each quarter, find out the average of the function that you created to calculate the difference between the ship date and the order date.*/
SELECT 
	QUARTER_NUMBER, 
    AVG(days_to_ship_f(ORDER_DATE, SHIP_DATE)) AVERAGE_SHIPPING
FROM order_t
GROUP BY 1
ORDER BY 1; 

-- --------------------------------------------------------Done----------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------




