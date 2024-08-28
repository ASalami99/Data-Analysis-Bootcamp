-- Temporary Tables: They are only visible to the session they are created in
-- i.e once I close Workbench, it's gone

create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);

-- To view the content, select/ perform an action on it e.g
select *
from temp_table;

-- Inserting data into it
insert into temp_table
values('Abdullah', 'Snow', 'Prison Break');

-- Checking
select *
from temp_table;



-- Example
SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
(
SELECT *
FROM employee_salary
WHERE salary > 50000
);

SELECT *
FROM salary_over_50k;