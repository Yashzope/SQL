

select first_name,salary,avg(salary) over() as sal
from employees;

select first_name,salary,max(salary) over() max_sal
from employees;

select first_name,salary,min(salary) over() as min_sal
from employees;

select first_name,salary,sum(salary) over() as sum_sal
from employees;

select first_name,salary,count(*) over() as emp_count
from employees;

select first_name,salary,avg(salary) over(partition by dept_id) as avg_sal
from employees;

select first_name,salary,count(*) over(partition by dept_id) as emp_count
from employees;

select first_name,salary,row_number() over(order by salary desc) from employees;

select first_name,salary,rank() over(order by salary desc) from employees;

select first_name,salary,dense_rank() over(order by salary desc) from employees;

select first_name,salary,ntile(4) over(order by salary desc) as quartile from employees;

select first_name,salary from 
(select first_name,salary, dense_rank() over(order by salary desc) as sal from employees) as e
where sal <= 2;

-----------------------------------------------------------------------------------------------

#case statements


-----------------------------------------------------------------------------------------------
use sql_master_db;
show tables;

select * from categories;
select * from customers;
select * from departments;
select * from employee_projects;
select * from employees;
select * from locations;	
select * from order_items;
select * from orders;
select * from products;
select * from projects;