CREATE OR REPLACE PROCEDURE update_employee_salary (
    p_employee_id IN NUMBER,
    p_new_salary IN NUMBER
)
AS
BEGIN
    IF p_new_salary <= 0 OR p_new_salary IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary must be greater than zero.'
        );
    END IF;

    UPDATE employees
    SET salary = p_new_salary
    WHERE employee_id = p_employee_id;

    DBMS_OUTPUT.PUT_LINE(
        'Rows updated: ' || SQL%ROWCOUNT
    );

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee salary updated successfully.'
        );
    END IF;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee not found.'
        );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
        RAISE;
END;
/
