select * from employees
where salary > 60000;

with high_sal as
(
select * from employees
) select first_name,last_name,salary
from employees
where salary > 60000;

select * from employees 
where salary >
(
select 60000
);

select first_name,last_name,salary 
from employees 
order by salary
limit 5;

select first_name,last_name,salary
from employees
where emp_id in
(
select emp_id
from employees
order by salary desc
limit 5
);

with fiv_sal as
(select first_name,salary
from employees
order by salary desc
limit 5)
(select * from fiv_sal);

select first_name,last_name,salary,
row_number() over(order by salary desc) as top5_sal
from employees
limit 5;

with top5sal as
(select first_name,last_name,salary,
rank() over(order by salary desc) as top_sal
from employees)
select first_name,last_name,salary from top5sal
where top_sal <=5;


select first_name,last_name, salary
from employees 
where salary in (select 
distinct salary from employees
order by salary desc
limit 5);

with hig_sal as
(select first_name,last_name,salary,
dense_rank() over(order by salary desc) as sal
from employees
)
select * from hig_sal
limit 5;

select first_name,last_name,salary,
avg(salary) over() as avg_sal,
max(salary) over() as max_sal,
min(salary) over() as min_sal
from employees;

with sal as 
(
select first_name,last_name,salary
,avg(salary) over() as avg_sal,
max(salary) over() as max_sal,
min(salary) over() as min_sal
from employees
) select * from sal;

select d.dept_id,d.dept_name,count(*) as emp_count
from employees e
inner join departments d
on e.dept_id = d.dept_id
group by dept_id,dept_name
order by emp_count desc;

select dept_id,count(*) as emp_count
from employees
group by dept_id;

select distinct dept_id,count(*)
over(partition by dept_id) as emp_cnt
from employees;

select dept_id,sum(salary )
from employees 
group by dept_id;

select d.dept_id,d.dept_name,sum(e.salary)
from employees e 
inner join departments d
on e.dept_id = d.dept_id
group by dept_id,dept_name;

select dept_id,tot_sal
from ( select dept_id,sum(salary) as tot_sal from employees 
group by dept_id)as d;

with sal as 
(select dept_id,
sum(salary) as tot_sal 
from employees 
group by dept_id)
select * from sal;

select dept_id,sum(salary) over(partition by dept_id) as sal
from employees;

select e.first_name,d.dept_name
from employees e 
right join 
departments d 
on e.dept_id = d.dept_id;
 
 select e.first_name,d.dept_name
from employees e 
left join 
departments d 
on e.dept_id = d.dept_id;

select dept_id,avg(salary) as avgg
from employees 
group by dept_id
having avg(salary) > 70000;
 
 select dept_id,avg_salary
 from (select dept_id,avg(salary) as avg_salary
 from employees group by dept_id) as d
 where avg_salary > 70000;
 
 with dpt_avg as
 (select dept_id,avg(salary) as av_sal
 from employees
 group by dept_id) 
 select * from dpt_avg
 where av_sal > 70000;
 
with dpt_avg as 
(select dept_id,avg(salary) over(partition by dept_id) as avgg
from employees)
select distinct dept_id,avgg from dpt_avg
where avgg > 70000;

select d.dept_id,d.dept_name,
avg(e.salary) as avgg from 
departments d 
inner join employees e 
on d.dept_id = e.dept_id
group by d.dept_id,d.dept_name
having avg(e.salary) > 70000;

select e.first_name,d.dept_name
from employees e 
inner join departments d 
on d.dept_id = d.dept_id;

select e.first_name,e.last_name,
(select dept_name from departments d
where d.dept_id = e.dept_id) as dpt
from employees e;
 
with cte as 
(select first_name,last_name,dept_id
from employees)
select e.first_name,e.last_name,d.dept_name
from employees e 
inner join departments d 
on e.dept_id = d.dept_id;

select e.first_name,e.salary,d.dept_name,d.location_id
from employees e
inner join departments d 
on e.dept_id = d.dept_id;

select d.first_name,d.dept_name
from (select e.first_name,d.dept_name
from departments d 
inner join employees e 
on d.dept_id = e.dept_id ) as d;

select e.first_name,e.last_name
,ep.project_id,ep.role_name,p.project_name
from employees e 
inner join employee_projects ep
on e.emp_id = ep.emp_id
inner join projects p
on p.project_id = ep.project_id;

