CREATE OR REPLACE PROCEDURE bulk_update_salaries
AS
    TYPE employee_id_table IS TABLE OF employees.employee_id%TYPE;

    v_employee_ids employee_id_table;

BEGIN
    SELECT employee_id
    BULK COLLECT INTO v_employee_ids
    FROM employees;

    IF v_employee_ids.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found.');
        RETURN;
    END IF;

    FORALL i IN 1 .. v_employee_ids.COUNT
        UPDATE employees
        SET salary = salary * 1.10
        WHERE employee_id = v_employee_ids(i);

    DBMS_OUTPUT.PUT_LINE(
        'Total employees updated: ' || SQL%ROWCOUNT
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
