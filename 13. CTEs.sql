-- Common Table Expressions (CTEs)
-- They are like subqueries

select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;

-- To turn the above into a CTE, we do the following:
-- 1. Start with 'with'
-- 2. You can only use the CTEs immediately after it is created

with CTE_Example as
(
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as sal_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from CTE_Example
;

-- Subquery equivalent
select avg(avg_sal)
from (
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as sal_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
) as sub_query_equivalent;


-- Multiple CTEs in a single CTE
with CTE_Example as
(
select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_Example
join CTE_Example2
	on CTE_Example.employee_id = CTE_Example2.employee_id
;