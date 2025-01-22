-- Active: 1734612452522@@127.0.0.1@3306@carbonfootprintbeta
DROP DATABASE carbonfootprint;
CREATE DATABASE carbonfootprint;
USE carbonfootprint;

CREATE TABLE World (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(100) NOT NULL,
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

CREATE TABLE Country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(100),
    region_id INT, -- Clé étrangère
    coal FLOAT,
    gas FLOAT,
    oil FLOAT,
    hydro FLOAT,
    renewable FLOAT,
    nuclear FLOAT,
    FOREIGN KEY (region_id) REFERENCES World(id) ON DELETE CASCADE
);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Albania', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 0, 0, 100, 0, 0),
('Algeria', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 97.8, 1.8, 0.4, 0, 0),
('Angola', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 46.8, 53.2, 0, 0),
('Argentina', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 2.9, 47.7, 13.8, 29, 2.5, 4.1),
('Armenia', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 42.4, 0, 25.7, 0.1, 31.8),
('Australia', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 61.2, 21.9, 2, 7.4, 7.5, 0),
('Austria', (SELECT id FROM World WHERE region = 'Europe & Central'), 8, 8.8, 1, 66.6, 14.6, 0),
('Azerbaijan', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 93.9, 0.2, 5.3, 0.4, 0),
('Bahrain', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 100, 0, 0, 0, 0),
('Bangladesh', (SELECT id FROM World WHERE region = 'South Asia'), 2, 82, 14.7, 1.1, 0.3, 0),
('Belarus', (SELECT id FROM World WHERE region = 'Europe & Central'), 0.1, 98, 1.1, 0.3, 0.4, 0),
('Belgium', (SELECT id FROM World WHERE region = 'Europe & Central'), 6.2, 27, 0.3, 0.4, 16.6, 47.2),
('Benin', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 99.5, 0, 0.5, 0),
('Bolivia', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 70, 2, 25.7, 2.3, 0),
('Bosnia and Herzegovina', (SELECT id FROM World WHERE region = 'Europe & Central'), 62.8, 0.2, 0.3, 36.7, 0, 0),
('Botswana', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 95.8, 0, 4.2, 0, 0, 0),
('Brazil', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 4.5, 13.7, 6, 63.2, 9.9, 2.6),
('Brunei Darussalam', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 0, 99, 1, 0, 0, 0),
('Bulgaria', (SELECT id FROM World WHERE region = 'Europe & Central'), 45.4, 4.6, 0.4, 9.8, 5.9, 33.8),
('Cambodia', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 28.2, 0, 10.7, 60.5, 0.6, 0);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Cameroon', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 12.9, 12.8, 73.2, 1, 0),
('Canada', (SELECT id FROM World WHERE region = 'North America'), 9.9, 9.4, 1.2, 58.3, 4.5, 16.4),
('Chile', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 35.3, 16.9, 6.2, 31.3, 9.8, 0),
('China', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 72.6, 2, 0.2, 18.6, 4.1, 2.3),
('Hong Kong SAR, China', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 76.2, 23, 0.6, 0, 0.2, 0),
('Colombia', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 10.2, 15.3, 0.2, 71.1, 3.1, 0),
('Congo, Dem. Rep.', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0.1, 0, 99.9, 0, 0),
('Congo, Rep.', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 45.3, 0, 54.7, 0, 0),
('Costa Rica', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 10.2, 65.7, 24, 0),
('Cote d''Ivoire', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 69.9, 6.1, 23.1, 0.8, 0),
('Croatia', (SELECT id FROM World WHERE region = 'Europe & Central'), 17.6, 7.5, 1, 67, 6.9, 0),
('Cuba', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 14.4, 81.6, 0.5, 3.5, 0),
('Curacao', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 96.4, 0, 3.6, 0),
('Cyprus', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 0, 92.7, 0, 7.3, 0),
('Czech Republic', (SELECT id FROM World WHERE region = 'Europe & Central'), 51.5, 1.9, 0, 2.2, 8.5, 35.7),
('Denmark', (SELECT id FROM World WHERE region = 'Europe & Central'), 34.4, 6.5, 1, 0, 55.8, 0),
('Dominican Republic', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 13.3, 21.5, 51.9, 8.5, 4.7, 0),
('Ecuador', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 13.3, 37.5, 47.1, 2, 0),
('Egypt, Arab Rep.', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 78.7, 12.2, 8.1, 0.9, 0),
('El Salvador', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 40.3, 27.6, 32.1, 0);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Eritrea', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 99.5, 0, 0.5, 0),
('Estonia', (SELECT id FROM World WHERE region = 'Europe & Central'), 87.4, 0.6, 0.3, 0.2, 10.9, 0),
('Ethiopia', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 0.1, 95.6, 4.3, 0),
('Finland', (SELECT id FROM World WHERE region = 'Europe & Central'), 17.4, 8.1, 0.3, 19.7, 18.9, 34.6),
('France', (SELECT id FROM World WHERE region = 'Europe & Central'), 2.2, 2.3, 0.3, 11.3, 5.1, 78.4),
('Gabon', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 38.9, 27, 33.6, 0.5, 0),
('Georgia', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 19.6, 0, 80.4, 0, 0),
('Germany', (SELECT id FROM World WHERE region = 'Europe & Central'), 45.8, 10, 0.9, 3.1, 23, 15.6),
('Ghana', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 18.2, 17.1, 64.7, 0, 0),
('Greece', (SELECT id FROM World WHERE region = 'Europe & Central'), 51.1, 13.5, 11, 8.9, 15.3, 0),
('Guatemala', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 17.3, 0, 14.1, 45.2, 23.4, 0),
('Haiti', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 91.3, 8.7, 0, 0),
('Honduras', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0.5, 0, 55.7, 32.4, 11.5, 0),
('Hungary', (SELECT id FROM World WHERE region = 'Europe & Central'), 20.8, 14.4, 0.2, 1, 9.7, 53.3),
('Iceland', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 0, 0, 71, 28.9, 0),
('India', (SELECT id FROM World WHERE region = 'South Asia'), 75.1, 4.9, 1.8, 10.2, 5.2, 2.8),
('Indonesia', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 52.6, 24.6, 11.3, 6.6, 4.8, 0),
('Iran, Islamic Rep.', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0.2, 71.3, 21.7, 5, 0.1, 1.6),
('Iraq', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 21.9, 73.7, 4.3, 0, 0),
('Ireland', (SELECT id FROM World WHERE region = 'Europe & Central'), 24.9, 49.6, 0.7, 2.7, 21.8, 0);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Israel', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 49.6, 48.4, 0.5, 0, 1.5, 0),
('Italy', (SELECT id FROM World WHERE region = 'Europe & Central'), 16.7, 33.7, 5.1, 21.1, 22.3, 0),
('Jamaica', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 90.2, 3.3, 6.5, 0),
('Japan', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 33.7, 40.6, 11.2, 7.9, 6.1, 0),
('Jordan', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 7.1, 92.5, 0.3, 0, 0),
('Kazakhstan', (SELECT id FROM World WHERE region = 'Europe & Central'), 71.9, 19.2, 1, 7.9, 0, 0),
('Kenya', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 18.5, 35.8, 45.7, 0),
('Korea, Dem. Peopleis Rep.', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 24.1, 0, 3.3, 72.6, 0, 0),
('Korea, Rep.', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 42.4, 23.9, 3.2, 0.5, 1.1, 28.7),
('Kosovo', (SELECT id FROM World WHERE region = 'Europe & Central'), 96.9, 0, 0.3, 2.8, 0, 0),
('Kuwait', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 33.7, 66.3, 0, 0, 0),
('Kyrgyz Republic', (SELECT id FROM World WHERE region = 'Europe & Central'), 7.4, 0.8, 0.6, 91.3, 0, 0),
('Latvia', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 45.5, 0, 38.8, 15.8, 0),
('Lebanon', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 0, 98.9, 1.1, 0, 0),
('Libya', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 53.7, 46.3, 0, 0, 0),
('Lithuania', (SELECT id FROM World WHERE region = 'Europe & Central'), 0.1, 47.2, 4.3, 10.8, 30, 0),
('Luxembourg', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 76.2, 0, 5.7, 15.3, 0),
('Macedonia, FYR', (SELECT id FROM World WHERE region = 'Europe & Central'), 69.5, 3.6, 2.8, 22.5, 1.6, 0),
('Malaysia', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 37.9, 50.1, 2.4, 9.1, 0.6, 0),
('Malta', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 0, 96.7, 0, 3.3, 0);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Mauritius', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 42.9, 0, 36.7, 3.1, 17.2, 0),
('Mexico', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 11.2, 57, 10.9, 12.9, 4.6, 3.2),
('Moldova', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 93.5, 0.3, 5.9, 0.3, 0),
('Mongolia', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 92.3, 0, 4.5, 0, 3.2, 0),
('Montenegro', (SELECT id FROM World WHERE region = 'Europe & Central'), 44.8, 0, 0, 55.2, 0, 0),
('Morocco', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 55, 19.5, 13.1, 5.7, 6.7, 0),
('Mozambique', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 8.8, 0, 91.2, 0, 0),
('Myanmar', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 2, 35.2, 0.5, 62.4, 0, 0),
('Namibia', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 0.9, 99.1, 0, 0),
('Nepal', (SELECT id FROM World WHERE region = 'South Asia'), 0, 0, 0, 99.8, 0.2, 0),
('Netherlands', (SELECT id FROM World WHERE region = 'Europe & Central'), 31.3, 49.8, 1.8, 0.1, 11.2, 4),
('New Zealand', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 4.5, 16.3, 0, 55.9, 23.2, 0),
('Nicaragua', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 46.1, 8.9, 45, 0),
('Niger', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 71.6, 0, 27.8, 0, 0.6, 0),
('Nigeria', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 82.4, 0, 17.6, 0, 0),
('Norway', (SELECT id FROM World WHERE region = 'Europe & Central'), 0.1, 1.8, 0, 96, 1.7, 0),
('Oman', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 97.4, 2.6, 0, 0, 0),
('Pakistan', (SELECT id FROM World WHERE region = 'South Asia'), 0.2, 25.1, 39.7, 29.8, 0.4, 4.8),
('Panama', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 7.4, 0, 36.8, 54.2, 1.6, 0),
('Paraguay', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 0, 100, 0, 0);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Peru', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0.7, 45.9, 1.2, 48.8, 3.4, 0),
('Philippines', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 42.8, 24.2, 7.4, 11.8, 13.8, 0),
('Poland', (SELECT id FROM World WHERE region = 'Europe & Central'), 83, 3.4, 1, 1.4, 11.1, 0),
('Portugal', (SELECT id FROM World WHERE region = 'Europe & Central'), 23, 13.2, 2.6, 30, 30.8, 0),
('Qatar', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 100, 0, 0, 0, 0),
('Romania', (SELECT id FROM World WHERE region = 'Europe & Central'), 27.3, 12.4, 0.7, 28.8, 12.8, 17.9),
('Russian Federation', (SELECT id FROM World WHERE region = 'Europe & Central'), 14.9, 50.2, 1, 16.5, 0.1, 17),
('Saudi Arabia', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 51.2, 48.8, 0, 0, 0),
('Senegal', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 4.2, 83.6, 8.7, 1.8, 0),
('Serbia', (SELECT id FROM World WHERE region = 'Europe & Central'), 66.3, 0.7, 0, 32.9, 0.1, 0),
('Singapore', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 1.1, 95.3, 0.7, 0, 1.7, 0),
('Slovak Republic', (SELECT id FROM World WHERE region = 'Europe & Central'), 12.4, 6, 1.1, 15.5, 7.4, 57.1),
('Slovenia', (SELECT id FROM World WHERE region = 'Europe & Central'), 21.9, 2.2, 0.2, 35.5, 3, 37.1),
('South Africa', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 93, 0, 0.1, 0.4, 1, 5.5),
('South Sudan', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 99.6, 0, 0.4, 0),
('Spain', (SELECT id FROM World WHERE region = 'Europe & Central'), 16.5, 17.2, 5.1, 14.2, 25.9, 20.8),
('Sri Lanka', (SELECT id FROM World WHERE region = 'South Asia'), 25.7, 0, 35.1, 36.5, 2.7, 0),
('Sudan', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 21.7, 78.3, 0, 0),
('Suriname', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 37.7, 62.3, 0, 0),
('Sweden', (SELECT id FROM World WHERE region = 'Europe & Central'), 0.6, 0.3, 0.2, 41.5, 14.3, 42.3);

