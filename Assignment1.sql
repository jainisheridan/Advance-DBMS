//Jaini Bhaveshbhai Topiwala

//Que1 - Write a SQL query to display the department ID, department name, job ID, the average salary for that job within the department, and the number of employees with that job in each department. Use HR database.

SET SERVEROUTPUT ON;

DECLARE
  CURSOR employee_cursor IS
    SELECT employee_id, first_name, last_name, salary, commission_pct
    FROM HR.EMPLOYEES;

  TYPE EmployeeRec IS RECORD (
    EmpID HR.EMPLOYEES.employee_id%TYPE,
    FirstName HR.EMPLOYEES.first_name%TYPE,
    LastName HR.EMPLOYEES.last_name%TYPE,
    Salary HR.EMPLOYEES.salary%TYPE,
    Commission HR.EMPLOYEES.commission_pct%TYPE
  );

  employee_rec EmployeeRec;
  total_comp NUMBER;

BEGIN
  OPEN employee_cursor;
  LOOP
    FETCH employee_cursor INTO employee_rec;
    EXIT WHEN employee_cursor%NOTFOUND;
    
    IF employee_rec.Commission IS NULL THEN
      total_comp := employee_rec.Salary;
    ELSE
      total_comp := employee_rec.Salary + (employee_rec.Salary * employee_rec.Commission);
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || employee_rec.EmpID || 
                         ' Name: ' || employee_rec.FirstName || ' ' || employee_rec.LastName || 
                         ' Salary: ' || employee_rec.Salary || 
                         ' Total Compensation: ' || total_comp);
  END LOOP;
  CLOSE employee_cursor;
END;
/

//Que2 - Write a PL/SQL block to find out how many cars has a salesman sold. You have to prompt the user for the salesman’s name. Use SI database. 

SET SERVEROUTPUT ON;

DECLARE
  v_salesman_name VARCHAR2(100) := '&salesman_name'; 
  v_cars_sold NUMBER;

BEGIN
 
  SELECT COUNT(*) INTO v_cars_sold
  FROM SI.SALEINV
  WHERE SALESMAN = v_salesman_name;

  
  DBMS_OUTPUT.PUT_LINE('Salesman ' || v_salesman_name || ' has sold ' || v_cars_sold || ' cars.');
END;
/

//Que3 - Create a PL/SQL script to print the average sale price of the cars sold for each make and model, having the average sale price greater than 40500. Use SI database.

SET SERVEROUTPUT ON;

DECLARE
  CURSOR avg_price_cursor IS
    SELECT c.CARMAKE, c.CARMODEL, AVG(s.CARSALEPRICE) as avg_sale_price
    FROM SI.CAR c
    JOIN SI.SALEINV s ON c.CARSERIAL = s.CARSERIAL
    GROUP BY c.CARMAKE, c.CARMODEL
    HAVING AVG(s.CARSALEPRICE) > 40500;

  TYPE AvgPriceRec IS RECORD (
    CarMake SI.CAR.CARMAKE%TYPE,
    CarModel SI.CAR.CARMODEL%TYPE,
    AvgSalePrice NUMBER
  );

  avg_price_rec AvgPriceRec;

BEGIN
  OPEN avg_price_cursor;
  LOOP
    FETCH avg_price_cursor INTO avg_price_rec;
    EXIT WHEN avg_price_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Make: ' || avg_price_rec.CarMake || 
                         ', Model: ' || avg_price_rec.CarModel || 
                         ', Average Sale Price: ' || avg_price_rec.AvgSalePrice);
  END LOOP;
  CLOSE avg_price_cursor;
END;
/

//Que4 - Create a PL/SQL  script that retrieves and displays information for all employees in the Employees table. For each employee, if the commission is null, print only the salary; otherwise, print the total amount, which is the sum of the salary and the salary multiplied by the commission percentage. Us HR database.

SET SERVEROUTPUT ON;

DECLARE
  CURSOR employee_cursor IS
    SELECT employee_id, first_name, last_name, salary, commission_pct
    FROM HR.employees;
    
  TYPE EmployeeRec IS RECORD (
    EmpID HR.employees.employee_id%TYPE,
    FirstName HR.employees.first_name%TYPE,
    LastName HR.employees.last_name%TYPE,
    Salary HR.employees.salary%TYPE,
    Commission HR.employees.commission_pct%TYPE
  );

  employee_rec EmployeeRec;
  total_salary NUMBER;

BEGIN
  OPEN employee_cursor;
  LOOP
    FETCH employee_cursor INTO employee_rec;
    EXIT WHEN employee_cursor%NOTFOUND;
    
    IF employee_rec.Commission IS NULL THEN
      total_salary := employee_rec.Salary;
    ELSE
      total_salary := employee_rec.Salary + (employee_rec.Salary * employee_rec.Commission);
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || employee_rec.EmpID || 
                         ', Name: ' || employee_rec.FirstName || ' ' || employee_rec.LastName || 
                         ', Salary: ' || employee_rec.Salary || 
                         ', Total Compensation: ' || total_salary);
  END LOOP;
  CLOSE employee_cursor;
END;
/