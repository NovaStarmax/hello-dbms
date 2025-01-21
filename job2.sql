
SELECT Country 
FROM countrystats 
WHERE Country LIKE 'B%'

SELECT Country 
FROM countrystats 
WHERE Country LIKE 'Al%'

SELECT Country 
FROM countrystats 
WHERE Country LIKE '%y '

SELECT Country 
FROM countrystats 
WHERE Country LIKE '%land '   

SELECT Country 
FROM countrystats 
WHERE Country LIKE '%w%'

SELECT Country 
FROM countrystats 
WHERE Country LIKE '%oo%' OR Country LIKE '%ee%'

SELECT `Country`
FROM countrystats
WHERE `Country` LIKE '%a%a%a%';

SELECT `Country` 
FROM countrystats 
WHERE `Country` LIKE '_r%';
