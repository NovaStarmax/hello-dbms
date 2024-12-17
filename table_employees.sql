use dbms

CREATE TABLE employees (  
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate VARCHAR(50),
    position VARCHAR(50),
    department_id INT
);

show tables

DESCRIBE employees

SELECT * FROM employees

INSERT INTO employees (first_name, last_name, birthdate, position, department_id)
VALUES
('John', 'Doe', '1990-05-01', 'Software Engineer', 1),
('Jane', 'Smith', '1985-08-02', 'Project Manager', 2),
('Mike', 'Johnson', '1992-03-10', 'Data Analyst', 1),
('Emily', 'Brown', '1988-12-01',  'UX Designer', 1),
('Alex', 'Williams', '1995-06-02', 'Software Developer', 1),
('Sarah', 'Miller', '1987-09-01',  'HR Specialist', 3),
('Ethan', 'Clark', '1991-02-14', 'Database Administrator', 1),
('Olivia', 'Garcia', '1984-07-02', 'Marketing Manager', 2),
('Emilia', 'Clark', '1986-01-12', 'HR Manager', 3),
('Daniel', 'Taylor', '1993-11-05',  'Systems Analyst', 1),
('William', 'Lee', '1994-08-01', 'Software Engineer', 1),
('Sophia', 'Baker', '1990-06-02',  'IT Manager', 2);