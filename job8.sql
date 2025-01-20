-- J’ai cassé les requetes sql, il faut reprendre le nmo des bonnes tables, la logique y est (une requete gpt peut marché)

--1
CREATE DATABASE IF NOT EXISTS SomeCompany;
USE SomeCompany;

--2
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    position VARCHAR(50),
    departements_id INT,
    FOREIGN KEY (departements_id) REFERENCES departements(departements_id)
);

--3
CREATE TABLE departements (
    departements_id INT PRIMARY KEY,
    departements_name VARCHAR(50),
    departements_head INT,
    location VARCHAR(100),
    FOREIGN KEY (departements_head) REFERENCES employees(employee_id)
);

--4
INSERT INTO employees (employee_id, first_name, last_name, birthdate, position, departements_id)
VALUES
(1, 'John', 'Doe', '1990-05-15', 'Software Engineer', 1),
(2, 'Jane', 'Smith', '1985-08-20', 'Project Manager', 2),
(3, 'Mike', 'Johnson', '1992-03-10', 'Data Analyst', 1),
(4, 'Emily', 'Brown', '1988-12-03', 'UX Designer', 1),
(5, 'Alex', 'Williams', '1995-06-28', 'Software Developer', 1),
(6, 'Sarah', 'Miller', '1987-09-18', 'HR Specialist', 3),
(7, 'Ethan', 'Clark', '1991-02-14', 'Database Administrator', 1);

--5
SELECT first_name, last_name, position
FROM employees;

--6
UPDATE employees
SET position = 'Senior Software Engineer'
WHERE first_name = 'John' AND last_name = 'Doe';

--7
DELETE FROM employees
WHERE first_name = 'Ethan' AND last_name = 'Clark';

--8
SELECT e.first_name, e.last_name, d.departements_name, d.location
FROM employees e
JOIN departements d ON e.departements_id = d.departements_id;

--9
SELECT first_name, last_name
FROM employees
WHERE departements_id = 1;

SELECT first_name, last_name
FROM employees
WHERE departements_id = 3;

--10 À DEBUG
SELECT d.departements_name, e.first_name AS manager_first_name, e.last_name AS manager_last_name
FROM departements d
JOIN employees e ON d.departements_head = e.employee_id
ORDER BY d.departements_name;

--11 À DEBUG
INSERT INTO departements (departements_id, departements_name, departements_head, location)
VALUES (4, 'Marketing', 8, 'Branch Office West');
INSERT INTO Employees (employee_id, first_name, last_name, birthdate, position, departements_id)
VALUES (8, 'Olivia', 'Garcia', '1984-07-22', 'Marketing Manager', 4);


--12
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    departements_id INT,
    FOREIGN KEY (departements_id) REFERENCES departements(departements_id)
);


