
--2
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GRE';

--3
SELECT id, stadium, team1, team2 
FROM game 
WHERE id = 1012;

--4 utilisation de g en allias
SELECT g.player, g.teamid, ga.stadium, ga.mdate 
FROM goal g 
JOIN game ga ON g.matchid = ga.id 
WHERE g.teamid = 'GRE';

--5 
SELECT ga.team1, ga.team2, g.player 
FROM goal g 
JOIN game ga ON g.matchid = ga.id 
WHERE g.player LIKE 'Mario%';

--6
SELECT g.*, e.* 
FROM goal g 
JOIN eteam e ON g.teamid = e.id;

--7 
SELECT g.player, g.teamid, e.coach, g.gtime 
FROM goal g 
JOIN eteam e ON g.teamid = e.id 
WHERE g.gtime <= 10;

--8
SELECT ga.mdate, e.teamname 
FROM game ga 
JOIN eteam e ON ga.team1 = e.id 
WHERE e.coach = 'Fernando Santos';

--9
SELECT g.player 
FROM goal g 
JOIN game ga ON g.matchid = ga.id 
WHERE ga.stadium = 'National Stadium, Warsaw';

--10
SELECT teamid, COUNT(*) AS total_goals 
FROM goal 
GROUP BY teamid;

--11
SELECT ga.stadium, COUNT(*) AS total_goals 
FROM goal g 
JOIN game ga ON g.matchid = ga.id 
GROUP BY ga.stadium;

--12
SELECT g.matchid, ga.mdate, COUNT(*) AS total_goals 
FROM goal g 
JOIN game ga ON g.matchid = ga.id 
WHERE g.teamid = 'FRA' 
GROUP BY g.matchid, ga.mdate;

