-- Window Functions

select gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;

# Partition by is similar to group but it does for each of the rows. Group only outputs the groups themselves alone
select dem.first_name, dem.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# Rolling Sum -> Like cummulative sum
select dem.first_name, dem.last_name, gender,
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Sum
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# Row number -> Basically like giving the ids. Does not naturally repeat except when using it with partition
select dem.first_name, dem.last_name, gender,
row_number() over()
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# Row number with partition
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# Rank -> Like in a golden boot race when 2 people are second and so the next person is 4th instead of third
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# Dense Rank -> Unlike rank, it would give the next position 3rd instead of 4th
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    