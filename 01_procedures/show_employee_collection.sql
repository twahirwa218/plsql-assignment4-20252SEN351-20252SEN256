CREATE OR REPLACE PROCEDURE show_employee_collection
AS
    TYPE employee_array_type IS TABLE OF
        employees.employee_name%TYPE
        INDEX BY PLS_INTEGER;

    v_employees employee_array_type;

BEGIN
    SELECT employee_name
    BULK COLLECT INTO v_employees
    FROM employees
    ORDER BY employee_id;

    DBMS_OUTPUT.PUT_LINE('Employee Collection:');

    FOR i IN 1 .. v_employees.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Employee ' || i || ': ' || v_employees(i)
        );
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
