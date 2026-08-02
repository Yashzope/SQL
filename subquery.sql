show databases;

use sql_master_db;
----------------------------------------------------------------------------------------------
#subquery

select first_name,last_name,salary from employees
where salary > 
( select avg(salary) from employees );

select first_name,last_name,salary 
from employees
where salary =
(select max(salary) from employees 
);

select first_name,last_name,salary 
from employees where salary =
(select min(salary) from employees);

select *
from employees 
where salary >
(select avg(salary) from employees );

select product_name,selling_price 
from products
where selling_price > 
(select avg(selling_price) from products);

select product_name,selling_price 
from products 
where selling_price =
(select max(selling_price) from products );

select product_name,selling_price
from products
where selling_price = 
(select min(selling_price) from products);

select * 
from customers
where customer_id = 
(select customer_id 
from orders
group by customer_id
order by sum(selling_price) desc
limit 1); 

select * from customers
where customer_id = (select customer_id
from order_items
group by customer_id
order by sum(unit_price));

select dept_name 
from departments
where budget >
(select avg(budget) from departments);

select first_name,experience_years
from employees 
where experience_years > 
(select avg(experience_years) 
from employees);

select dept_name,budget
from departments
where budget = (select max(budget) 
from departments
order by budget desc
limit 1);

select first_name,salary 
from employees
where salary > 
(select salary from 
employees
where emp_id = 100);

select * 
from employees 
where salary < 
(select max(salary)
from employees
);

select *
from departments
where budget >
(select min(budget)
from departments);

select product_name,selling_price 
from products 
where selling_price < 
(select max(selling_price)
from products);

select first_name,hire_date
from employees
where hire_date >
(select hire_date 
from employees 
where emp_id = 50);

select dept_name,budget 
from departments
where budget > 
(select budget 
from departments
where dept_name = 'Sales');

select first_name,salary 
from employees
where salary = 
(select salary 
from employees 
where emp_id = 25);

select customer_name,city
from customers
where customer_id in
(select customer_id 
from orders);

select first_name,last_name,salary
from employees
where salary > all
(select salary 
from employees 
where dept_id = 1);

select product_name,selling_price
from products
where selling_price > any
(select selling_price
from products 
where category_id = 5);

select dept_name,budget
from departments
where budget > any
(select budget
from departments
where dept_id = 3);

select emp_id,first_name,last_name
from employees e
where salary > 
(select avg(salary) 
from employees e2
where e.dept_id = e2.dept_id);

select e.*
from employees e
where e.salary =
(select max(salary)
from employees e2
where e.dept_id = e2.dept_id);

select p.*
from products p
where p.selling_price > 
(select avg(p2.selling_price)
from products p2
where p.category_id = p2.category_id);

select p.* 
from products p
where p.selling_price =
(select max(p2.selling_price) 
from products p2
where p.category_id = p2.category_id);

select c.customer_name
from customers c
where 
(select count(*) 
from orders o
where c.customer_id = o.customer_id) > 1;

select p.product_name,p.selling_price
from products p
where p.selling_price >
(select avg(p2.selling_price) 
from products p2
where p.category_id = p2.category_id);

select p.project_id,p.project_name
from projects p 
where 
(select count(*)
from employee_projects p2
where p.project_id = p2.project_id) >5;

select emp_id,first_name
from employees e
where
(select count(*) 
from employee_projects e2
where e.emp_id = e2.emp_id)
>1;

select c.customer_id,c.customer_name
from customers c
where
(select count(*) from orders o
where c.customer_id = o.customer_id)=0;

select c.customer_id,c.customer_name
from customers c
where c.customer_id not in
(select customer_id from orders o
where c.customer_id = o.customer_id);

select e.emp_id,e.first_name,e.salary
from employees e
where e.salary >
(select avg(salary) from employees e2
where e.dept_id = e2.emp_id);

select e.emp_id,e.dept_id,e.first_name,e.salary
from employees e 
where salary = 
(select max(salary) 
from employees e2
where e.dept_id = e2.dept_id);

select c.customer_id,c.customer_name 
from customers c
where 
(select count(*) 
from orders o
where c.customer_id = o.customer_id)>5; 

select d.dept_id,d.dept_name
from departments d 
where
(select count(*) 
from employees e
where e.dept_id = d.dept_id) > 20;

select p.product_name,p.selling_price
from products p
where
(select avg(selling_price)
from products p2
where p.category_id = p2.category_id);

select p.*
from products p
where
(select max(selling_price)
from products p2
where p.category_id = p2.category_id);

select c.customer_id,customer_name
from customers c
where exists
(select 1 from orders o
where c.customer_id = o.customer_id);

select p.product_id,p.product_name
from products p 
where not exists 
(select * from  
order_items o
where p.product_id = o.product_id );

select e.emp_id,e.first_name
from employees e
where exists 
(select *
from employee_projects ep
where e.emp_id = ep.emp_id
and ep.role_name = "Team Lead" );

select c.customer_id,c.customer_name
from customers c
where exists
(select * from orders o
where c.customer_id = o.customer_id);

select customer_id,customer_name 
from customers 
where customer_id in 
(select customer_id from orders 
);

select emp_id,first_name
from employees 
where dept_id in
(select dept_id
from departments 
where budget = 
(
select max(budget) 
from departments
	)
);

select customer_id,customer_name
from customers
where customer_id in
(select product_id 
from products
where product_id = 
(
select product_id 
from products
where product_name = "Electronics")
);

select dept_id,dept_name,budget
from departments 
where budget >
(select avg(budget) 
from departments
);

select product_id,product_name
from products
where product_id not in 
(select product_id
from order_items);

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
