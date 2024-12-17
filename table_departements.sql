use dbms

CREATE TABLE departements (
    department_id INT AUTO_INCREMENT PRIMARY KEY,  
    department_name VARCHAR(50),
    department_head INT,
    location VARCHAR(50)
);

show tables

DESCRIBE departements

SELECT * FROM departements

INSERT INTO departements (department_name, department_head,location)
VALUES
('IT', 11, 'Headquarters'),
('Project Management', 2, 'Branch Office West'),
('Human Resources', 6, 'Branch Office East')
