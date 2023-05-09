-- ****************************************************************************
-- Group 6
-- Final Project - CPSC 332
-- Date: 05/09/2023
-- Group members:
--      Edwin Peraza
--      Danyal Nemati
--      Alex Nguyen
--      Loc Nguyen
--      Nik Reyes
--
-- ****************************************************************************

USE world;

-- Create Military table
-- Information from 2020
DROP TABLE IF EXISTS Military;
CREATE TABLE Military(     
	CountryName CHAR(52)  NOT NULL,     
	Code CHAR(3)  NOT NULL,     
    Budget DECIMAL(15,2)  NOT NULL DEFAULT 0,     
    Branches INT  NOT NULL DEFAULT 0,    
    NuclearPossession ENUM('T','F')  NOT NULL DEFAULT 'F',     
    PRIMARY KEY (CountryName),     
    FOREIGN KEY (Code) 
    REFERENCES Country(Code) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create CrimeRate table
-- Per 100,000 population, 2020
DROP TABLE IF EXISTS CrimeRate;
CREATE TABLE CrimeRate(     
	CountryName CHAR(52)  NOT NULL,  
    Code CHAR(3)  NOT NULL,     
    Homicide DOUBLE,   
    Kidnapping DOUBLE,  
    Theft DOUBLE,  
    Robbery DOUBLE,   
    PRIMARY KEY (CountryName),
    FOREIGN KEY (Code) REFERENCES Country(Code) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create Trade table
-- 2020
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Trade;
CREATE TABLE Trade(     
	ID INT NOT NULL AUTO_INCREMENT,    
    Code CHAR(3)  NOT NULL,  
    Currency CHAR(20)  NOT NULL DEFAULT ' ',   
    RevenueOfAllProductsOnExports DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    LossOfAllProductsOnImports DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    PRIMARY KEY (ID),    
    FOREIGN KEY (Code) REFERENCES Country(Code) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;

-- Create ProductGroupExports table
DROP TABLE IF EXISTS ProductGroupExports;
CREATE TABLE ProductGroupExports(    
	CountryName CHAR(52)  NOT NULL ,   
    ID INT NOT NULL AUTO_INCREMENT,   
    Animal DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    Chemicals DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    FoodProducts DECIMAL(15,2)  NOT NULL DEFAULT 0,
    Footwear DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    Fuels DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    HidesAndSkins DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    MachAndElec DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    Metals DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    Minerals DECIMAL(15,2)  NOT NULL DEFAULT 0,   
	Miscellaneous DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    PlasticOrRubber DECIMAL(15,2)  NOT NULL DEFAULT 0,      
    StoneAndGlass DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    TextilesAndClothing DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    Transportation DECIMAL(15,2)  NOT NULL DEFAULT 0,    
    Vegetable DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    Wood DECIMAL(15,2)  NOT NULL DEFAULT 0,      
    PRIMARY KEY (CountryName),    
    FOREIGN KEY (ID) REFERENCES Trade(ID) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Create ProductGroupImports table
DROP TABLE IF EXISTS ProductGroupImports;
CREATE TABLE ProductGroupImports(    
	CountryName CHAR(52)  NOT NULL,   
    ID INT NOT NULL AUTO_INCREMENT,   
    Animal DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    Chemicals DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    FoodProducts DECIMAL(15,2)  NOT NULL DEFAULT 0,
    Footwear DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    Fuels DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    HidesAndSkins DECIMAL(15,2)  NOT NULL DEFAULT 0,
    MachAndElec DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    Metals DECIMAL(15,2)  NOT NULL DEFAULT 0,  
    Minerals DECIMAL(15,2)  NOT NULL DEFAULT 0,   
	Miscellaneous DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    PlasticOrRubber DECIMAL(15,2)  NOT NULL DEFAULT 0,   
    StoneAndGlass DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    TextilesAndClothing DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    Transportation DECIMAL(15,2)  NOT NULL DEFAULT 0,    
    Vegetable DECIMAL(15,2)  NOT NULL DEFAULT 0, 
    Wood DECIMAL(15,2)  NOT NULL DEFAULT 0,      
    PRIMARY KEY (CountryName),    
    FOREIGN KEY (ID) REFERENCES Trade(ID) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ****************************************************************************
-- Populate tables

-- Insert values into Military table
START TRANSACTION;
INSERT INTO Military VALUES ('United States','USA',721531000000,7,'T');
INSERT INTO Military VALUES ('Germany','DEU',53000000000,6,'T');
INSERT INTO Military VALUES ('United Kingdom','GBR',68370000000,7,'T');
INSERT INTO Military VALUES ('Sweden','SWE',6270000000,5,'F');
INSERT INTO Military VALUES ('Russian Federation','RUS',61710000000,6,'T');
INSERT INTO Military VALUES ('Vietnam','VNM',5500000000,5,'F');
INSERT INTO Military VALUES ('Japan','JPN',51970000000,5,'F');
INSERT INTO Military VALUES ('South Korea','KOR',45520000000,3,'F');
INSERT INTO Military VALUES ('France','FRA',52750000000,4,'T');
INSERT INTO Military VALUES ('China','CHN',178000000000,5,'T');
COMMIT;

-- Insert values into CrimeRate table
START TRANSACTION;
INSERT INTO CrimeRate VALUES ('United States','USA',6.5,NULL,NULL,NULL);
INSERT INTO CrimeRate VALUES ('Germany','DEU',0.9,5.4,1112.1,NULL);
INSERT INTO CrimeRate VALUES ('United Kingdom','GBR',1.1,NULL,NULL,NULL);
INSERT INTO CrimeRate VALUES ('Sweden','SWE',1.2,NULL,3079.8,NULL);
INSERT INTO CrimeRate VALUES ('Russian Federation','RUS',7.3,0.3,465.6,NULL);
INSERT INTO CrimeRate VALUES ('Vietnam','VNM',1.5,NULL,NULL,NULL);
INSERT INTO CrimeRate VALUES ('Japan','JPN',0.3,0.3,295.1,NULL);
INSERT INTO CrimeRate VALUES ('South Korea','KOR',0.6,0.1,200.0,NULL);
INSERT INTO CrimeRate VALUES ('France','FRA',1.3,NULL,1042.1,NULL);
INSERT INTO CrimeRate VALUES ('China','CHN',0.5,NULL,NULL,NULL);
COMMIT;

-- Insert values into Trade table
START TRANSACTION;
INSERT INTO Trade VALUES (NULL,'USA','Dollar',1430253623.49,2405381557.67);
INSERT INTO Trade VALUES (NULL,'DEU','Euro',1385852259.83,1173167331.77);
INSERT INTO Trade VALUES (NULL,'GBR','Pound Sterling',395692086.59,634174870.3);
INSERT INTO Trade VALUES (NULL,'SWE','Swedish Krona',154935587.13,149436257.46);
INSERT INTO Trade VALUES (NULL,'RUS','Russian Ruble',337103969.59,231664185.41);
INSERT INTO Trade VALUES (NULL,'VNM','Dong',281441457.24,261309451.92);
INSERT INTO Trade VALUES (NULL,'JPN','Yen',641282568.36,635402321.81);
INSERT INTO Trade VALUES (NULL,'KOR','South Korean Won',512709856.02,467498278.74);
INSERT INTO Trade VALUES (NULL,'FRA','Euro',488562445.79,582775305.82);
INSERT INTO Trade VALUES (NULL,'CHN','Chinese Yuan',2589098353.3,2069567864.87);
COMMIT;

-- Insert values into ProductGroupExports table
START TRANSACTION;
INSERT INTO ProductGroupExports VALUES ('USA',NULL,29517975.24,166310401.06,43636917.82,1581411.56,155092241.02,2691005.08,331581364.45,57591476.5,10148961,169117836.18,71827922.89,67399527.75,22820031.4,190785042.41,76622108.12,33529401.02);
INSERT INTO ProductGroupExports VALUES ('DEU',NULL,22717636.69,198754272.23,44967691.16,9250927.65,26189714.34,3165904.23,385460984.94,97078417.25,3991138.49,141178935.82,73714920.48,36371379.03,37688857.28,250330003.9,19108057.81,35883418.53);
INSERT INTO ProductGroupExports VALUES ('GBR',NULL,7197636.86,59221619.4,18155102.2,2438883.91,26344932.24,1542136.81,84733023.63,19183521.78,1006337,43443051.91,13194102.62,45255812.35,11095254.61,52109942.79,3673782.25,7096946.22);
INSERT INTO ProductGroupExports VALUES ('SWE',NULL,4785660.71,18345958.54,4325437.89,740898.66,7037037.39,339300.92,38381241.89,13280041.19,3859939.14,13397418.7,6266505.95,2378579.91,3373824.89,20898861.72,1702010.58,15822869.03);
INSERT INTO ProductGroupExports VALUES ('RUS',NULL,5291938.62,16052588.24,6957504.39,262576.61,141918219.66,159617.86,12652759.01,34866194.43,5251803.66,41779060.69,6400330.13,31896328.92,1211266.35,3895508.02,16075900.4,12432372.6);
INSERT INTO ProductGroupExports VALUES ('VNM',NULL,5757830.53,4465756.69,6903713.54,17784326.2,2672021.28,3144943.86,129451853.5,12533745.82,1906634.61,21845895.86,9875180.86,4821623.9,37104712.69,4564500.29,13211520.28,5397197.31);
INSERT INTO ProductGroupExports VALUES ('JPN',NULL,1751781.62,61306730.26,5079874.14,257972.39,7628748.83,211233.71,212155610.73,49892977.52,1314715.18,98505675.55,34155497.38,19407370.47,6603596.58,137096012.64,1182370.38,4732400.97);
INSERT INTO ProductGroupExports VALUES ('KOR',NULL,1353417.8,47804196.07,6670019.15,578442.03,25399221.88,637473.03,225633394.73,42225659.88,1322554.11,25353239.59,38046591.23,7613093.32,10809988.7,75212879.02,902929.75,3146755.73);
INSERT INTO ProductGroupExports VALUES ('FRA',NULL,14554568.54,86403211.78,37345053.51,4470772.98,10018834.95,9653133.16,91902576.38,30210873.37,1359110.13,42462309.12,25222366.29,12228143.85,15529394.46,76863569.62,19448902.41,10889625.24);
INSERT INTO ProductGroupExports VALUES ('CHN',NULL,13791719.97,137248016.22,31881329.55,53077271.75,31442592.57,26605007.16,1149237813.28,176205198.86,5169375.98,308945712.87,119388290.72,74382023.48,280643238.07,110208796.6,28895008.59,41976957.64);
COMMIT;

-- Insert values into ProductGroupImports table
START TRANSACTION;
INSERT INTO ProductGroupImports VALUES ('USA',NULL,33313109.98,257500859.72,77989889.92,26621616.35,130118461.27,10795360.12,701021873.4,113975861.95,7856561.23,318912661.02,91336370.34,125146824.39,117246600.96,286840050.84,59112885.14,47592571.02);
INSERT INTO ProductGroupImports VALUES ('DEU',NULL,23005078.96,148660662.8,41246048.17,13765375.76,76605476.29,4773922.4,292515811.7,84783381.57,14223112.45,107314306.4,56181439.37,35192237.34,58157472.32,144710240.08,43261907.83,28770858.32);
INSERT INTO ProductGroupImports VALUES ('GBR',NULL,12370036.46,58340605.54,34196806.39,6590727.98,33676254.16,2985358.2,126616451.05,25673701.86,2953998.63,51619546.86,24447781.36,113761870.93,34348427.42,68179111.86,20610939.49,17803252.12);
INSERT INTO ProductGroupImports VALUES ('SWE',NULL,6693517.61,13895535.58,6737624.39,1403841.84,11645146.61,543297.78,38527850.77,11337156.15,1196078.33,16568533.65,6994227.53,2225365.6,5836549.11,17331121.06,4168366.6,4332044.84);
INSERT INTO ProductGroupImports VALUES ('RUS',NULL,6220638.06,29228663.78,10450652.44,3092808.68,1699289.51,982778.53,73297170.11,15840779.47,2724345.34,23014375.89,12987911.36,3359680.1,11516120.8,20931847.04,12460738.41,3856385.87);
INSERT INTO ProductGroupImports VALUES ('VNM',NULL,4583878.82,17233803.37,7241703.82,1244328.52,12928719.62,1634727.04,116772631.55,23731729.67,1929560.21,13167884.5,18656609.68,3071507.1,18667330.48,5918142.76,9126989.77,5399905.02);
INSERT INTO ProductGroupImports VALUES ('JPN',NULL,22410109.22,64188150.18,26769597.62,5346052.96,105482658.41,5258738.84,160974960.48,27988893.01,25557702.77,58412681.86,19305089.77,18231660.43,35981463.79,24627744.23,20905308.87,13961509.38);
INSERT INTO ProductGroupImports VALUES ('KOR',NULL,10156382.78,42941115.88,11748158.03,3461350.25,86553145.72,3632261.16,140821266.38,32435951.86,17399197,38263861.1,14149245.29,9584455.21,15135604.94,23471071.66,11095799.45,6649412.04);
INSERT INTO ProductGroupImports VALUES ('FRA',NULL,14552499.98,72211332.17,28586356.73,8557022.13,40305213.2,5113257.24,123985614.94,38119569.68,3195278.02,49064076.97,29511055.06,14101489.91,35067020.35,81491897.45,21781964.07,17131657.92);
INSERT INTO ProductGroupImports VALUES ('CHN',NULL,50112636.97,148993175.61,29451177.1,6487599.54,273716495.98,8087187.96,726795583.18,118611172.15,194082713.33,135425058.22,87391982.78,42771664.22,29333716.18,86580638.57,84278316.28,47448746.81);
COMMIT;

-- ****************************************************************************
-- Beginning of queries

-- Basic queries

-- 1) Select the country with the highest population
SELECT Name 
FROM Country 
WHERE Population = (
   SELECT MAX(Population) 
   FROM Country
);

-- 2) Select countries that are in Asia
SELECT Name AS Country_Name, Region, GNP, Capital
FROM Country 
WHERE Continent = 'Asia';

-- 3) Show percentage of people that speak a particular language in USA
SELECT CountryCode, Language, IsOfficial, Percentage
FROM CountryLanguage
WHERE CountryCode = 'USA'
ORDER BY Percentage DESC;

-- 4) Select the two countries with more military branches
SELECT CountryName, Branches, Budget
FROM Military
ORDER BY Branches DESC 
LIMIT 2;

-- 5) Select the country with more military budget
SELECT CountryName, Code, Budget
FROM Military
ORDER BY Budget DESC
LIMIT 1;

