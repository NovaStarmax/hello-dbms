-- 1
SELECT Country, Population
FROM countrystats
WHERE Population > (SELECT Population FROM countrystats WHERE Country = 'Russia ');

-- 2
SELECT Country, GDP_per_capita
FROM countrystats
WHERE Region LIKE '%EUROPE%'
  AND GDP_per_capita > (SELECT GDP_per_capita FROM countrystats WHERE Country = 'Italy ');

-- 3
SELECT Country, Population
FROM countrystats
WHERE Population > (SELECT Population FROM countrystats WHERE Country = 'United Kingdom ')
  AND Population < (SELECT Population FROM countrystats WHERE Country = 'Germany ');

-- 4
SELECT 
    Country,
    population,
    (population / 80000000.0) * 100 AS pourcentage_par_rapport_allemagne
FROM countrystats
 WHERE Region LIKE '%EUROPE%';

-- 5
SELECT 
    'EUROPE' AS region,
    cs1.MAX_area,
    cs2.Country
FROM 
    (SELECT MAX(`Area_sq_mi`) AS MAX_area
     FROM countrystats
     WHERE Region LIKE '%EUROPE%' OR Region = 'NEAR EAST' OR Region = 'BALTICS') cs1
JOIN countrystats cs2
    ON cs2.`Area_sq_mi` = cs1.MAX_area
WHERE 
    cs2.Region LIKE '%EUROPE%' OR cs2.Region = 'NEAR EAST' OR cs2.Region = 'BALTICS'

UNION

SELECT 
    'ASIA' AS region,
    cs1.MAX_area,
    cs2.Country
FROM 
    (SELECT MAX(`Area_sq_mi`) AS MAX_area
     FROM countrystats
     WHERE Region LIKE '%ASIA%' OR Region LIKE '%STATES%') cs1
JOIN countrystats cs2
    ON cs2.`Area_sq_mi` = cs1.MAX_area
WHERE 
    cs2.Region LIKE '%ASIA%' OR Region LIKE '%STATES%'

UNION

SELECT 
    'AFRICA' AS region,
    cs1.MAX_area,
    cs2.Country
FROM 
    (SELECT MAX(`Area_sq_mi`) AS MAX_area
     FROM countrystats
     WHERE Region LIKE '%AFRICA%') cs1
JOIN countrystats cs2
    ON cs2.`Area_sq_mi` = cs1.MAX_area
WHERE 
    cs2.Region LIKE '%AFRICA%'

UNION

SELECT 
    'AMERICAS' AS region,
    cs1.MAX_area,
    cs2.Country
FROM 
    (SELECT MAX(`Area_sq_mi`) AS MAX_area
     FROM countrystats
     WHERE Region LIKE '%AMER%' ) cs1
JOIN countrystats cs2
    ON cs2.`Area_sq_mi` = cs1.MAX_area
WHERE 
    cs2.Region LIKE '%AMER%' OR cs2.Region LIKE '%STATES%'

UNION

SELECT 
    'OCEANIA' AS region,
    cs1.MAX_area,
    cs2.Country
FROM 
    (SELECT MAX(`Area_sq_mi`) AS MAX_area
     FROM countrystats
     WHERE Region LIKE '%OCEANIA%') cs1
JOIN countrystats cs2
    ON cs2.`Area_sq_mi` = cs1.MAX_area
WHERE 
    cs2.Region LIKE '%OCEANIA%';

-- 6 
SELECT Region, MAX(population)
FROM countrystats
GROUP BY `Region`
HAVING MAX(population) <= 25000000;

