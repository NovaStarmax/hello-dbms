
use dbms

CREATE TABLE game (  
    id INT AUTO_INCREMENT PRIMARY KEY,
    mdate VARCHAR(50),
    stadium VARCHAR(50),
    team1 VARCHAR(50),
    team2 VARCHAR(50)
);

show tables

DESCRIBE game

SELECT * FROM game

INSERT INTO game (mdate, stadium, team1, team2)
VALUES
('8 June 2012', 'National Stadium (Warsaw)','POL', 'GRE'),
('8 June 2012', 'Stadion Miejski (Wroclaw)', 'RUS', 'CZE'),
('12 June 2012', 'Stadion Miejski (Wroclaw)','GRE', 'CZE'),
('12 June 2012', 'National Stadium (Warsaw)', 'POL', 'RUS')