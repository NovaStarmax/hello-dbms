SHOW COLUMNS FROM students;

DESCRIBE students;

SELECT first_name, age FROM students WHERE age > 20

SELECT first_name, grade
FROM students
ORDER BY FIELD(grade, 'A+', 'A', 'B+', 'B', 'C+', 'C');
 

SELECT first_name, grade
FROM students
ORDER BY FIELD(grade, 'A+', 'A', 'B+', 'B', 'C+', 'C') DESC;