 -- WHERE Clause
 
select *
from employee_salary
where first_name = 'Leslie'
;
 
select *
from employee_salary
where salary > 50000
;

select *
from employee_demographics
where gender != 'Female'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
;

-- AND OR NOT--   Logical Operators
select *
from employee_demographics
where birth_date > '1985-01-01'
AND gender = 'Male'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
OR gender = 'Male'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
OR NOT gender = 'Male'
;

select *
from employee_demographics
where (first_name =  'Leslie' and age = 44) OR age > 55
;

# Like Statement
# % and _
# % -> means anything
# _ -> means a specific value

select *
from employee_demographics
where first_name like 'Jer%'
;

select *
from employee_demographics
where first_name like 'a__'
;

select *
from employee_demographics
where first_name like 'a___%'
;

select *
from employee_demographics
where birth_date like '1989%'
;