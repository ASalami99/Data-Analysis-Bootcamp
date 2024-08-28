# Limit and Aliasing

select *
from employee_demographics
order by age desc
limit 5;

select *
from employee_demographics
order by age
limit 5;

select *
from employee_demographics
order by age
limit 3, 1;	#Start from the third row, get the next row (one)


# Aliasing
select gender, avg(age) as avg_age	#makes the new column that is to be created (avg(age)) to be named (avg_age)
from employee_demographics
group by gender
having avg_age > 40
;