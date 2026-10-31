CREATE OR REPLACE PROCEDURE show_employee_record
AS
    TYPE employee_record_type IS RECORD (
        emp_id NUMBER,
        emp_name VARCHAR2(100),
        emp_job VARCHAR2(100),
        emp_salary NUMBER(10,2)
    );

    v_employee employee_record_type;

BEGIN
    SELECT employee_id,
           employee_name,
           job_title,
           salary
    INTO v_employee
    FROM employees
    WHERE employee_id = 102;

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee.emp_name);
    DBMS_OUTPUT.PUT_LINE('Job Title: ' || v_employee.emp_job);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_employee.emp_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