-- 6) Count how many different districts we have on the city table that are part of China
SELECT COUNT(DISTINCT District) as different_districts_from_China
FROM City
WHERE CountryCode = 'CHN';

-- 7) Count all the different languages in the database
SELECT COUNT(DISTINCT Language)
FROM CountryLanguage;

-- 8) Select country where life expectancy is the lowest
SELECT Name AS Country_with_highest_life_expectancy, LifeExpectancy
FROM Country
ORDER BY LifeExpectancy DESC
LIMIT 1;



-- Queries with joins

-- 9) Select country with largest surface area and show its currency
SELECT Country.Name AS Country_Name, Country.Code, Country.SurfaceArea, Country.IndepYear AS Year_Of_Independence, Country.Capital, Trade.Currency
FROM Country
JOIN Trade ON Trade.Code = Country.Code
ORDER BY SurfaceArea DESC
LIMIT 1;

-- 10) Select country name and its revenue on all products export, order from highest to lowest
SELECT Country.Name, Trade.RevenueOfAllProductsOnExports
FROM Country
JOIN Trade ON Country.Code = Trade.Code
ORDER BY Trade.RevenueOfAllProductsOnExports DESC;

-- 11) Select country with highest homicide rate and show its currency
SELECT CrimeRate.CountryName as Country_Name, Trade.Currency
FROM CrimeRate
JOIN Trade ON CrimeRate.Code = Trade.Code
ORDER BY CrimeRate.Homicide DESC
LIMIT 1;

