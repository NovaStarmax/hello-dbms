-- 1. Créer la base de données
CREATE DATABASE IF NOT EXISTS SomeCompany;
USE SomeCompany;

-- 2. Créer la table employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    position VARCHAR(50),
    departements_id INT,
    FOREIGN KEY (departements_id) REFERENCES departements(departements_id)
);

-- 3. Créer la table departements
CREATE TABLE departements (
    departements_id INT PRIMARY KEY,
    departements_name VARCHAR(50),
    departements_head INT,
    location VARCHAR(100),
    FOREIGN KEY (departements_head) REFERENCES employees(employee_id)
);

-- 4. Insérer des employés dans la table employees
INSERT INTO employees (employee_id, first_name, last_name, birthdate, position, department_id)
VALUES
(1, 'John', 'Doe', '1990-05-15', 'Software Engineer', 1),
(2, 'Jane', 'Smith', '1985-08-20', 'Project Manager', 2),
(3, 'Mike', 'Johnson', '1992-03-10', 'Data Analyst', 1),
(4, 'Emily', 'Brown', '1988-12-03', 'UX Designer', 1),
(5, 'Alex', 'Williams', '1995-06-28', 'Software Developer', 1),
(6, 'Sarah', 'Miller', '1987-09-18', 'HR Specialist', 3),
(7, 'Ethan', 'Clark', '1991-02-14', 'Database Administrator', 1);

-- 5. Récupérer le nom et le poste de tous les employés
SELECT first_name, last_name, position
FROM employees;

-- 6. Mettre à jour le poste d’un employé
UPDATE employees
SET position = 'Senior Software Engineer'
WHERE first_name = 'John' AND last_name = 'Doe';

-- 7. Supprimer un employé
DELETE FROM employees
WHERE first_name = 'Ethan' AND last_name = 'Clark';


-- 8. Afficher le nom, le département et le bureau de chaque employé
SELECT e.first_name, e.last_name, d.department_name, d.location
FROM employees e
JOIN departements d ON e.department_id = d.department_id;

-- 9. Filtrer les membres selon leur département
-- IT
SELECT first_name, last_name
FROM employees
WHERE department_id = 1;

-- Ressources Humaines
SELECT first_name, last_name
FROM employees
WHERE department_id = 3;

-- 10. Afficher les départements et leurs managers
SELECT d.department_name, e.first_name AS manager_first_name, e.last_name AS manager_last_name
FROM departements d
JOIN employees e ON d.department_head = e.employee_id
ORDER BY d.department_name;

-- 11. Ajouter un nouveau département
INSERT INTO departements (department_id, department_name, department_head, location)
VALUES (4, 'Marketing', 8, 'Branch Office West');

INSERT INTO employees (employee_id, first_name, last_name, birthdate, position, department_id)
VALUES (8, 'Olivia', 'Garcia', '1984-07-22', 'Marketing Manager', 4);

-- 12. Créer la table projects et ajouter des projets
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departements(department_id)
);

INSERT INTO projects (project_id, project_name, start_date, end_date, department_id)
VALUES
(1, 'Website Redesign', '2023-01-01', '2023-06-30', 1),
(2, 'New HR Policies', '2023-03-01', '2023-09-30', 3),
(3, 'Marketing Campaign', '2023-02-01', '2023-12-31', 4);