# Project: Analyzing Economic and Living Standard Conditions of Countries
## Data Source: https://statisticsoftheworld.com/

## Project Overview:
This project aims to analyze the relationship between the economic strength of a country compared to its population size and basic standard of living metrics. While there are many countries that are both population and GDP powerhouses, that wealth is often not equally distributed among their massive populations. I aim to use SQL to explore how major economic measures like GDP and the GDP growth rate scale relative to population, life expectancy, inflation, and debt.

## Table Contents:
| countries |
-------------
| Country |
| CODE |
| GDP (USD) |
| Population |
| GDP/Capita |
| GDP Growth |
| Inflation |
| Unemployment |
| Debt/GDP |
| Life Exp. |
| Trade/GDP |

## Data Normalization:
* Utilized Excel to change all empty table cells into NULL values
* Cleaned data further in MySQL Workbench by removing 25 country entries missing GDP values
* Estimated NULL values in three columns (Unemployment, Debt/GDP, and Trade/GDP) by calculating the average values from the remaining countries in the dataset

## Major Insights:
* By grouping countries into the GDP growth rate categories of 'Contracting' (GDP Growth < 0), 'Stagnant' (0 <= GDP Growth <= 2), or 'Growing' (GDP Growth > 2), it can be seen that countries with a contracting GDP growth rate are prone to higher inflation rates and debt than those with higher GDP growth rates
* Countries with stagnant GDP growth rates have a much higher debt-to-GDP ratio than countries with a growing GDP rate
* For this dataset, average inflation is higher in countries with growing GDP rates than in countries with stagnant growth rates, since a couple of countries in the growing status technically fall within the 'overheating' growth rate range and are also currently experiencing hyperinflation (Sudan, South Sudan)
* Very small, rich countries dominate when comparing how the economy scales in relation to population (Luxembourg, Iceland, and San Marino)
* Massively populated countries (+100 million) had the lowest GDP/capita figure on average, even with a high GDP/capita country like the United States
