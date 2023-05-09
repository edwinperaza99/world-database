USE world;

-- select the country with the highest population

SELECT name 
FROM country 
WHERE population = (
   SELECT MAX(population) 
   FROM country
);


-- select the continent with the highest GDP

SELECT continent 
FROM country 
GROUP BY continent 
HAVING SUM(gnp) = (
   SELECT MAX(total_gnp) 
   FROM (
      SELECT continent, SUM(gnp) as total_gnp 
      FROM country 
      GROUP BY continent
   ) as continent_gnp
);

-- select all the countries that posses nuclear weapons
SELECT Name as Country_Name, HeadOfState, Population
FROM Country
WHERE Code IN (
    SELECT Code 
    FROM Military
    WHERE NuclearPossession = 'T'
);

-- select all the countries that speak English and the language is official 
SELECT Name AS Country_Name, Code, Population
FROM Country
WHERE Code IN (
    SELECT CountryCode
    FROM CountryLanguage
    WHERE (Language = 'English' AND IsOfficial = 'T')
);

-- select countries where crime rate is higher than 1.1
SELECT Name as Country_Name, Population, HeadOfState, SurfaceArea
FROM Country
WHERE Code IN (
    SELECT Code 
    FROM CrimeRate
    WHERE Homicide > 0.2
);


-- select cities from north america
SELECT Name as City_Name, District, Population
FROM City
WHERE CountryCode IN (
    SELECT Code
    FROM Country
    WHERE Continent = 'North America'
)
ORDER BY Name;

-- select the states from the United States
SELECT DISTINCT District
FROM City 
WHERE CountryCode IN (
    SELECT Code
    FROM Country 
    WHERE Code = 'USA'
)
ORDER BY District;


-- select countries that are in Asia
SELECT Name AS Country_Name, Region, GNP, Capital
FROM Country 
WHERE Continent = 'Asia';


-- select country name and its revenue on all products export, order from highest to lowest
SELECT Country.Name, Trade.RevenueOfAllProductsOnExports
FROM Country
JOIN Trade ON Country.Code = Trade.Code
ORDER BY Trade.RevenueOfAllProductsOnExports DESC;


-- select country with highest homicide rate and show its currency
SELECT CrimeRate.CountryName as Country_Name, Trade.Currency
FROM CrimeRate
JOIN Trade ON CrimeRate.Code = Trade.Code
ORDER BY CrimeRate.Homicide DESC
LIMIT 1;


-- select country name, military budget, export and import amount
SELECT Military.CountryName, Military.Budget, Trade.RevenueOfAllProductsOnExports, Trade.LossOfAllProductsOnImports
FROM Military
JOIN Trade ON Trade.Code = Military.Code
ORDER BY Branches;


-- select several attributes from three different tables and order by GNP
SELECT Country.Name, Country.Continent, Country.Capital, Country.Population, CountryLanguage.Language, CountryLanguage.IsOfficial, Trade.Currency
FROM Country
JOIN CountryLanguage ON CountryLanguage.CountryCode = Country.Code
JOIN Trade ON Country.Code = Trade.Code
ORDER BY GNP;


-- use join to show revenue exports and imports of a country and specifically compare minerals
SELECT Country.Name, Trade.RevenueOfAllProductsOnExports, Trade.LossOfAllProductsOnImports, ProductGroupExports.Minerals as Exported_Minerals, ProductGroupImports.Minerals as Imported_Minerals
FROM Trade
JOIN Country ON Country.Code = Trade.Code
JOIN ProductGroupExports ON ProductGroupExports.ID = Trade.ID
JOIN ProductGroupImports ON ProductGroupImports.ID - Trade.ID
ORDER BY Country.Population;

-- show percentage of people that speak a particular language in USA
SELECT CountryCode, Language, IsOfficial, Percentage
FROM CountryLanguage
WHERE CountryCode = 'USA'
ORDER BY Percentage DESC;


-- select the two countries with more military branches
SELECT CountryName, Branches, Budget
FROM Military
ORDER BY Branches DESC 
LIMIT 2;

-- select the country with more military budget
SELECT CountryName, Code, Budget
FROM Military
ORDER BY Budget DESC
LIMIT 1;


-- count how many different districts we have on the city table that are part of China
SELECT COUNT(DISTINCT District) as different_districts_from_China
FROM City
WHERE CountryCode = 'CHN';

-- count all the different languages in the database
SELECT COUNT(DISTINCT Language)
FROM CountryLanguage;

-- Select country with largest surface area and show its currency
SELECT Country.Name AS Country_Name, Country.Code, Country.SurfaceArea, Country.IndepYear AS Year_Of_Independence, Country.Capital, Trade.Currency
FROM Country
JOIN Trade ON Trade.Code = Country.Code
ORDER BY SurfaceArea DESC
LIMIT 1;