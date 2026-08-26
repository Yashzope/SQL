# second highest salary

#sub query 
select first_name,last_name,salary 
from employees 
where salary <
(select max(salary) 
from employees)
limit 1;

#dense rank
select * from 
(
select salary, 
dense_rank() over(order by salary desc) as rnk 
from employees
) as el
where rnk = 2;

#dense rank + cte
with 2nd_hig as
(
select first_name,last_name,salary
,dense_rank() over(order by salary desc) as rnk
from employees 
) select * from 2nd_hig
where rnk =2;

#highest salary from each department

#max + subquery

select e.first_name,e.last_name,e.salary,e.dept_id 
from employees e
where e.salary = 
(select max(e2.salary) from
employees e2
where e.dept_id = e2.dept_id);

select e.first_name,e.last_name,e.salary,e.dept_id
from employees e 
join (
select dept_id,max(salary) as max_sal
from employees 
group by dept_id
 ) d
 on e.dept_id = d.dept_id
 and e.salary = d.max_sal;

with dpt_sal as 
(select max(salary) as sal,dept_id
from employees 
group by dept_id)
select e.first_name,e.last_name,e.salary,e.dept_id
from employees e
join dpt_sal d
on e.dept_id = d.dept_id
and e.salary = d.sal;

select first_name,last_name,salary,dept_id
from
(select first_name,last_name,salary,dept_id,
dense_rank() over(partition by dept_id order by salary desc)as rnk
from employees) e
where rnk = 1;



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