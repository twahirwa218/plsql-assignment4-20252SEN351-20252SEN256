CREATE OR REPLACE PROCEDURE show_all_employees
AS
    CURSOR emp_cursor IS
        SELECT employee_id, employee_name, salary
        FROM employees
        ORDER BY employee_id;

    v_emp_id employees.employee_id%TYPE;
    v_emp_name employees.employee_name%TYPE;
    v_salary employees.salary%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor
        INTO v_emp_id, v_emp_name, v_salary;

        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_emp_id ||
            ' | Name: ' || v_emp_name ||
            ' | Salary: ' || v_salary
        );
    END LOOP;

    CLOSE emp_cursor;

EXCEPTION
    WHEN OTHERS THEN
        IF emp_cursor%ISOPEN THEN
            CLOSE emp_cursor;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
