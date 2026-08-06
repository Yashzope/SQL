with sal as 
(
select emp_id,first_name,salary
from employees
)
select * from sal 
where salary > 50000;

with emp_dpt as
(
select e.first_name,e.emp_id,d.dept_id
from employees e
inner join
departments d 
on e.dept_id = d.dept_id
)
select * from emp_dpt;

with emp_det as
(
select d.dept_id,d.dept_name
from employees e 
inner join 
departments d
on e.dept_id = d.dept_id
group by d.dept_id,d.dept_name
having count(emp_id) > 10
)
select * from emp_det;

with em_count as
(
select dept_id,count(*) as empp
from employees 
group by dept_id
),
dept_wise as
(
select * 
from em_count
where empp > 10
)
select * from dept_wise
order by empp desc;

with mult as 
(
select c.customer_id,c.customer_name,sum(oi.quantity*unit_price) as spending
from customers c
inner join orders o
on o.customer_id = c.customer_id
inner join order_items oi
on o.order_id = oi.order_id
group by c.customer_id,c.customer_name
),
spend as (select spending from mult
where spending > 100000)
select * from spend;

select dept_id,salary,avg(salary) over() as avg_sal
from 
employees ;

select emp_id,first_name,salary,row_number() over(order by salary desc) as ro
from employees;

select emp_id,first_name,salary,row_number() over(order by salary desc) as sal_rnk
from employees;

with exp_pro as
(
select product_name,selling_price,row_number() 
over(partition by category_id order by selling_price desc) as rn
from products
)
select * from exp_pro;

with lat_ord as
(
select order_id,customer_id,order_date,
row_number() over(partition by customer_id order by order_date desc) as rnk
from orders
)
select * from lat_ord 
where rnk = 1;


select emp_id,first_name,salary,
rank() over(order by salary desc) as rnk
from employees;

with hig_sal as
( select first_name,salary,
rank() over(order by salary desc)as sal 
from employees
)
select * from hig_sal
where sal <=2;

with hgg as
(
select first_name,salary,
rank() over(order by salary desc) as sel
from employees
)
select * from hgg
where sel <= 3;

with emp_sal as
(
select emp_id,first_name,
dense_rank() over(order by salary desc)
from employees 
)
select * from emp_sal;

with emp_sal as
(
select emp_id,first_name,salary
,dense_rank() over(order by salary desc) rnk
from employees 
)
select * from emp_sal
where rnk <= 2;

with prd as
(
select product_name,selling_price,
dense_rank() over(partition by category_id order by selling_price desc) as rnk
from products
)
select * from prd
where rnk = 1;

select * from
employees e1
where N - 1 = 
(select count(distinct salary)
from employees e2
where e2.salary > e1.salary); 

select first_name,salary,
lag(salary) over(order by salary desc) as pv_sal
from employees;

select customer_id,order_date,
lag(order_date) over(partition by customer_id order by order_date) as pv_ord
from orders;

select emp_id,first_name,salary,
lag(salary) over(order by salary) as prv_sal,
salary - lag(salary) over(order by salary) as diff
from employees;

with pv_sal_diff as 
(
select emp_id,first_name,salary,
lag(salary) over(order by salary) as prv_sal,
salary - lag(salary) over(order by salary) as diff
from employees)
select * from pv_sal_diff;



select emp_id,first_name,
lag(salary) over(order by salary) as rpv_sal,
salary,
lead(salary) over (order by salary) as nxt_sal
from employees;

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