CREATE DATABASE IF NOT EXISTS CarbonFootprint;
USE CarbonFootprint;

CREATE TABLE Country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(100),
    coal FLOAT,
    gas FLOAT,
    oil FLOAT,
    hydro FLOAT,
    renewable FLOAT,
    nuclear FLOAT
);

-- Chargement des données
-- Inès, ici tu dois suivre le chemin (on a pas la même version sql mais tu as compris), 
-- Déposer le csv au même endroit (dans Upload) et copier le chemin dans des simple <'> et non pas les doubles comme par défault <">.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/carbon-footprint-data-country.csv'
INTO TABLE Country
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(country, coal, gas, oil, hydro, renewable, nuclear);

-- Vérifie les résultats
SELECT * FROM Country LIMIT 10;


CREATE TABLE World (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(100),
    coal FLOAT,         
    gas FLOAT,          
    oil FLOAT,          
    hydro FLOAT,        
    renewable FLOAT,    
    nuclear FLOAT       
);

INSERT INTO World (region, coal, gas, oil, hydro, renewable, nuclear) VALUES
('World', 40.7, 21.6, 4.1, 16.2, 6.0, 10.6),
('East Asia & Pacific', 60.6, 13.5, 2.2, 15.0, 4.2, 3.8),
('Europe & Central', 24.1, 24.3, 1.3, 16.6, 10.5, 22.4),
('Latin America & Caribbean', 6.5, 26.0, 10.6, 46.5, 6.4, 1.9),
('Middle East & North Afrika', 3.4, 64.1, 28.8, 2.6, 0.4, 0.3),
('North America', 35.7, 24.6, 1.0, 12.9, 6.6, 18.9),
('South Asia', 65.7, 9.1, 5.2, 11.6, 4.6, 2.8),
('Sub­Saharan Africa', 51.4, 8.6, 4.3, 21.2, 1.7, 3.0);

--3 

-- Classement des régions selon leur dépendance aux énergies fossiles
SELECT region, ROUND(coal + gas + oil, 2) AS fossil_dependency
FROM World
ORDER BY fossil_dependency DESC;

-- Régions les plus axées sur les énergies renouvelables
SELECT region, renewable
FROM World
ORDER BY renewable DESC;

-- Comparaison entre énergies fossiles et propres par région
SELECT region, 
       ROUND(coal + gas + oil, 2) AS fossil, 
       ROUND(hydro + renewable + nuclear, 2) AS clean
FROM World
ORDER BY fossil DESC;

-- Top 5 des pays avec la plus grande utilisation de charbon
SELECT country, coal
FROM Country
ORDER BY coal DESC
LIMIT 5;

-- Contribution des émissions totales de CO2 par région en pondérant chaque source d'énergie
SELECT region, 
       ROUND(coal * 820 + gas * 490 + oil * 740 + hydro * 24 + renewable * 41 + nuclear * 12, 2) AS total_carbon_emission
FROM World
ORDER BY total_carbon_emission DESC;

-- Répartition énergétique par type d'énergie dans chaque région
SELECT region, 
       ROUND(coal / (coal + gas + oil + hydro + renewable + nuclear) * 100, 2) AS coal_percentage,
       ROUND(gas / (coal + gas + oil + hydro + renewable + nuclear) * 100, 2) AS gas_percentage,
       ROUND(oil / (coal + gas + oil + hydro + renewable + nuclear) * 100, 2) AS oil_percentage
FROM World;
