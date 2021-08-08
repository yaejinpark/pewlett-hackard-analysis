-- Choose employees ready for retirement: born between 1952 and 1955

select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

-- Create another query that will search for only 1952 birth dates.

select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';

-- Create three more queries to search for employees who were born in 1953, 1954, and 1955.

-- 1953
select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';

-- 1954
select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';

-- 1955
select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';

-- Retirement eligibility who were also hired between 1985 and 1988
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
and (hire_date between '1985-01-01' and '1988-12-31');

-- Number of employees retiring
SELECT count(*)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
and (hire_date between '1985-01-01' and '1988-12-31');

-- save the data into a table named "retirement_info."
select first_name, last_name
into retirement_info
from employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
and (hire_date between '1985-01-01' and '1988-12-31');

-- Joining retirement_info and dept_emp tables
select ri.emp_no,ri.first_name, ri.last_name,dept_emp.to_date
from retirement_info as ri
left join dept_emp
on ri.emp_no = dept_emp.emp_no;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Saving retiring employee info
select ri.emp_no,ri.first_name, ri.last_name,de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

-- join the current_emp and dept_emp tables
select count(ce.emp_no), de.dept_no
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

-- Update the code block to create a new table, then export it as a CSV.
select count(ce.emp_no), de.dept_no
into current_emp_count
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

-- emp_info
SELECT e.emp_no,e.first_name,e.last_name,e.gender,s.salary,de.to_date
into emp_info
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
inner join dept_emp as de
on e.emp_no = de.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

-- manager_info
select dm.dept_no,d.dept_name,ce.first_name,ce.last_name,dm.from_date,dm.to_date
into manager_info
from dept_manager as dm
inner join departments as d
on dm.dept_no = d.dept_no
inner join current_emp as ce
on dm.emp_no = ce.emp_no;

-- dept_info
SELECT ce.emp_no,ce.first_name,ce.last_name,d.dept_name
into dept_info
from departments as d
inner join dept_emp as de
on d.dept_no = de.dept_no
inner join current_emp as ce
on ce.emp_no = de.emp_no;
