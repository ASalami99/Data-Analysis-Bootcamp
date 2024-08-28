# String Functions

# Length
select length('racecar');
select first_name, length(first_name)
from employee_demographics
order by 2;

# Upper
select upper('sky');
select first_name, age, upper(first_name) as Caps
from employee_demographics
;

# Lower
select lower('sky');
select first_name, age, lower(first_name) as UnCaps
from employee_demographics
;

# Trim
select trim('        cat            ') as Animal;
select rtrim('        cat            ') as Animal;
select ltrim('        cat            ') as Animal;

# Left 
select first_name, left(first_name, 2)
from employee_demographics
;

# Right
select first_name, right(first_name, 2)
from employee_demographics
;

#Substring like =mid(x,y) in excel
select first_name, substring(first_name,3,2)
from employee_demographics
;

select first_name,
left(first_name, 2),
right(first_name, 2),
substring(first_name,3,2),
birth_date,
substring(birth_date, 6, 2)
from employee_demographics
;

# Replace
select first_name, replace(first_name,'a','z')	# Replace all the small letter as like in Mark and Craig 
from employee_demographics
;

# Locate
select locate('p','April');
select first_name, locate('An',first_name)	# Locate all the places where An is present
from employee_demographics
;

# Concatenation
select first_name, last_name,
concat(first_name,' ',last_name)
from employee_demographics
;
