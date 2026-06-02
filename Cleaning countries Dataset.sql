-- Part 0: Cleaning countries Dataset
-- Create database to immport and analyze world data
CREATE DATABASE countries_june_2026;


-- I imported the dataset into an unrestricted table using the Table Data Import Wizard
-- I will alter to table to add restrictions for empty values in the columns Country, CODE, and Population and force CODE to only accept strings of three letters
ALTER TABLE countries MODIFY Country TEXT NOT NULL;
ALTER TABLE countries MODIFY CODE CHAR(3) NOT NULL;
ALTER TABLE countries MODIFY Population INT NOT NULL;


-- Most of the NULL values are in the GDP column and would be unreliable to estimate. Those rows should be removed from our dataset.
DELETE FROM countries WHERE `GDP (USD)` IS NULL;


-- Since there are NULL values in the Unemployment column, we will assume a default unemployment rate value of the column to the average world unemployment rate of 4.9%
-- First, we need to set all of our current NULL values to 4.9, then alter the table to require it to be NOT NULL and if new data is NULL, it will change to a default value of 4.9
UPDATE countries SET Unemployment = '4.9' WHERE Unemployment IS NULL;
ALTER TABLE countries MODIFY Unemployment double NOT NULL DEFAULT 4.9;


-- Now, we will assume the percentage values for the Debt/GDP and Trade/GDP columns by averaging the Debt/GDP and Trade/GDP values of the other countries in the dataset
-- This will then be our default value for those columns and will have to be updated
SELECT ROUND(AVG(`Debt/GDP`),1) FROM countries WHERE `Debt/GDP` IS NOT NULL;

-- Now, NULL entries and DEFAULT for Debt/GDP will be updated
UPDATE countries SET `Debt/GDP` = 59.7 WHERE `Debt/GDP` IS NULL;
ALTER TABLE countries MODIFY `Debt/GDP` double NOT NULL DEFAULT 59.7;


-- Now, repeat process for Trade/GDP
SELECT AVG(`Trade/GDP`) FROM countries WHERE `Trade/GDP` IS NOT NULL;
-- This gave a value of 94.21049468

-- Now, NULL entries and DEFAULT for Trade/GDP will be updated
UPDATE countries SET `Trade/GDP` = 94.21049468 WHERE `Trade/GDP` IS NULL;
ALTER TABLE countries MODIFY `Trade/GDP` double NOT NULL DEFAULT 94.21049468;