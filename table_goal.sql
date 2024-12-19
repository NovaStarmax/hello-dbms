
use dbms

CREATE TABLE goal (  
    matchid INT AUTO_INCREMENT PRIMARY KEY,
    teamid VARCHAR(50),
    player VARCHAR(50),
    gtime INT
);

show tables

DESCRIBE goal

SELECT * FROM goal

INSERT INTO goal ( teamid, player, gtime)
VALUES
('POL', 'Robert Lewandowski', 17),
('GRE', 'Dimitris Salpingidis',51),
('RUS', 'Alan Dzagoev', 15),
('RUS', 'Roman Pavlyuchenko', 82)

