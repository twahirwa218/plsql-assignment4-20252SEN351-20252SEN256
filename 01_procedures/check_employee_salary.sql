CREATE OR REPLACE PROCEDURE check_employee_salary (
    p_employee_id IN NUMBER
)
AS
    v_salary employees.salary%TYPE;

    e_low_salary EXCEPTION;

BEGIN
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    IF v_salary < 300000 THEN
        RAISE e_low_salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Employee salary is acceptable: ' || v_salary
    );

EXCEPTION
    WHEN e_low_salary THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Employee salary is below the minimum of 300000 RWF.'
        );

    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Employee does not exist.'
        );

    WHEN OTHERS THEN
        RAISE;
END;
/
