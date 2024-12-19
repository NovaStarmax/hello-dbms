-- Active: 1734612452522@@127.0.0.1@3306@dbms
DROP TABLE CountryStats

CREATE TABLE CountryStats (
    Country VARCHAR(100),
    Region VARCHAR(100),
    Population BIGINT,
    Area_sq_mi FLOAT,
    Pop_Density_per_sq_mi VARCHAR(50),
    Coastline_ratio VARCHAR(50),
    Net_migration VARCHAR(50),
    Infant_mortality_per_1000 VARCHAR(50),
    GDP_per_capita VARCHAR(50),
    Literacy_percent VARCHAR(50),
    Phones_per_1000 VARCHAR(50),
    Arable_percent VARCHAR(50),
    Crops_percent VARCHAR(50),
    Other_percent VARCHAR(50),
    Climate TINYINT,
    Birthrate VARCHAR(50),
    Deathrate VARCHAR(50),
    Agriculture VARCHAR(50),
    Industry VARCHAR(50),
    Service VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/countries of the world.csv'
INTO TABLE CountryStats
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Country, Region, Population, @Area_sq_mi, @Pop_Density_per_sq_mi, 
 @Coastline_ratio, @Net_migration, @Infant_mortality_per_1000, 
 @GDP_per_capita, @Literacy_percent, @Phones_per_1000, @Arable_percent, 
 @Crops_percent, @Other_percent, @Climate, @Birthrate, @Deathrate, 
 @Agriculture, @Industry, @Service)
SET
    Climate = IF(@Climate = '' OR NOT(@Climate REGEXP '^-?[0-9]+$'), NULL, @Climate),
    Area_sq_mi = REPLACE(@Area_sq_mi, ',', '.'),
    Pop_Density_per_sq_mi = REPLACE(@Pop_Density_per_sq_mi, ',', '.'),
    Coastline_ratio = REPLACE(@Coastline_ratio, ',', '.'),
    Net_migration = REPLACE(@Net_migration, ',', '.'),
    Infant_mortality_per_1000 = REPLACE(@Infant_mortality_per_1000, ',', '.'),
    GDP_per_capita = REPLACE(@GDP_per_capita, ',', '.'),
    Literacy_percent = REPLACE(@Literacy_percent, ',', '.'),
    Phones_per_1000 = REPLACE(@Phones_per_1000, ',', '.'),
    Arable_percent = REPLACE(@Arable_percent, ',', '.'),
    Crops_percent = REPLACE(@Crops_percent, ',', '.'),
    Other_percent = REPLACE(@Other_percent, ',', '.'),
    Birthrate = REPLACE(@Birthrate, ',', '.'),
    Deathrate = REPLACE(@Deathrate, ',', '.'),
    Agriculture = REPLACE(@Agriculture, ',', '.'),
    Industry = REPLACE(@Industry, ',', '.'),
    Service = REPLACE(@Service, ',', '.');

INSERT INTO CountryStats (
    Country, Region, Population, Area_sq_mi, Pop_Density_per_sq_mi, 
    Coastline_ratio, Net_migration, Infant_mortality_per_1000, GDP_per_capita, 
    Literacy_percent, Phones_per_1000, Arable_percent, Crops_percent, Other_percent, 
    Climate, Birthrate, Deathrate, Agriculture, Industry, Service
)
VALUES
("Afghanistan", "ASIA (EX. NEAR EAST)", 31056997, 647500, "48.0", "0.00", "23.06", "163.07", 700, "36.0", "3.2", "12.13", "0.22", "87.65", 1, "46.6", "20.34", "0.38", "0.24", "0.38"),
("Albania", "EASTERN EUROPE", 3581655, 28748, "124.6", "1.26", "-4.93", "21.52", 4500, "86.5", "71.2", "21.09", "4.42", "74.49", 3, "15.11", "5.22", "0.232", "0.188", "0.579"),
("Algeria", "NORTHERN AFRICA", 32930091, 2381740, "13.8", "0.04", "-0.39", "31.00", 6000, "70.0", "78.1", "3.22", "0.25", "96.53", 1, "17.14", "4.61", "0.101", "0.6", "0.298")







UPDATE CountryStats
SET 
    Area_sq_mi = IF(Area_sq_mi = '' OR Area_sq_mi IS NULL, '0', Area_sq_mi),
    Pop_Density_per_sq_mi = IF(Pop_Density_per_sq_mi = '' OR Pop_Density_per_sq_mi IS NULL, '0', Pop_Density_per_sq_mi),
    Coastline_ratio = IF(Coastline_ratio = '' OR Coastline_ratio IS NULL, '0', Coastline_ratio),
    Net_migration = IF(Net_migration = '' OR Net_migration IS NULL, '0', Net_migration),
    Infant_mortality_per_1000 = IF(Infant_mortality_per_1000 = '' OR Infant_mortality_per_1000 IS NULL, '0', Infant_mortality_per_1000),
    GDP_per_capita = IF(GDP_per_capita = '' OR GDP_per_capita IS NULL, '0', GDP_per_capita),
    Literacy_percent = IF(Literacy_percent = '' OR Literacy_percent IS NULL, '0', Literacy_percent),
    Phones_per_1000 = IF(Phones_per_1000 = '' OR Phones_per_1000 IS NULL, '0', Phones_per_1000),
    Arable_percent = IF(Arable_percent = '' OR Arable_percent IS NULL, '0', Arable_percent),
    Crops_percent = IF(Crops_percent = '' OR Crops_percent IS NULL, '0', Crops_percent),
    Other_percent = IF(Other_percent = '' OR Other_percent IS NULL, '0', Other_percent),
    Birthrate = IF(Birthrate = '' OR Birthrate IS NULL, '0', Birthrate),
    Deathrate = IF(Deathrate = '' OR Deathrate IS NULL, '0', Deathrate),
    Agriculture = IF(Agriculture = '' OR Agriculture IS NULL, '0', Agriculture),
    Industry = IF(Industry = '' OR Industry IS NULL, '0', Industry),
    Service = IF(Service = '' OR Service IS NULL, '0', Service);