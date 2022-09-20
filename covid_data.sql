--Select Data that we will use
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_clean
ORDER BY 1,2

-- Look at Total Cases vs Total Deaths
Shows likelihood of dying from covid
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_perc
FROM covid_clean
WHERE location = 'United States'
ORDER BY 1,2

--Total cases vs Population
Shows what % of Pop got covid
SELECT location, date, population, total_cases, (total_cases/population)*100 as contracted_pop
FROM covid_clean
WHERE location = 'United States'
ORDER BY 1,2

--Looking at Countries with Highest infection rate compared to populaiton
SELECT location, population, MAX(total_cases) as HighestInfectionCount, 
        MAX((total_cases/population))*100 as ContractedPopulation
FROM covid_clean
GROUP BY location, population
ORDER BY ContractedPopulation desc

-- Showing Countries with Highest Death Count per Population
SELECT location, MAX(cast(total_deaths as int)) as total_death_count
FROM covid_clean
WHERE location IS NOT NULL
GROUP BY location
ORDER BY total_death_count desc

-- Lets break down by continent 
Showing the Continents with the highest death count
SELECT location, MAX(cast(total_deaths as int)) as total_death_count
FROM covid_clean
WHERE continent IS NULL
GROUP BY location
ORDER BY total_death_count desc

--Global Numbers by date
SELECT date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, 
    SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
FROM covid_clean
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2

--Total Global numbers

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, 
    SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
FROM covid_clean
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2

--Looking at total Pop vs Vacc
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations as INT)) OVER (Partition by dea.location 
        ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
      --, (rolling_people_vaccinated/population)*100     
FROM covid_clean dea
JOIN vaccine_clean vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

--USE CTE
WITH pop_vs_vac (continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations as INT)) OVER (Partition by dea.location 
        ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
            
FROM covid_clean dea
JOIN vaccine_clean vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3
)
SELECT *, (rolling_people_vaccinated/population)*100
FROM pop_vs_vac

 --TEMP TABLE

CREATE TABLE percent_population_vaccinated
(
continent varchar(255),
lacation varchar(255),
date date,
population numeric,
new_vaccinations numeric,
rolling_people_vaccinated numeric    
)


INSERT INTO percent_population_vaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations as INT)) OVER (Partition by dea.location 
        ORDER BY dea.location, dea.date) AS rolling_people_vaccinated          
FROM covid_clean dea
JOIN vaccine_clean vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *, (rolling_people_vaccinated/population)*100
FROM percent_population_vaccinated 


--CREATING View to store data for later visualizations

CREATE VIEW view_percent_population_vaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations as INT)) OVER (Partition by dea.location 
        ORDER BY dea.location, dea.date) AS rolling_people_vaccinated          
FROM covid_clean dea
JOIN vaccine_clean vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

CREATE VIEW total_global_numbers AS
SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, 
    SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
FROM covid_clean
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2

--INFECTION VS POPULATION
CREATE VIEW infection_vs_pop AS
SELECT location, population, MAX(total_cases) as HighestInfectionCount, 
        MAX((total_cases/population))*100 as ContractedPopulation
FROM covid_clean
GROUP BY location, population
ORDER BY ContractedPopulation desc
