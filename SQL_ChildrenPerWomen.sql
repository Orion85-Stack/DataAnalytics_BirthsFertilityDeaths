-- Select database to see import

select *
from Health_Project_Maternal..[Children-per-woman']


-- Count distinct countries

select count(distinct(Entity)) as countries
from Health_Project_Maternal..[Children-per-woman'];


-- Count of entries per country
-- Countries (72) and 255 observations per country

SELECT Entity as countries, count(Entity) as total_observations_country
FROM Health_Project_Maternal..[Children-per-woman']
GROUP BY Entity
order by Entity;
