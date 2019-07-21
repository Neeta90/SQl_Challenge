  
-- create the deaprtmnets table
Create Table departments 
(dept_no VARCHAR NOT NULL PRIMARY KEY,
dept_name Varchar(255));
--create the employees table
Create Table employees  
(emp_no  int NOT NULL PRIMARY KEY ,
 birth_date date,
first_name varchar(255),
last_name  varchar(255),
gender char,
hire_date date);
--create the dep_emp table
Create  Table dep_emp 
( emp_no  int,
 FOREIGN KEY(emp_no ) REFERENCES  employees(emp_no),
 dept_no VARCHAR,
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
from_date date,
to_date date);
--create the dept_manager table
Create Table  dept_manager 
( dept_no VARCHAR, 
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
 emp_no int,
 FOREIGN KEY (emp_no) REFERENCES  employees(emp_no),
from_date date,
to_date date);

--create the salaries table
Create Table salaries 
(  emp_no  int,
 FOREIGN KEY (emp_no) REFERENCES  employees(emp_no),
 salary int,
from_date date, 
to_date date);
--create the titles table
Create Table titles 
( emp_no  int,
FOREIGN KEY (emp_no) REFERENCES  employees(emp_no),
title varchar(255),
from_date date,
to_date date);