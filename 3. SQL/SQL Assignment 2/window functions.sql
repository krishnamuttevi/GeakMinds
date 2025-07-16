create database if not exists wf;
use wf;

CREATE TABLE if not exists employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
INSERT INTO employees (emp_name, department, salary, hire_date) VALUES
('Alice', 'HR', 60000, '2018-06-12'),
('Bob', 'Finance', 75000, '2017-03-05'),
('Charlie', 'IT', 80000, '2019-07-10'),
('David', 'Finance', 72000, '2020-09-22'),
('Eve', 'HR', 65000, '2016-01-15'),
('Frank', 'IT', 90000, '2015-12-10'),
('Grace', 'Finance', 78000, '2018-11-30'),
('Hank', 'IT', 85000, '2021-05-14'),
('Ivy', 'HR', 62000, '2019-09-07'),
('Jack', 'IT', 95000, '2014-08-23');

-- Rank Employees by Salary
select e.*, rank() over(order by salary desc) from employees e; 

-- Dense Rank Employees by Salary
select e.*,dense_rank() over(order by salary desc) from employees e; 

-- Row Number of Employees Based on Hire Date
select e.*,row_number() over(order by hire_date) 
as `row_number`
from employees e;

-- Cumulative Sum of Salaries
select e.*,sum(salary) over() AS cumulative_salary
from employees e;

-- Average Salary per Department
select e.*,avg(salary) over(partition by department)
as avg_salary from employees e;

-- Highest Salary per Department
select e.*,max(salary) over(partition by department)
as max_salary from employees e;

-- Lowest Salary per Department
select e.*,min(salary) over(partition by department)
as min_salary from employees e;

-- Running Total of Salaries by Department
select e.*,sum(salary) 
over(partition by department order by salary) as run_total
from employees e;

-- Employee’s Previous Salary (Lag Function)
select e.*,lag(salary,1,'no prev value') 
over(partition by department order by salary) as prev_salary
from employees e;

-- Employee’s Next Salary (Lead Function)
select e.*,lead(salary,1,'no next value') 
over(partition by department order by salary)as nxt_salary
from employees e;

-- Difference Between Current and Previous Salary
select e.*,salary - lag(salary,1,0) 
over() as `diff`
from employees e;

-- First Salary in Each Department
select e.*,first_value(salary) 
over(partition by department) as 'first salary'
from employees e;

-- Last Salary in Each Department
SELECT 
  department,
  emp_id,
  salary,
  LAST_VALUE(salary) OVER (PARTITION BY department
    ORDER BY emp_id 
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_salary_in_dept
FROM employees;

-- Employees Hired Before Each One (Count of Previous Hires)
select e.hire_date,count(emp_id) over(order by hire_date 
ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
) as hire_count from employees e;

-- Median Salary in Each Department
SELECT 
  department,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary
FROM employees
GROUP BY department;

-- Quartiles of Salaries (NTILE Function)
SELECT emp_id,department,salary,
NTILE(4) OVER (PARTITION BY department ORDER BY salary)
AS salary_quartile
FROM employees;

-- Employees with Top 3 Salaries in Each Department
SELECT * FROM (
 SELECT emp_id,department,salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
  FROM employees
) ranked
WHERE salary_rank <= 3;

-- Yearly Salary Growth of Employees
SELECT emp_id, year(hire_date), salary,
  salary - LAG(salary) OVER (ORDER BY hire_date) AS salary_growth
FROM employees;


-- Percentage of Salary Contribution per Department
SELECT emp_id,department,salary,
  ROUND(100 * salary / SUM(salary) OVER (PARTITION BY department), 2) AS salary_pct_in_dept
FROM employees;

-- Employees with Higher Salary than Department Average
SELECT * FROM (
  SELECT emp_id,department,salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg
  FROM employees
) sub
WHERE salary > dept_avg;