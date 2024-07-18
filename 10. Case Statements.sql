# Case Statemnts

select first_name, 
last_name,
case
	when age <= 30 then 'Young'
    when age between 31 and 50 then 'Old'
    when age >= 50 then 'Very very old'
end as Age_Bracket
from employee_demographics;
select *
from employee_salary;

-- Pay Increase and bonus
-- < 50000 = 5% bonus
-- > 50000 = 7% bonus
-- Finance = 10% bonus
select first_name,
last_name,
salary,
case
	when salary < 50000 then salary + ((5/100) * salary)
    when salary >= 50000 then salary + ((7/100) * salary)
end as Pay_Increase,
case
    when dept_id = 6 then salary + ((10/100) * salary)
end as Bonus
from employee_salary;