use dbms

CREATE TABLE eteam (  
    id VARCHAR(50) PRIMARY KEY,
    teamname VARCHAR(50) ,
    coach VARCHAR(50)
);

show tables

DESCRIBE eteam

SELECT * FROM eteam

INSERT INTO eteam (id, teamname, coach)
VALUES
('POL', 'Poland', 'Franciszek Smuda'),
('RUS', 'Russia','Dick Advocaat'),
('CZE', 'Czech Republic', 'Michal Bilek'),
('GRE', 'Greece', 'Fernando Santos')
