-- 1
SELECT SUM(Population) FROM countrystats

-- 2
SELECT Region, SUM(population)
FROM countrystats
GROUP BY Region

-- 3
SELECT Region, SUM(GDP_per_capita)
FROM countrystats
GROUP BY Region

-- 4
SELECT SUM(GDP_per_capita)
FROM countrystats
WHERE Region LIKE '%AFRICA%'

-- 5
SELECT COUNT(`Country`) 
FROM countrystats
WHERE Area_sq_mi <=1000000

-- 6
SELECT MAX(Population)
FROM countrystats
WHERE `Country` IN ('Estonia ', 'Latvia ', 'Lithuania ')

-- 7
SELECT COUNT(Country)
FROM countrystats
GROUP BY Region

-- 8
SELECT Region 

FROM countrystats
GROUP BY `Region`
HAVING SUM(`Population`) > 100000000

