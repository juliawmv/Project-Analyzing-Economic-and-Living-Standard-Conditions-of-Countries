-- Part 2: Analysis On The Economic and Living Standard Conditions of Countries
-- a. A GDP growth rate under 2% shows stagnation. Categorize each country as either 'Growing', 'Stagnant', or 'Contracting' in a separate column using GPT Growth %. What is the largest country with a stagnant GDP growth rate?
WITH growth_status AS (SELECT country, Population, CASE
WHEN `GDP Growth` < 0 THEN 'Contracting'
WHEN `GDP Growth` BETWEEN 0 AND 2 THEN 'Stagnant'
ELSE 'Growing' END AS status FROM countries)
SELECT country, Population, status FROM growth_status WHERE status = 'Stagnant' ORDER BY Population DESC LIMIT 1;
-- It is Brazil with a population of 211,998,573 poeple.


-- b. Now, count how many countries fall into each GDP growth rate group. What is the average inflation and average Debt/GDP among these groups? 
WITH growth_status AS (SELECT country, Inflation, `Debt/GDP`, CASE
WHEN `GDP Growth` < 0 THEN 'Contracting'
WHEN `GDP Growth` BETWEEN 0 AND 2 THEN 'Stagnant'
ELSE 'Growing' END AS status FROM countries)
SELECT COUNT(*) AS num_of_countries, ROUND(AVG(Inflation), 1) AS average_inflation, ROUND(AVG(`Debt/GDP`),1) AS `average_debt/GDP`, status FROM growth_status GROUP BY status;
-- 'Contracting' growth rate countries had an average inflation of 188.9% and an average Debt/GDP of 89.2% (4 countries)
-- 'Stagnant' growth rate countries had an average inflation 4.3% of and an average Debt/GDP of 67.8% (43 countries)
-- 'Growing' growth rate countries had an average inflation 5% of and an average Debt/GDP of 56.5% (145 countries)

-- c. Categorize all countries into the following population groups: '0 - 10,000,000', '10,000,001 - 50,000,000', '50,000,001 - 100,000,000', and '+100,000,001'. What is the average GDP/Capita for each country and the average and rank within each group?
WITH pop_groups AS (SELECT Country,`GDP/Capita`, CASE
WHEN Population BETWEEN 0 AND 10000000 THEN '0 - 10,000,000'
WHEN Population BETWEEN 10000001 AND 50000000 THEN '10,000,001 - 50,000,000'
WHEN Population BETWEEN 50000001 AND 100000000 THEN '50,000,001 - 100,000,000'
ELSE '+100,000,001' END AS population_groups FROM countries) 
SELECT Country, 
`GDP/Capita`,
population_groups,
AVG(`GDP/Capita`) OVER(PARTITION BY population_groups) AS `avg_GDP/Capita_per_pop`,
RANK() OVER(PARTITION BY population_groups ORDER BY `GDP/Capita` DESC) AS `rank_avg_GDP/Capita` FROM pop_groups ORDER BY population_groups;
-- Countries will a population between 0 and 10,000,000 had an average GDP/Capita of 28,167.29
-- Countries will a population between 10,000,001 and 50,000,000 had an average GDP/Capita of 13,743.02
-- Countries will a population between 50,000,001 and 100,000,000 had an average GDP/Capita of 20,802.38
-- Countries will a population over over 100,000,001 had an average GDP/Capita of 13,543.39