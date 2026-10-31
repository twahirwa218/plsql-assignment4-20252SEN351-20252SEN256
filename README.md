# Advanced Oracle PL/SQL – Assignment IV

## Employee Management System

### 1. Project Overview

This project was developed for **Assignment IV: Advanced Oracle PL/SQL**.

It demonstrates advanced PL/SQL programming techniques using an Employee Management System.

The system manages employees, departments, salaries, and employee information.

### 2. Student Information

**Course:** Database Development with PL/SQL (INSY 8311)

**Instructor:** Eric Maniraguha

**Group Members:**

1. [INEZA TWAHIRWA Shemsa] – [20252SEN352]
2. [NEZA FAITH Nina] – [20252SEN256]

### 3. Technologies Used

* Oracle Database
* Oracle SQL Developer
* PL/SQL
* SQL
* GitHub

### 4. Database Structure

The project contains two tables:

**Departments**

* Department ID
* Department Name
* Location

**Employees**

* Employee ID
* Employee Name
* Department ID
* Job Title
* Salary
* Hire Date

The Employees table references the Departments table through a foreign key.

### 5. PL/SQL Features Implemented

The project demonstrates:

1. User-defined records
2. `%ROWTYPE`
3. Associative arrays
4. Implicit cursors
5. Explicit cursors
6. `BULK COLLECT`
7. `FORALL`
8. Stored procedures
9. Stored functions
10. Predefined exceptions
11. User-defined exceptions
12. `RAISE_APPLICATION_ERROR`
13. `SAVE EXCEPTIONS`
14. `SQL%BULK_EXCEPTIONS`

### 6. Project Folder Structure

```text
00_schema/
    01_create_tables.sql
    02_insert_sample_data.sql

01_procedures/
    get_employee_details.sql
    show_employee_record.sql
    show_employee_collection.sql
    update_employee_salary.sql
    show_all_employees.sql
    bulk_update_salaries.sql
    bulk_salary_error_handling.sql
    check_employee_salary.sql

02_functions/
    calculate_annual_salary.sql

03_tests/
    test_success_cases.sql
    test_error_cases.sql

screenshots/
    PL/SQL execution screenshots

docs/
    IMPLEMENTATION_NOTES.md
```

### 7. How to Run the Project

1. Open Oracle SQL Developer.
2. Connect to an Oracle database using a user with the required privileges.
3. Execute `00_schema/01_create_tables.sql`.
4. Execute `00_schema/02_insert_sample_data.sql`.
5. Execute all SQL files in `01_procedures`.
6. Execute all SQL files in `02_functions`.
7. Enable DBMS Output using `SET SERVEROUTPUT ON`.
8. Execute `03_tests/test_success_cases.sql`.
9. Execute `03_tests/test_error_cases.sql`.

**Note:** The setup scripts are intended for a new schema. Running them again in a schema containing the same tables and employee IDs may produce errors.

### 8. Testing

The project includes successful and error test cases.

The tests demonstrate employee retrieval, salary calculations, collections, cursors, bulk operations, and exception handling.

Screenshots of execution results are available in the `screenshots` folder.

### 9. Performance Considerations

`BULK COLLECT` and `FORALL` are used to reduce context-switching overhead between PL/SQL and SQL.

The project uses a small sample dataset for demonstration purposes. No formal performance measurements were conducted.

### 10. Group Contributions

**Student 1:** [created tables and inserted them and the some of procedures and helped in pushing]

**Student 2:** [some procedures  and arranging the work correspondly and push to github]

Both group members should contribute meaningful work and commits to the repository.

### 11. AI Assistance Disclosure

ChatGPT was used to assist with understanding PL/SQL concepts, developing example SQL code, organizing project documentation, and preparing test cases.

The group is responsible for reviewing, executing, testing, and understanding the submitted code.

### 12. Conclusion

This project demonstrates practical knowledge of advanced Oracle PL/SQL programming through records, collections, cursors, bulk processing, stored procedures, functions, and exception handling.
