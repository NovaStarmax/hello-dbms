CREATE DATABASE IF NOT EXISTS CarbonFootprint;
USE CarbonFootprint;


CREATE TABLE World (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(100),
    coal FLOAT,         -- Pourcentage d'utilisation du charbon
    gas FLOAT,          -- Pourcentage d'utilisation du gaz
    oil FLOAT,          -- Pourcentage d'utilisation du pétrole
    hydro FLOAT,        -- Pourcentage d'utilisation de l'hydroélectrique
    renewable FLOAT,    -- Pourcentage d'utilisation des énergies renouvelables
    nuclear FLOAT       -- Pourcentage d'utilisation du nucléaire
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

CREATE TABLE Country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    region VARCHAR(100),
    coal FLOAT,         -- Pourcentage d'utilisation du charbon
    gas FLOAT,          -- Pourcentage d'utilisation du gaz
    oil FLOAT,          -- Pourcentage d'utilisation du pétrole
    hydro FLOAT,        -- Pourcentage d'utilisation de l'hydroélectrique
    renewable FLOAT,    -- Pourcentage d'utilisation des énergies renouvelables
    nuclear FLOAT       -- Pourcentage d'utilisation du nucléaire
);
