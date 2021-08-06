-- Creating tables for PH-EmployeeDB

-- Departments table
create table departments(
	dept_no VARCHAR(4) not NULL,
	dept_name VARCHAR(40) not null,
	primary key(dept_no),
	unique (dept_name)
);

-- Employees table
create table employees(
	emp_no int not null,
	birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

-- Department managers table
create table dept_manager(
	dept_no VARCHAR(4) not NULL,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
	
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments(dept_no),
	
	primary key (emp_no,dept_no)
);

-- Create salaries table
CREATE TABLE salaries (
 	emp_no INT NOT NULL,
 	salary INT NOT NULL,
 	from_date DATE NOT NULL,
 	to_date DATE NOT NULL,
 	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 	PRIMARY KEY (emp_no)
);

-- Create titles table
create table titles(
	emp_no int not null,
	title varchar(40) not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no)
);

-- Create department employees table
create table dept_emp(
	emp_no int not null,
	dept_no varchar(4) not null,
	from_date date not null,
	to_date date not null,
	
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no,dept_no)
);