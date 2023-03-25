-- select the database

select *
from Health_Project_Maternal..Death_Under_One;

-- Count all the distinct countries

select count(distinct(Entity))
from Health_Project_Maternal..Death_Under_One;

-- Count all the countries and observations

select Entity ,count(Entity)
from Health_Project_Maternal..Death_Under_One
group by Entity
order by 1;