-- 12) Select country name, military budget, export and import amount
SELECT Military.CountryName, Military.Budget, Trade.RevenueOfAllProductsOnExports, Trade.LossOfAllProductsOnImports
FROM Military
JOIN Trade ON Trade.Code = Military.Code
ORDER BY Branches;

-- 13) Select several attributes from three different tables and order by GNP
SELECT Country.Name, Country.Continent, Country.Capital, Country.Population, CountryLanguage.Language, CountryLanguage.IsOfficial, Trade.Currency
FROM Country
JOIN CountryLanguage ON CountryLanguage.CountryCode = Country.Code
JOIN Trade ON Country.Code = Trade.Code
ORDER BY GNP;

-- 14) Use join to show revenue exports and imports of a country and specifically compare minerals
SELECT Country.Name, Trade.RevenueOfAllProductsOnExports, Trade.LossOfAllProductsOnImports, ProductGroupExports.Minerals as Exported_Minerals, ProductGroupImports.Minerals as Imported_Minerals
FROM Trade
JOIN Country ON Country.Code = Trade.Code
JOIN ProductGroupExports ON ProductGroupExports.ID = Trade.ID
JOIN ProductGroupImports ON ProductGroupImports.ID - Trade.ID
ORDER BY Country.Population;



-- Queries with subqueries

