use dbms

show tables

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/countries of the world.csv'
INTO TABLE countrystats
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS 
(Country, Region, Population, Area_sq_mi, Pop_Density_per_sq_mi, 
 Coastline_ratio, Net_migration, Infant_mortality_per_1000, 
 GDP_per_capita, Literacy_percent, Phones_per_1000, Arable_percent, 
 Crops_percent, Other_percent, Climate, Birthrate, Deathrate, 
 Agriculture, Industry, Service);

DESCRIBE countrystats;

ALTER TABLE countrystats MODIFY COLUMN GDP_per_capita VARCHAR(100);

SELECT * FROM countrystats