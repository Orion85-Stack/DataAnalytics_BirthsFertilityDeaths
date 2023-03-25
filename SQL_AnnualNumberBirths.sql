-- Select the database to view contents

select *
from Health_Project_Maternal..[Annual-number-births-world];

-- Count the total distinct countries

select count(distinct(Entity)) as country
from Health_Project_Maternal..[Annual-number-births-world];

-- count observations per country

select Entity as country ,count(Entity) as country
from Health_Project_Maternal..[Annual-number-births-world]
group by Entity
order by 1;

--creating join between annual numbers and fertility rate

select ab.Entity, ab.Year, ab.[Births - Sex: all - Age: all - Variant: estimates] as Births, cw.[Fertility rate - Sex: all - Age: all - Variant: estimates] as Fertility_Rate
from Health_Project_Maternal..[Annual-number-births-world] ab
join Health_Project_Maternal..[Children-per-woman'] cw
 on ab.Entity = cw.Entity
 and ab.Year = cw.Year
group by ab.Entity, ab.Year, ab.[Births - Sex: all - Age: all - Variant: estimates], cw.[Fertility rate - Sex: all - Age: all - Variant: estimates]
order by 1, 2;

-- creating join between 3 tables (Annual, ChildrenWomen, DeathsUnder5)

select ab.Entity, ab.Year, ab.[Births - Sex: all - Age: all - Variant: estimates] as Births, 
	cw.[Fertility rate - Sex: all - Age: all - Variant: estimates] as Fertility_Rate, 
	du5.[Deaths in under-fives]
from Health_Project_Maternal..[Annual-number-births-world] ab
	join Health_Project_Maternal..[Children-per-woman'] cw
		on ab.Entity = cw.Entity
		and ab.Year = cw.Year
	left outer join Health_Project_Maternal..Death_Under_five du5		-- left outer join used as some data is not available in the table compared to the other tables. 
		on ab.Entity = du5.Entity
		and ab.Year = du5.Year
group by ab.Entity, ab.Year, ab.[Births - Sex: all - Age: all - Variant: estimates], cw.[Fertility rate - Sex: all - Age: all - Variant: estimates], du5.[Deaths in under-fives]
order by 1, 2;

-- creating joing between the 4 tables (Annual, ChildrenWomen, DeathUnder5, DeathUnder1)

select ab.Entity, ab.Year, ab.[Births - Sex: all - Age: all - Variant: estimates] as Births, 
	cw.[Fertility rate - Sex: all - Age: all - Variant: estimates] as Fertility_Rate, 
	du5.[Deaths in under-fives] as death_under_5,
	du1.[Deaths - All causes - Sex: Both - Age: <1 year (Number)] as death_under_1
from Health_Project_Maternal..[Annual-number-births-world] ab
	join Health_Project_Maternal..[Children-per-woman'] cw
		on ab.Entity = cw.Entity
		and ab.Year = cw.Year
	left outer join Health_Project_Maternal..Death_Under_five du5		-- left outer join used as some data is not available in the table compared to the other tables. 
		on ab.Entity = du5.Entity
		and ab.Year = du5.Year
	left outer join Health_Project_Maternal..Death_Under_One du1
		on ab.Entity = du1.Entity
		and ab.Year = du1.Year
group by ab.Entity, ab.Year, ab.[Births - Sex: all - Age: all - Variant: estimates], 
	cw.[Fertility rate - Sex: all - Age: all - Variant: estimates], 
	du5.[Deaths in under-fives], 
	du1.[Deaths - All causes - Sex: Both - Age: <1 year (Number)]
order by 1, 2;