-- 15) Select the states from the United States that appear in the database
SELECT DISTINCT District
FROM City 
WHERE CountryCode IN (
    SELECT Code
    FROM Country 
    WHERE Code = 'USA'
)
ORDER BY District;

-- 16) Select cities from North America
SELECT Name as City_Name, District, Population
FROM City
WHERE CountryCode IN (
    SELECT Code
    FROM Country
    WHERE Continent = 'North America'
)
ORDER BY Name;

-- 17) Select countries where crime rate is higher than 1.1
SELECT Name as Country_Name, Population, HeadOfState, SurfaceArea
FROM Country
WHERE Code IN (
    SELECT Code 
    FROM CrimeRate
    WHERE Homicide > 0.2
);

-- 18) Select all the countries that speak English and the language is official 
SELECT Name AS Country_Name, Code, Population
FROM Country
WHERE Code IN (
    SELECT CountryCode
    FROM CountryLanguage
    WHERE (Language = 'English' AND IsOfficial = 'T')
);

-- 19) Select all the countries that posses nuclear weapons
SELECT Name as Country_Name, HeadOfState, Population
FROM Country
WHERE Code IN (
    SELECT Code 
    FROM Military
    WHERE NuclearPossession = 'T'
);

-- 20) Select the continent with the highest GDP
SELECT Continent 
FROM Country 
GROUP BY Continent 
HAVING SUM(GNP) = (
   SELECT MAX(total_gnp) 
   FROM (
      SELECT Continent, SUM(GNP) as total_gnp 
      FROM Country 
      GROUP BY Continent
   ) as continent_gnp
);


