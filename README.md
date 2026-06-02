# Project: Analyzing Economic and Living Standard Conditions of Countries
## Data Source: https://statisticsoftheworld.com/

## Project Overview:
This project aims to analyze the relationship between the economic strength of a country compared to its population size and basic standard of living metrics. While many countries are population and GDP powerhouses, that wealth is often not equally shared among their populations. I aim to use SQL to explore how major economic measures like GDP and the GDP growth rate scale relative to population, life expectancy, inflation, and debt.

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
* By grouping countries into the GDP growth rate categories of 'Contracting' (GDP Growth < 0), 'Stagnant' (0 <= GDP Growth <= 2), or 'Growing' (GDP Growth > 2), it can be seen that countries with a contracting GDP growth are prone to significantly higher inflation rates and debt than those with higher GDP growth rates.
* Countries within the 'Stagnant' GDP growth rate group have a much higher debt-to-GDP ratio than countries with a growing GDP rate
* Inflation is higher in growing GDP rates than in 'Stagnant' since many countries in the growing status are technically 'overheating' and many are inflating their own GDPs by mass printing local currency.
* 
