
use dbms

CREATE TABLE nobel (  
    yr INT,
    subject VARCHAR(50),
    winner VARCHAR(50)
);

show tables

DESCRIBE nobel

SELECT * FROM nobel

INSERT INTO nobel (yr, subject, winner)
VALUES
(1960,'Chemistry', 'Willard F. Libby'),
(1960, 'Literature', 'Saint-John Perse'),
(1960, 'Medicine', 'Sir Frank Macfarlane Burnet'),
(1960, 'Medicine', 'Peter Madawar');