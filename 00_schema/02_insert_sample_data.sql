-- Insert departments
INSERT INTO departments VALUES (1, 'IT', 'Kigali');
INSERT INTO departments VALUES (2, 'Human Resources', 'Musanze');
INSERT INTO departments VALUES (3, 'Finance', 'Huye');
INSERT INTO departments VALUES (4, 'Marketing', 'Rubavu');

-- Insert employees
INSERT INTO employees VALUES
(101, 'Alice Uwase', 1, 'Software Developer', 850000, DATE '2024-01-15');

INSERT INTO employees VALUES
(102, 'John Mugisha', 2, 'HR Manager', 950000, DATE '2023-06-10');

INSERT INTO employees VALUES
(103, 'Grace Uwera', 3, 'Accountant', 700000, DATE '2024-03-20');

INSERT INTO employees VALUES
(104, 'Eric Ndayishimiye', 1, 'IT Technician', 600000, DATE '2025-02-05');

INSERT INTO employees VALUES
(105, 'Diane Mukamana', 4, 'Marketing Officer', 650000, DATE '2024-09-12');

COMMIT;
