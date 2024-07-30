#Group by

select *
from employee_demographics;

select gender
from employee_demographics
group by gender
;

select gender, avg(age)
from employee_demographics
group by gender
;

select occupation, salary
from employee_salary
group by occupation, salary
;

select occupation, avg(salary)
from employee_salary
group by occupation
;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

#Order By
select *
from employee_demographics
order by gender
;

select *
from employee_demographics
order by gender, age
;

select *
from employee_demographics
order by gender, age desc
;