INSERT INTO Country (country, region_id, coal, gas, oil, hydro, renewable, nuclear)
VALUES
('Switzerland', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 0.7, 0.1, 54.3, 3.8, 39.3),
('Syrian Arab Republic', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 64.4, 21.8, 13.8, 0, 0),
('Tajikistan', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 2.9, 0, 97.1, 0, 0),
('Tanzania', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 42.2, 15.5, 41.6, 0.6, 0),
('Thailand', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 21.6, 68.3, 1, 3.2, 5.9, 0),
('Togo', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 12, 84.5, 3.5, 0),
('Trinidad and Tobago', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 99.8, 0.2, 0, 0, 0),
('Tunisia', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 94.2, 1.8, 0.3, 2.8, 0),
('Turkey', (SELECT id FROM World WHERE region = 'Europe & Central'), 30.3, 47.9, 0.9, 16.1, 4.8, 0),
('Turkmenistan', (SELECT id FROM World WHERE region = 'Europe & Central'), 0, 100, 0, 0, 0, 0),
('Ukraine', (SELECT id FROM World WHERE region = 'Europe & Central'), 38.7, 7, 0.1, 4.7, 0.9, 48.6),
('United Arab', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 98.4, 1.3, 0, 0.3, 0),
('United Kingdom', (SELECT id FROM World WHERE region = 'Europe & Central'), 30.4, 30, 0.5, 1.8, 17.7, 19),
('United States', (SELECT id FROM World WHERE region = 'North America'), 39.7, 26.9, 0.9, 6.1, 6.9, 19.2),
('Uruguay', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 0, 9.1, 74.2, 16.8, 0),
('Uzbekistan', (SELECT id FROM World WHERE region = 'Europe & Central'), 4.1, 74.2, 0.4, 21.4, 0, 0),
('Venezuela, RB', (SELECT id FROM World WHERE region = 'Latin America & Caribbean'), 0, 17.7, 14, 68.3, 0, 0),
('Vietnam', (SELECT id FROM World WHERE region = 'East Asia & Pacific'), 24.5, 33.5, 0.3, 41.5, 0.1, 0),
('Yemen, Rep.', (SELECT id FROM World WHERE region = 'Middle East & North Afrika'), 0, 38.6, 61.4, 0, 0, 0),
('Zambia', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 0, 0, 2.8, 97.2, 0, 0),
('Zimbabwe', (SELECT id FROM World WHERE region = 'Sub­Saharan Africa'), 43.9, 0, 0.5, 54.2, 1.4, 0);