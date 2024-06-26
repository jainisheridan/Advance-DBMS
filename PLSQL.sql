/*
GROUP NAME: DATA MASTERS
GROUP MEMBERS:- 
HARSIMRANJIT SINGH - 991711378
HARLEEN KAUR - 991707028
JAINI BHAVESHBHAI TOPIWALA - 991669857
*/

--PART A :- 
--COMPLETED BY := JAINI BHAVESHBHAI TOPIWALA - 991669857


--QUERIES FOR CREATING TABLES

CREATE TABLE movie_category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);


CREATE TABLE customer_list(
    CustomerID VARCHAR(2) PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    PhoneNumber VARCHAR2(20),
    Birthdate DATE,
    DriverLicenseNumber VARCHAR2(20),
    Status VARCHAR2(20)
);

CREATE TABLE dvds (
    TapeID NUMBER PRIMARY KEY,
    Title VARCHAR2(255),
    Year NUMBER,
    Cost DECIMAL(5, 2),
    CategoryID NUMBER,
    RentedOut CHAR(1) CHECK (RentedOut IN ('Y', 'N')),
    Rating VARCHAR2(5),
    ActionOnReturn VARCHAR2(50),
    CONSTRAINT fk_category
        FOREIGN KEY (CategoryID)
        REFERENCES movie_category(CategoryID)
);


CREATE TABLE dvd_rental (
    RentalID NUMBER PRIMARY KEY,
    RentalDate DATE,
    CustomerID VARCHAR(2),
    TapeID NUMBER,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES customer_list(CustomerID),
    CONSTRAINT fk_tape
        FOREIGN KEY (TapeID)
        REFERENCES dvds(TapeID)
);



--PART B :-
--COMPLETED BY := HARSIMRANJIT SINGH - 991711378



-- Delete existing data if any
DELETE FROM dvd_rental;
DELETE FROM dvds;
DELETE FROM customer_list;
DELETE FROM movie_category;

-- Insert Data into movie_category table
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (1, 'Action/Adventure');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (2, 'Biography');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (3, 'Children');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (4, 'Comedy');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (5, 'Drama');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (6, 'Horror');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (7, 'Musical');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (8, 'Science Fiction');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (9, 'Romance');
INSERT INTO movie_category (CategoryID, CategoryName) VALUES (10, 'Documentary');

-- Insert Data into customer_list table
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('EV', 'Edward', 'Vongsaphay', '(905) 555-8932', TO_DATE('1/1/1990', 'MM/DD/YYYY'), '537597397', 'Active');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('FE', 'Fiona', 'Esposito', '(905) 345-3920', TO_DATE('3/28/1955', 'MM/DD/YYYY'), '232323290', 'Active');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('GS', 'Graeme', 'Sands', '(416) 849-5391', TO_DATE('11/30/1973', 'MM/DD/YYYY'), '492830981', 'Amount Owing');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('MA', 'Margaret', 'Armstrong', '(905) 745-7342', TO_DATE('6/19/1968', 'MM/DD/YYYY'), '987654336', 'Suspended');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('MM', 'Michael', 'McGuinty', '(905) 648-3246', TO_DATE('3/30/1984', 'MM/DD/YYYY'), '345678998', 'Active');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('PC', 'Phil', 'Charest', '(416) 371-3979', TO_DATE('12/10/1980', 'MM/DD/YYYY'), '604604047', 'Suspended');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('PS', 'Paula', 'Show', '(416) 635-5555', TO_DATE('12/10/1997', 'MM/DD/YYYY'), '549685396', 'Active');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('RM', 'Rachel', 'Morgan', '(416) 541-8975', TO_DATE('01/28/1999', 'MM/DD/YYYY'), '698575235', 'Active');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('SJ', 'Samuel', 'Jones', '(905) 674-3847', TO_DATE('11/15/1996', 'MM/DD/YYYY'), '213564877', 'Suspended');
INSERT INTO customer_list (CustomerID, FirstName, LastName, PhoneNumber, Birthdate, DriverLicenseNumber, Status) VALUES ('PM', 'Paula', 'Morgan', '(905) 743-5038', TO_DATE('12/10/1997', 'MM/DD/YYYY'), '546487575', 'Amount Owing');


