-- select the database

select *
from Health_Project_Maternal..Death_Under_five;


-- count the total distinct countries

select count(distinct(Entity))
from Health_Project_Maternal..Death_Under_five;


-- count countries and observations

select Entity, count(Entity)
from Health_Project_Maternal..Death_Under_five
group by Entity
order by 1;

--Adding table for death under 1

select du5.Entity, du5.Year, du5.[Deaths in under-fives] as Death_under_5, 
		du1.[Deaths - All causes - Sex: Both - Age: <1 year (Number)] as Death_under_1,
		(du5.[Deaths in under-fives]-du1.[Deaths - All causes - Sex: Both - Age: <1 year (Number)]) as diff_deaths
from Health_Project_Maternal..Death_Under_five du5
		left outer join Health_Project_Maternal..Death_Under_One du1
		on du5.Entity = du1.Entity
		and du5.Year = du1.Year
group by du5.Entity, du5.Year, du5.[Deaths in under-fives],
		du1.[Deaths - All causes - Sex: Both - Age: <1 year (Number)]
order by 1,2;
