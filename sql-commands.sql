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
join ProductGroupImports ON ProductGroupImports.ID - Trade.ID
ORDER BY Country.Population;