-- Insert Data into dvds table
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (1, 'Elizabeth: The Golden Age', 2018, 5.29, 5, 'Y', 'PG', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (2, 'The Bourne Ultimatum', 2006, 3.99, 1, 'N', 'PG', 'Sell');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (3, 'Shrek 2', 2004, 3.99, 3, 'N', '3', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (4, 'Ace Ventura, Pet Detective', 2004, 3.99, 4, 'N', '14A', 'Sell');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (5, 'Hairspray', 2017, 5.29, 7, 'N', 'PG', 'Sell');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (6, 'A Charlie Brown Christmas', 2000, 3.99, 3, 'N', 'G', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (7, 'Leonard Cohen: I''m Your Man', 2022, 3.99, 2, 'Y', 'PG', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (8, 'Nightmare on Elm Street', 1999, 3.99, 6, 'Y', 'R', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (9, 'Star Trek: Nemesis', 2005, 3.99, 8, 'Y', 'PG', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (10, 'The King''s Speech', 2020, 5.29, 5, 'Y', 'R', 'Return to Shelf');
INSERT INTO dvds (TapeID, Title, Year, Cost, CategoryID, RentedOut, Rating, ActionOnReturn) VALUES (11, 'True Grit', 2020, 5.29, 1, 'Y', 'PG', 'Return to Shelf');

-- Insert Data into dvd_rental table
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1001, TO_DATE('12/2/2011', 'MM/DD/YYYY'), 'EV', 10);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1002, TO_DATE('12/2/2011', 'MM/DD/YYYY'), 'FE', 3);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1003, TO_DATE('12/2/2011', 'MM/DD/YYYY'), 'GS', 6);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1004, TO_DATE('12/7/2011', 'MM/DD/YYYY'), 'MA', 1);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1005, TO_DATE('12/7/2011', 'MM/DD/YYYY'), 'MM', 7);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1006, TO_DATE('8/13/2011', 'MM/DD/YYYY'), 'PC', 2);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1007, TO_DATE('8/13/2011', 'MM/DD/YYYY'), 'PS', 5);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1008, TO_DATE('8/15/2011', 'MM/DD/YYYY'), 'RM', 8);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1009, TO_DATE('8/15/2011', 'MM/DD/YYYY'), 'SJ', 11);
INSERT INTO DVD_Rental (RentalID, RentalDate, CustomerID, TapeID) VALUES (1010, TO_DATE('8/13/2011', 'MM/DD/YYYY'), 'PM', 4);


-- Update Data in customer_list table
UPDATE customer_list SET Status = 'Active' WHERE CustomerID IN ('GS', 'PM');
UPDATE customer_list SET Status = 'Suspended' WHERE CustomerID IN ('MA', 'SJ');
UPDATE customer_list SET Status = 'Amount Owing' WHERE CustomerID IN ('PC', 'PM');

-- Delete Data from dvd_rental table
DELETE FROM dvd_rental WHERE RentalID = 1009;



--PL/SQL SCRIPTS:-


--Q1:Which movie(s) is/are available right now to rent out?

SET SERVEROUTPUT ON;
DECLARE
    v_available_movies VARCHAR2(4000) := '';
    v_title dvds.Title%TYPE;
    CURSOR c_movies IS
        SELECT Title
        FROM dvds
        WHERE RentedOut = 'N';
BEGIN
    FOR movie_rec IN c_movies 
    LOOP
        v_available_movies := v_available_movies || movie_rec.Title;
        IF c_movies%FOUND THEN
            v_available_movies := v_available_movies || ', ';
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Available Movies: ' || v_available_movies);
END;
/


--Q2:Show the movie(s) which has the least renting cost and highest renting cost?

SET SERVEROUTPUT ON;
DECLARE
    v_least_cost_movie dvds.Title%TYPE;
    v_highest_cost_movie dvds.Title%TYPE;
