CREATE OR REPLACE FUNCTION calculate_annual_salary (
    p_employee_id IN NUMBER
)
RETURN NUMBER
AS
    v_monthly_salary employees.salary%TYPE;
    v_annual_salary NUMBER;

BEGIN
    SELECT salary
    INTO v_monthly_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    v_annual_salary := v_monthly_salary * 12;

    RETURN v_annual_salary;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Employee not found.'
        );

    WHEN OTHERS THEN
        RAISE;
END;
/
