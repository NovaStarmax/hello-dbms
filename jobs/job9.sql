CREATE TABLE world (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    continent VARCHAR(50),
    population BIGINT,
    area FLOAT,
    Literacy FLOAT,
    Net_migration FLOAT,
    Birthrate FLOAT,
    Deathrate FLOAT,
    Infant_mortality FLOAT,
    Arable FLOAT,
    Crops FLOAT
);

INSERT INTO world (name, continent, population, area, Literacy, Net_migration, Birthrate, Deathrate, Infant_mortality, Arable, Crops)
VALUES
('Country A', 'Africa', 50000000, 1200000, 85.0, 1.2, 35.0, 12.0, 50.0, 45.0, 5.0),
('Country B', 'Asia', 150000000, 900000, 92.5, 0.5, 20.0, 8.0, 15.0, 55.0, 10.0),
('Country C', 'Europe', 80000000, 500000, 99.0, -0.3, 10.0, 11.0, 5.0, 35.0, 8.0),
('Country D', 'North America', 300000000, 9500000, 95.0, 2.0, 13.0, 9.0, 6.0, 25.0, 15.0),
('Country E', 'South America', 120000000, 850000, 88.0, 0.8, 28.0, 10.0, 20.0, 65.0, 20.0),
('Country F', 'Oceania', 40000000, 760000, 90.0, -1.0, 25.0, 12.0, 30.0, 50.0, 12.0);


-- 1. Calculer la moyenne de l’alphabétisation (Literacy) dans le monde
SELECT AVG(Literacy) AS avg_literacy
FROM world;

-- 2. Lister les 10 pays avec la plus haute alphabétisation
SELECT name, Literacy
FROM world
ORDER BY Literacy DESC
LIMIT 10;

-- Lister les 10 pays avec la plus basse alphabétisation
SELECT name, Literacy
FROM world
ORDER BY Literacy ASC
LIMIT 10;

-- 3. Trouver les pays ayant une migration nette (Net_migration) positive (> 0)
SELECT name, Net_migration
FROM world
WHERE Net_migration > 0
ORDER BY Net_migration DESC;

-- 4. Calculer le taux de natalité (Birthrate) moyen par continent
SELECT continent, AVG(Birthrate) AS avg_birthrate
FROM world
GROUP BY continent;

-- 5. Lister les pays ayant un taux de mortalité infantile (Infant_mortality) supérieur à 50
SELECT name, Infant_mortality
FROM world
WHERE Infant_mortality > 50
ORDER BY Infant_mortality DESC;

-- 6. Trouver les 5 pays ayant le plus haut pourcentage de terres arables (Arable)
SELECT name, Arable
FROM world
ORDER BY Arable DESC
LIMIT 5;

-- 7. Calculer le pourcentage moyen de terres cultivées (Crops) par continent
SELECT continent, AVG(Crops) AS avg_crops
FROM world
GROUP BY continent;

-- 8. Comparer les taux de natalité (Birthrate) et de mortalité (Deathrate) dans le monde
-- En calculant la différence entre les deux
SELECT name, Birthrate, Deathrate, (Birthrate - Deathrate) AS rate_difference
FROM world
ORDER BY rate_difference DESC;

-- 9. Trouver les pays ayant un sol cultivable (Arable) > 50 % et une faible mortalité infantile (< 10)
SELECT name, Arable, Infant_mortality
FROM world
WHERE Arable > 50 AND Infant_mortality < 10
ORDER BY Arable DESC;