CREATE OR REPLACE PROCEDURE get_employee_details (
    p_employee_id IN NUMBER
)
AS
    v_employee employees%ROWTYPE;

BEGIN
    SELECT *
    INTO v_employee
    FROM employees
    WHERE employee_id = p_employee_id;

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.employee_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee.employee_name);
    DBMS_OUTPUT.PUT_LINE('Job Title: ' || v_employee.job_title);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_employee.salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