BEGIN
    SELECT Title INTO v_least_cost_movie
    FROM (
    SELECT Title
    FROM dvds
    ORDER BY COST)
    WHERE ROWNUM  = 1;
    
    SELECT Title INTO v_highest_cost_movie
    FROM (
    SELECT Title
    FROM dvds
    ORDER BY COST DESC)
    WHERE ROWNUM  = 1;
    
    DBMS_OUTPUT.PUT_LINE('Least Cost Movie: ' || v_least_cost_movie);
    DBMS_OUTPUT.PUT_LINE('Highest Cost Movie: ' || v_highest_cost_movie);
END;
/

--Q3Show all the details of a customer and the movies they are renting.

SET SERVEROUTPUT ON;
DECLARE
    v_customer_id customer_list.CustomerID%TYPE := 'FE';
BEGIN
    FOR rental IN (SELECT c.FirstName, c.LastName, d.Title, r.RentalDate
                   FROM customer_list c
                   JOIN dvd_rental r ON c.CustomerID = r.CustomerID
                   JOIN dvds d ON r.TapeID = d.TapeID
                   WHERE c.CustomerID = v_customer_id)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Customer: ' || rental.FirstName || ' ' || rental.LastName ||
                             ', Movie: ' || rental.Title ||
                             ', Rental Date: ' || TO_CHAR(rental.RentalDate, 'MM/DD/YYYY'));
    END LOOP;
END;
/

--Q4:Show the names of the customers and the number of movies rented by them.

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_customer_rental_count IS
        SELECT cl.FirstName, cl.LastName, COUNT(dr.RentalID) AS RentalCount
        FROM customer_list cl
        LEFT JOIN dvd_rental dr ON cl.CustomerID = dr.CustomerID
        GROUP BY cl.FirstName, cl.LastName;
BEGIN
    FOR customer IN c_customer_rental_count LOOP
        DBMS_OUTPUT.PUT_LINE(customer.FirstName || ' ' || customer.LastName || ' - ' || customer.RentalCount || ' movies rented');
    END LOOP;
END;
/

--Q5:What is the difference between DVD cost and the average cost of all the DVDs of each year.

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_avg_dvd_cost_per_year IS
        SELECT Year, AVG(Cost) AS AvgCost
        FROM dvds
        GROUP BY Year;
    v_difference DECIMAL(10, 2);
BEGIN
    FOR year_cost IN c_avg_dvd_cost_per_year LOOP
        FOR dvd_info IN (SELECT Title, Cost
                         FROM dvds
                         WHERE Year = year_cost.Year) LOOP
            v_difference := dvd_info.Cost - year_cost.AvgCost;
            DBMS_OUTPUT.PUT_LINE('Title: ' || dvd_info.Title || ', Year: ' || year_cost.Year || ', Difference: ' || v_difference);
END LOOP;
END LOOP;
END;
/


--Q6:Show the titles and cost of DVDs which are with the third and fourth highest price.

SET SERVEROUTPUT ON;
DECLARE
    v_third_highest_price dvds.Cost%TYPE;
    v_fourth_highest_price dvds.Cost%TYPE;
BEGIN
    SELECT Cost INTO v_third_highest_price
    FROM (SELECT Cost, RANK() OVER (ORDER BY Cost DESC) AS rank
          FROM dvds)
    WHERE rank = 3;
    
    SELECT Cost INTO v_fourth_highest_price
    FROM (SELECT Cost, RANK() OVER (ORDER BY Cost DESC) AS rank
          FROM dvds)
    WHERE rank = 4;
    
    DBMS_OUTPUT.PUT_LINE('Third Highest Price: ' || v_third_highest_price);
    DBMS_OUTPUT.PUT_LINE('Fourth Highest Price: ' || v_fourth_highest_price);
END;
/

--Q7:Show the first name, movie name, and cumulative prices for each movie in increasing order.

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_cumulative_prices IS
        SELECT cl.FirstName, d.Title, SUM(d.Cost) OVER 
        (PARTITION BY r.TapeID ORDER BY r.RentalDate) AS CumulativePrice
        FROM customer_list cl
        JOIN dvd_rental r ON cl.CustomerID = r.CustomerID
        JOIN dvds d ON r.TapeID = d.TapeID
        ORDER BY CumulativePrice;
