# IMPLEMENTATION NOTES

## 1. Project Title

Advanced Oracle PL/SQL – Employee Management System

## 2. Project Overview

This project demonstrates advanced Oracle PL/SQL programming techniques using an Employee Management System.

The system manages employee information, departments, salaries, and employee records.

The project was developed using Oracle Database and Oracle SQL Developer.

## 3. Database Design

The database contains two related tables:

**Departments Table**

* department_id – Primary key
* department_name – Department name
* location – Department location

**Employees Table**

* employee_id – Primary key
* employee_name – Employee name
* department_id – Foreign key referencing departments
* job_title – Employee job title
* salary – Employee salary
* hire_date – Employee hiring date

The database contains four departments and five sample employees.

## 4. PL/SQL Features Implemented

### 4.1 Records

The project uses `%ROWTYPE` and user-defined records to retrieve and store employee information.

### 4.2 Collections

Associative arrays are used to store multiple employee names in memory.

### 4.3 Implicit Cursors

Implicit cursor attributes, including `SQL%ROWCOUNT`, `SQL%FOUND`, and `SQL%NOTFOUND`, are used to check the results of INSERT, UPDATE, and DELETE operations.

### 4.4 Explicit Cursors

An explicit cursor retrieves employee records using OPEN, FETCH, and CLOSE statements.

### 4.5 Bulk Processing

`BULK COLLECT` retrieves multiple employee records efficiently.

`FORALL` performs multiple salary updates.

### 4.6 Stored Procedures

The project includes procedures for displaying employee details, managing salaries, processing collections, and handling exceptions.

### 4.7 Stored Functions

The `calculate_annual_salary` function calculates an employee's annual salary by multiplying the monthly salary by 12.

### 4.8 Exception Handling

The project demonstrates predefined and user-defined exceptions.

Custom error messages are generated using `RAISE_APPLICATION_ERROR`.

### 4.9 Bulk Error Handling

The project uses `SAVE EXCEPTIONS` and `SQL%BULK_EXCEPTIONS` to identify errors during bulk salary updates.

## 5. Testing

Successful and error test cases were developed to verify the PL/SQL programs.

The tests cover:

* Employee record retrieval
* Collections and cursors
* Salary updates
* Annual salary calculations
* Invalid salary values
* Missing employee records
* User-defined exceptions
* Bulk processing errors

Screenshots of test results are stored in the `screenshots` folder.

## 6. Performance Considerations

`BULK COLLECT` reduces repeated transfers between SQL and PL/SQL when retrieving multiple rows.

`FORALL` reduces context-switching overhead when performing multiple DML operations.

These techniques can improve performance when processing large datasets.

For this assignment, a small sample dataset was used to demonstrate the techniques. No formal performance benchmark was conducted.

## 7. Error Handling

The system uses exception handling to manage invalid operations and unexpected database errors.

Examples include:

* ORA-20001: Invalid salary
* ORA-20002: Employee not found
* ORA-20003: Salary below the minimum
* ORA-20004: Employee does not exist
* ORA-24381: Bulk processing errors

## 8. Conclusion

The Employee Management System demonstrates advanced Oracle PL/SQL concepts, including records, collections, cursors, bulk processing, stored procedures, functions, and exception handling.

The project provides practical experience in developing and testing reusable database programs.
## 9. Testing and Validation

### 9.1 Testing Environment

The Employee Management System was developed and tested using Oracle Database and Oracle SQL Developer.

The database contains two tables: `departments` and `employees`.

### 9.2 Successful Test Cases

The following successful tests were performed:

1. **Employee Details:** Retrieved employee information using `%ROWTYPE`.
2. **User-Defined Records:** Displayed employee information using a custom PL/SQL record.
3. **Collections:** Retrieved multiple employee names using an associative array and `BULK COLLECT`.
4. **Explicit Cursors:** Displayed employee records using `OPEN`, `FETCH`, and `CLOSE`.
5. **Stored Function:** Calculated an employee's annual salary.
6. **Salary Validation:** Verified that valid employee salaries were accepted.
7. **Implicit Cursors:** Tested `SQL%ROWCOUNT`, `SQL%FOUND`, and `SQL%NOTFOUND`.
8. **Bulk Processing:** Updated multiple employee salaries using `FORALL`.

### 9.3 Error Test Cases

The following error conditions were tested:

| Error Code | Description              |
| ---------- | ------------------------ |
| ORA-20001  | Invalid employee salary  |
| ORA-20002  | Employee not found       |
| ORA-20003  | Salary below the minimum |
| ORA-20004  | Employee does not exist  |
| ORA-24381  | Bulk processing errors   |

### 9.4 Bulk Processing Validation

Bulk processing was demonstrated using `BULK COLLECT` and `FORALL`.

The `SAVE EXCEPTIONS` clause allowed Oracle to collect errors during bulk operations.

The `SQL%BULK_EXCEPTIONS` collection was used to identify failed operations and their corresponding error codes.

### 9.5 Test Evidence

Screenshots of Oracle SQL Developer execution results are stored in the `screenshots` folder.

The SQL test scripts are available in:

* `03_tests/test_success_cases.sql`
* `03_tests/test_error_cases.sql`

### 9.6 Testing Conclusion

The successful tests demonstrated the expected behavior of the PL/SQL procedures and function.

The error tests demonstrated how the system handles invalid inputs, missing records, and bulk processing errors. 
