#joins

select e.emp_id,e.first_name,d.dept_id,d.dept_name 
from employees e 
inner join
departments d
on e.dept_id = d.dept_id;

select e.first_name,ep.role_name,p.project_name
from employees e 
inner join employee_projects ep
on e.emp_id = ep.emp_id
inner join projects p
on p.project_id = ep.project_id;

select c.customer_name,o.order_id,o.order_date
from customers c 
inner join
orders o
on c.customer_id = o.customer_id; 

select p.product_name,o.quantity
from products p
inner join 
order_items o
on o.product_id = p.product_id;

select c.customer_name,p.product_name,oi.quantity,oi.unit_price
from customers c
inner join orders o
on order_id = oi.order_id
inner join products p
on p.product_id = oi.product_id;

select e.first_name,d.dept_name,p.project_name,ep.role_name
from employees e
inner join 
departments d
on e.dept_id = d.dept_id
inner join
employee_projects ep
on e.emp_id = ep.emp_id
inner join projects p
on ep.project_id = p.project_id;

select e.emp_id,e.first_name,d.dept_name
from employees e
left join 
departments d
on e.dept_id = d.dept_id;

select c.customer_name,o.order_id,o.order_date
from customers c
left join 
orders o
on c.customer_id = o.customer_id;

select c.customer_name
from customers c
left join 
orders o
on c.customer_id = o.customer_id
where order_id is null;

select p.product_name,count(oi.order_item_id) as ordered_items
from products p
left join 
order_items oi
on p.product_id = oi.product_id
group by p.product_id,p.product_name;

select d.dept_id,d.dept_name,count(e.first_name) as working_employees
from departments d
left join
employees e
on d.dept_id = e.dept_id
group by dept_id,dept_name;

select d.dept_id,d.dept_name,e.first_name
from employees e
right join
departments d 
on e.dept_id = d.dept_id;

select c.category_id,c.category_name,p.product_name
from products p 
right join 
 categories c
 on p.category_id = c.category_id;

select e.first_name,d.dept_name
from employees e
left join 
departments d
on e.dept_id = d.dept_id
union
select e.first_name,d.dept_name
from employees e
right join 
departments d 
on e.dept_id = e.dept_id;

select e.first_name,m.first_name
from employees e
inner join
employees m
on e.manager_id = m.emp_id;

select c.customer_name,o.order_id,p.product_name,oi.quantity,oi.unit_price
from customers c
inner join
orders o
on c.customer_id = o.customer_id
inner join 
order_items oi
on o.order_id = oi.order_id
inner join 
products p
on oi.product_id = p.product_id
order by quantity desc;

select d.dept_id,d.dept_name,count(e.emp_id)
from departments d
inner join 
employees e

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