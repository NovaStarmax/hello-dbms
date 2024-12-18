SELECT Population 
FROM countrystats 
WHERE Country = 'Germany '

SELECT Country, Population
FROM countrystats
WHERE Country IN ('Germany ', 'Sweden ', 'Norway ', 'Denmark ');

SELECT Country FROM countrystats WHERE Area_sq_mi > '200000' AND Area_sq_mi < '300000'