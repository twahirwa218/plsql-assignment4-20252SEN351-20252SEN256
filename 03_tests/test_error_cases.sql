-- Assignment IV: Error Test Cases
-- Oracle PL/SQL

SET SERVEROUTPUT ON;

-- Test 1: Invalid salary
-- Expected: ORA-20001
BEGIN
    update_employee_salary(101, -5000);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Test 1 - Expected error: ' || SQLERRM);
END;
/

-- Test 2: Employee does not exist
-- Expected: ORA-20002
BEGIN
    DBMS_OUTPUT.PUT_LINE(calculate_annual_salary(999));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Test 2 - Expected error: ' || SQLERRM);
END;
/

-- Test 3: User-defined exception
-- Expected: ORA-20003
SAVEPOINT before_salary_error_test;

UPDATE employees
SET salary = 200000
WHERE employee_id = 101;

BEGIN
    check_employee_salary(101);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Test 3 - Expected error: ' || SQLERRM);
END;
/

ROLLBACK TO before_salary_error_test;

-- Test 4: Missing employee
-- Expected: ORA-20004
BEGIN
    check_employee_salary(999);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Test 4 - Expected error: ' || SQLERRM);
END;
/

-- Test 5: Bulk error handling
-- Expected: ORA-24381 and constraint violation 2290
SAVEPOINT before_bulk_error_test;

BEGIN
    bulk_salary_error_handling;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Test 5 - Expected error: ' || SQLERRM);
END;
/

ROLLBACK TO before_bulk_error_test;
