-- Write a single SQL query which will satisfy the following conditions
select * from employees;
USE employee_db;
INSERT INTO employees (name, age, department, salary) VALUES
('Alice White', 32, 'HR', 60000.00),
('Bob Brown', 45, 'HR', 70000.00),
('Charlie Black', 29, 'HR', 52000.00),
('Diana Green', 31, 'HR', 62000.00);

select department,sum(salary) as total_salary from employees where salary >40000 group by department having count(name) > 3 and total_salary > 20000 order by total_salary desc;