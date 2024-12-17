use dbms

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50) NOT NULL,            
    last_name VARCHAR(50) NOT NULL,             
    age INT NOT NULL,                          
    grade VARCHAR(50)                         
);

show tables

DESCRIBE students

SELECT * FROM students

INSERT INTO students (first_name, last_name, age, grade)
VALUES
('Alice', 'Johnson', 22, 'A+'),
('Bob', 'Smith', 20, 'B'),
('Charlie', 'Williams', 21, 'C'),
('David', 'Brown', 23, 'B+'),
('Eva', 'Davis', 19, 'A'),
('Frank', 'Jones', 22, 'C+');
