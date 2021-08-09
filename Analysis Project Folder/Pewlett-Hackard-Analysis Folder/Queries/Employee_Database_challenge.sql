-- Deliverable 1

-- Create a Retirement Titles table that holds all the titles of current employees 
-- who were born between January 1, 1952 and December 31, 1955

-- # 1-7
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- Retrieve the title, from_date, and to_date columns from the Titles table.
-- Create a new table using the INTO clause.
-- Join both tables on the primary key.
-- Filter the data on the birth_date column to retrieve the employees who were born between 
-- 1952 and 1955. Then, order by the employee number.
-- Export the Retirement Titles table from the previous step as 
-- retirement_titles.csv and save it to your Data folder

select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
into retirement_titles
from employees as e
inner join titles as ti
on e.emp_no = ti.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31'
order by emp_no asc;

-- # 8-14
-- Filter repeating names for latest positions
SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no asc, to_date DESC;

-- # 15-21
-- retrieve the number of employees by their most recent job title who are about to retire.
select count(title),title
into retiring_titles
from unique_titles 
group by title 
order by 1 desc;

-- -------------------------------------------------------------------------------------------

-- Deliverable 2
-- create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
select distinct on (e.emp_no) e.emp_no,e.first_name,e.last_name,de.from_date,de.to_date,ti.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join titles as ti
on de.emp_no = ti.emp_no
where (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31');