with emp_prj as 
(
select concat(e.first_name," ",e.last_name) as name
,ep.project_id,ep.role_name,p.project_name
from employees e 
inner join employee_projects ep
on e.emp_id = ep.emp_id
inner join projects p
on p.project_id = ep.project_id
) select * from emp_prj;

select p.project_name,count(e.emp_id) as count
from employees e 
inner join employee_projects ep
on e.emp_id = ep.emp_id
inner join projects p
on ep.project_id = p.project_id
group by p.project_id,p.project_name;

select p.project_id,p.project_name,
(select count(ep.emp_id) from employee_projects ep
where ep.project_id = p.project_id  ) as ok
from projects p;

select concat(e.first_name," ",e.last_name) as name,p.project_name,ep.role_name
from employees e 
left join employee_projects ep 
on e.emp_id = ep.emp_id
left join projects p 
on p.project_id = ep.project_id; 

with cte as
(
select concat(e.first_name," ",e.last_name) as name,p.project_name,ep.role_name
from employees e 
left join employee_projects ep 
on e.emp_id = ep.emp_id
left join projects p 
on p.project_id = ep.project_id
) select * from cte;


with cte as 
(
select e.first_name,e.last_name,ep.emp_id as prj
from employees e
left join  employee_projects ep
on ep.emp_id = e.emp_id
) select * from cte
where prj is null;

select e.first_name,d.dept_name
from departments d 
left join employees e 
on e.dept_id = d.dept_id;

select dept_id,dept_name 
from departments 
where dept_id not in
(select dept_id 
from employees 
where dept_id is null);

select d.dept_id,d.dept_name,avg(e.salary) as sal
from departments d inner join
employees e
on d.dept_id = e.dept_id
group by dept_id,d.dept_name
having avg(e.salary) > 60000;

select dept_id,avg(salary)
from employees
group by dept_id
having avg(salary) > 60000;


select dept_id,sal from
(select dept_id,avg(salary) as sal
from employees 
group by dept_id
) as d
having sal > 60000;

with cte as 
(select dept_id,avg(salary) as sal
from employees 
group by dept_id)
select * from cte
where sal > 60000;

with cte as 
(
select dept_id,avg(salary) 
over(partition by dept_id) as sal
from employees
) select * from cte
where sal > 60000;

select d.dept_id,d.dept_name
,count(e.emp_id) as emp_count,
avg(e.salary) as sal
from employees e 
inner join 
departments d 
on e.dept_id = d.dept_id
group by d.dept_id,d.dept_name
having avg(e.salary) > 65000 and
count(e.emp_id) > 5;

select dept_id,count(*) as cnt
,avg(salary) as sal
from employees
group by dept_id
having count(*) > 5 and 
avg(salary) > 65000;


with cte as
(select d.dept_id,d.dept_name
,count(e.emp_id) as emp_count,
avg(e.salary) as sal
from employees e 
inner join 
departments d 
on e.dept_id = d.dept_id
group by d.dept_id,d.dept_name
having avg(e.salary) > 65000 and
count(e.emp_id) > 5)
select * from cte;


select project_id,sum(hours) as hrs
from projects 
group by project_id
order by sum(hours) desc
limit 1;

with cte as 
(
select project_id,sum(hours) as hrs
from projects 
group by project_id
)
select project_id,hrs
from cte 
where hrs = 
(select max(hrs) from cte);

with cte as
(select project_id,sum(hours) 
over(partition by project_id order by sum(hours))
from employees 
limit 1)
select * from cte;

select count(*) as emp_cnt
,dept_id from employees
group by dept_id 
having count(*) > 2
order by count(*) desc;


with cte as
(
select p.project_id,p.project_name,
count(e.emp_id) emp_cnt 
from projects p
left join
employee_projects ep
on p.project_id = ep.project_id
left join employees e
on ep.emp_id = e.emp_id
group by p.project_id,p.project_name
)
select project_id,project_name,emp_cnt from cte 
where emp_cnt > 2;

select projet_id,project_name
from
(select project_id,count(emp_id) as emp_cnt
from employee_projects 
group by project_id) as pj
where emp_cnt > 2;

select project_id,count(emp_id) as emp_cnt
from employee_projects
group by project_id
having count(emp_id) > 2;

select * from employees
where salary >
(select avg(salary) 
from employees );

select concat(e.first_name," ",e.last_name) as name
,e.salary from employees e
cross join (select avg(salary) as sal 
from employees) a
where e.salary > a.sal;

select e.first_name,e.last_name,e.salary
from employees e
where e.salary > 
(select avg(e2.salary) from employees e2);





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