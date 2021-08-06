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