BEGIN
    FOR cumulative_info IN c_cumulative_prices LOOP
        DBMS_OUTPUT.PUT_LINE('Customer: ' || cumulative_info.FirstName || ', Movie: ' 
        || cumulative_info.Title || ', Cumulative Price: ' || cumulative_info.CumulativePrice);
    END LOOP;
END;
/




--PART C :-
--COMPLETED BY := HARLEEN KAUR - 991707028

--DIMENSION TABLE

CREATE TABLE DIM_TITLE (
    T_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(255)
);

CREATE TABLE DIM_YEAR (
    Y_ID NUMBER PRIMARY KEY,
    Year NUMBER
);

CREATE TABLE DIM_CATEGORY (
    C_ID INT PRIMARY KEY,
    CategoryName VARCHAR2(255)NOT NULL
);

CREATE TABLE DIM_RATING (
    R_ID NUMBER PRIMARY KEY,
    Rating VARCHAR2(5)
);

CREATE TABLE DIM_ACTIONONRETURN (
    A_ID NUMBER PRIMARY KEY,
    ActionOnReturn VARCHAR2(50) 
);


--INSERT DATA IN DIMENSION TABLE

INSERT INTO DIM_TITLE (T_ID, Title)
SELECT DISTINCT TapeID, Title FROM dvds;

INSERT INTO DIM_YEAR (Y_ID, Year)
SELECT DISTINCT ROWNUM,Year FROM dvds;

INSERT INTO DIM_CATEGORY (C_ID, CategoryName)
SELECT DISTINCT D.CategoryID AS C_ID, C.CategoryName
FROM dvds d JOIN movie_category C ON D.CategoryID = C.CategoryID;


INSERT INTO DIM_RATING (R_ID, Rating)
SELECT DISTINCT ROWNUM, Rating FROM dvds;

INSERT INTO DIM_ACTIONONRETURN (A_ID, ActionOnReturn)
SELECT DISTINCT ROWNUM, ActionOnReturn FROM dvds;


--FACT TABLE


 CREATE TABLE FACT_DVDS (
    FactID NUMBER PRIMARY KEY,
    T_ID NUMBER,
    Y_ID NUMBER,
    Cost DECIMAL(5,2),
    C_ID NUMBER,
    RentedOut CHAR(1),
    R_ID NUMBER,
    A_ID NUMBER
    
);


--INSERT DATA IN FACT TABLE


DECLARE
    v_fact_id NUMBER := 1; 
    v_t_id NUMBER;
    v_y_id NUMBER := 1;
    v_cost DECIMAL(5,2);
    v_c_id NUMBER;
    v_rented_out CHAR(1);
    v_r_id NUMBER := 1; 
    v_a_id NUMBER := 1;

    CURSOR cr_dvds IS
        SELECT TapeID, Cost, CategoryID, RentedOut
        FROM dvds;

BEGIN
    OPEN cr_dvds;
    
    LOOP
        FETCH cr_dvds INTO v_t_id, v_cost, v_c_id, v_rented_out;
        EXIT WHEN cr_dvds%NOTFOUND;
        INSERT INTO FACT_DVDS (FactID, T_ID, Y_ID, Cost, C_ID, RentedOut, R_ID, A_ID)
        VALUES (v_fact_id, v_t_id, v_t_id, v_cost, v_c_id, v_rented_out, v_r_id, v_a_id);

        v_fact_id := v_fact_id + 1;
    END LOOP;
    
    CLOSE cr_dvds;
END;
/

--Total cost for each category:
SELECT v.CategoryName, SUM(d.Cost) AS TotalCost
FROM dvds d
INNER JOIN movie_category v ON d.CategoryID = v.CategoryID
GROUP BY v.CategoryName;


--Total cost for each year:
SELECT Year, SUM(Cost) AS TotalCost
FROM dvds
GROUP BY Year;


--Total cost for each rating:
SELECT Rating, SUM(Cost) AS TotalCost
FROM dvds
GROUP BY Rating;


