-- Stored Procedures	-> A way to save SQL code that you reuse over and over again
						-- -> Like calling on a function

select *
from employee_salary
where salary >= 50000
;

-- How to create it
create procedure large_salaries()
select *
from employee_salary
where salary >= 50000
;

-- How to call it
call large_salaries();


-- Better way to create it				It produces two tables
delimiter $$
create procedure large_salaries2()
begin
	select *
	from employee_salary
	where salary >= 50000;
	select *
	from employee_salary
	where salary >= 10000;
end $$
delimiter ;	#changing the delimiter back to normal

-- Calling it
call large_salaries2();





-- Parameters

delimiter $$
create procedure large_salaries3(xar INT)
begin
	select salary
	from employee_salary
    where employee_id = xar		#The first employee_id is the name of the column and the second one is the name of the parameter
    ;
end $$
delimiter ;

call large_salaries3(1)

