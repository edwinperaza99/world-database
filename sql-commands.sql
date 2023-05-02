USE world;

-- select the country with the highest population

SELECT name 
FROM country 
WHERE population_growth = (
   SELECT MAX(population_growth) 
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

