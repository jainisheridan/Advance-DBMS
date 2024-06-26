/*Ques 1: Using a PL/SQL stored procedure and making appropriate call to the procedure. Show the Customers  names and the number of cars they have purchased 
by the customer whose ID will be provided by the user at runtime. Consider: If the customer has made atleast two purchases, then print that a discount 
of 5% should be applied to the customer and return implicitly that total value of the car and print that value in the procedure call. If the customer 
has made atleast five purchases, then print that a discount of 10% should be applied to the customer and return implicitly that total value of the car and 
print that value in the procedure call.*/

Create or Replace Procedure get_customer_discounts (
    p_cust_id in si.customer.custname%type,
    o_total_value out Number
) as
    v_num_cars Number;
    v_total_cost Number;
    
Begin

    Select Count(*)
    Into v_num_cars
    From SI.CAR
    Where CUSTNAME = p_cust_id;

    Select Sum(CARLISTPRICE)
    Into v_total_cost
    From si.car
    Where CUSTNAME = p_cust_id;

    If v_num_cars >= 5 Then
        DBMS_OUTPUT.PUT_LINE('A discount of 10% should be applied.');
        o_total_value := v_total_cost * 0.9; 
    Elsif v_num_cars >= 2 Then
        DBMS_OUTPUT.PUT_LINE('A discount of 5% should be applied.');
        o_total_value := v_total_cost * 0.95; 
    Else
        o_total_value := v_total_cost;
    End If;

    DBMS_OUTPUT.PUT_LINE('Total value of the cars after discount is: ' || TO_CHAR(o_total_value));
End get_customer_discounts;
/

Declare 
    v_total_value Number;
    
Begin
    get_customer_discounts('customer_id_here', v_total_value);
    
End;
/



/*Ques 2: Create a PL/SQL script that implements user defined function to print mailing labels for customers who own a given make, model and year of a car. 
The detail of the customer must be provided by the user at the execution of the function call. The three values must be entered by the user.  
Print the input parameters in the first label. Print each label on three lines with one blank line between each label.*/


SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION print_mailing_labels(
    p_make IN SI.CAR.CARMAKE%TYPE,
    p_model IN SI.CAR.CARMODEL%TYPE,
    p_year IN SI.CAR.CARYEAR%TYPE
) RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT 'Customer Name: ' || C.CUSTNAME || CHR(10) ||
               'Street: ' || C.CUSTSTREET || CHR(10) ||
               'City/Prov/Postal: ' || C.CUSTCITY || ', ' || C.CUSTPROVINCE || ' ' || C.CUSTPOSTAL || CHR(10) || CHR(10) AS label
        FROM SI.CUSTOMER C
        JOIN SI.CAR A ON C.CUSTNAME = A.CUSTNAME
        WHERE A.CARMAKE = p_make AND A.CARMODEL = p_model AND A.CARYEAR = p_year;

    RETURN v_cursor;
END print_mailing_labels;
/

ACCEPT p_make PROMPT 'Please enter the car make: ';
ACCEPT p_model PROMPT 'Please enter the car model: ';
ACCEPT p_year PROMPT 'Please enter the car year: ';

DECLARE
    v_labels_cursor SYS_REFCURSOR;
    v_label VARCHAR2(4000);
BEGIN
    v_labels_cursor := print_mailing_labels('&p_make', '&p_model', '&p_year');

    LOOP
        FETCH v_labels_cursor INTO v_label;
        EXIT WHEN v_labels_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_label);
    END LOOP;

    CLOSE v_labels_cursor;
END;
/



/* Ques 3: Create a copy of the table from si.servinv using SQL query. Create a PL/SQL script using stored procedure that updates the laborcost 
for a specific servinvno.   Remember that by updating the laborcost you also need to update: tax = (laborcost + partscost)*0.13.*/



CREATE TABLE SI.SERVINV_COPY AS SELECT * FROM SI.SERVINV;


CREATE OR REPLACE PROCEDURE UpdateLaborCostAndTax(
    p_ServInvNo IN SI.SERVINV.SERVINVNO%TYPE,
    p_NewLaborCost IN SI.SERVINV.LABORCOST%TYPE
)
IS
    v_PartsCost NUMBER;
    v_TaxRate NUMBER := 0.13; 
BEGIN
    SELECT PARTSCOST INTO v_PartsCost
    FROM SI.SERVINV
    WHERE SERVINVNO = p_ServInvNo;

    UPDATE SI.SERVINV
    SET LABORCOST = p_NewLaborCost,
        TAXRATE = (p_NewLaborCost + v_PartsCost) * v_TaxRate 
    WHERE SERVINVNO = p_ServInvNo;

    DBMS_OUTPUT.PUT_LINE('Service Invoice Number: ' || p_ServInvNo);
    DBMS_OUTPUT.PUT_LINE('New Labor Cost: ' || p_NewLaborCost);
    DBMS_OUTPUT.PUT_LINE('New Tax Rate: ' || (p_NewLaborCost + v_PartsCost) * v_TaxRate);

END;
/

/* Ques 4: Create a copy of Employees table in hr database using SQL query. Using a PL/SQL script, create a user defined function that updates 
the email of the Record for the employee whose input for employee id is from the user, and returns message about the email that is updated. 
Print the message as well.*/


CREATE TABLE Employees_copy AS SELECT * FROM hr.Employees;

CREATE TABLE Employees_copy AS SELECT * FROM hr.Employees;

CREATE OR REPLACE FUNCTION UpdateEmployeeEmail(
    p_EmpId IN Employees_copy.Employee_Id%TYPE,
    p_Email IN Employees_copy.Email%TYPE
) RETURN VARCHAR2
IS
    v_Message VARCHAR2(100);
BEGIN
   
    UPDATE Employees_copy
    SET Email = p_Email
    WHERE Employee_Id = p_EmpId;
    

    v_Message := 'Email updated to ' || p_Email || ' for employee ID ' || p_EmpId;
    
  
    RETURN v_Message;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
      
        RETURN 'No employee found with ID ' || p_EmpId;
    WHEN OTHERS THEN
        
        RETURN 'An unexpected error occurred.';
END UpdateEmployeeEmail;
/

DECLARE
    v_EmpId Employees_copy.Employee_Id%TYPE := &emp_id; 
    v_Email Employees_copy.Email%TYPE := &emp_email; 
    v_Message VARCHAR2(100);
BEGIN

    v_Message := UpdateEmployeeEmail(v_EmpId, v_Email);
    
   
    DBMS_OUTPUT.PUT_LINE(v_Message);
END;
/


