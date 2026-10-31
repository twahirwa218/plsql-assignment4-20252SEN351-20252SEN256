CREATE OR REPLACE PROCEDURE bulk_salary_error_handling
AS
    TYPE emp_id_array IS TABLE OF NUMBER;
    TYPE salary_array IS TABLE OF NUMBER;

    v_emp_ids emp_id_array := emp_id_array(101, 102, 103);
    v_salaries salary_array := salary_array(900000, -5000, 750000);

    e_bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_bulk_errors, -24381);

BEGIN
    FORALL i IN 1 .. v_emp_ids.COUNT SAVE EXCEPTIONS
        UPDATE employees
        SET salary = v_salaries(i)
        WHERE employee_id = v_emp_ids(i);

    DBMS_OUTPUT.PUT_LINE('Bulk update completed successfully.');

EXCEPTION
    WHEN e_bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE(
            'Number of errors: ' || SQL%BULK_EXCEPTIONS.COUNT
        );

        FOR i IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Error at position: ' ||
                SQL%BULK_EXCEPTIONS(i).ERROR_INDEX
            );

            DBMS_OUTPUT.PUT_LINE(
                'Error code: ' ||
                SQL%BULK_EXCEPTIONS(i).ERROR_CODE
            );
        END LOOP;

        RAISE;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
