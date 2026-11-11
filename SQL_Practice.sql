USE enterprise_sql_master;

SHOW TABLES;

-------------------------------------------------------------------------
#SQL Fundamentals

select * from employees;

select first_name,last_name,salary from employees;

select distinct department_id 
from employees;

select employee_id,first_name,last_name,salary 
from employees
where salary > 50000
;

select employee_id,first_name,last_name,salary 
from employees
where salary < 30000
;

select employee_id,first_name,last_name,salary 
from employees
where salary = 75000
;

select employee_id,first_name,last_name,salary 
from employees
order by salary;

select employee_id,first_name,last_name,salary 
from employees
order by salary desc;

select employee_id,first_name,last_name,salary 
from employees
order by salary desc,employee_id asc;

select employee_id,first_name,last_name,salary 
from employees
order by salary desc
limit 5;

select employee_id,first_name,last_name,salary 
from employees
order by salary asc
limit 3;

select employee_id,first_name,last_name,salary 
from employees
where first_name like "A%";

select employee_id,first_name,last_name,salary 
from employees
where first_name like "%n";

select employee_id,first_name,last_name,salary 
from employees
where first_name like "%ar%";

select employee_id,first_name,last_name,salary 
from employees
where salary between 30000 and 50000;

select employee_id,first_name,last_name,department_id,salary 
from employees
where department_id in (10,20,30,40);

select employee_id,first_name,last_name,department_id,salary 
from employees
where department_id not in (10,20,30);

select employee_id,first_name,last_name,department_id,salary 
from employees
where department_id is null;

select employee_id,first_name,last_name,department_id,salary 
from employees
where department_id is not null;

select employee_id,first_name,last_name,salary 
from employees
limit 10;

select employee_id,first_name,last_name,salary 
from employees
where salary > 50000
order by salary desc;

select max(salary)
from employees;

select min(salary)
from employees;

select distinct salary 
from employees
limit 1 offset 1;

select max(salary) 
from employees
where salary  < (
select max(salary) from employees);

select employee_id,first_name,last_name,salary 
from employees
where char_length(first_name) = 5;

select distinct department_id,salary
from employees;
--------------------------------------------------------------------------
#filtering and operators


-------------------------------------------------------------------------
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM categories;
SELECT * FROM suppliers;
SELECT * FROM products;
SELECT * FROM warehouses;
SELECT * FROM inventory;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;
SELECT * FROM shipments;
SELECT * FROM support_tickets;
SELECT * FROM campaigns;
SELECT * FROM campaign_interactions;
SELECT * FROM projects;
SELECT * FROM project_assignments;
SELECT * FROM expenses;