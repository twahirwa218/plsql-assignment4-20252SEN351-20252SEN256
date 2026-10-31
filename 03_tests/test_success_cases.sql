-- Assignment IV: Successful Test Cases
-- Oracle PL/SQL

SET SERVEROUTPUT ON;

-- Test 1: Employee details using %ROWTYPE
BEGIN
    get_employee_details(101);
END;
/

-- Test 2: User-defined record
BEGIN
    show_employee_record;
END;
/

-- Test 3: Associative array and BULK COLLECT
BEGIN
    show_employee_collection;
END;
/

-- Test 4: Explicit cursor
BEGIN
    show_all_employees;
END;
/

-- Test 5: Annual salary function
DECLARE
    v_annual_salary NUMBER;
BEGIN
    v_annual_salary := calculate_annual_salary(101);

    DBMS_OUTPUT.PUT_LINE(
        'Annual Salary: ' || v_annual_salary || ' RWF'
    );
END;
/

-- Test 6: Valid employee salary
BEGIN
    check_employee_salary(101);
END;
/

-- Test 7: Implicit cursor with UPDATE
-- Changes are rolled back after testing.
SAVEPOINT before_update_test;

BEGIN
    update_employee_salary(101, 900000);
END;
/

ROLLBACK TO before_update_test;

-- Test 8: BULK COLLECT and FORALL
-- Changes are rolled back after testing.
SAVEPOINT before_bulk_test;

BEGIN
    bulk_update_salaries;
END;
/

ROLLBACK TO before_bulk_test;
