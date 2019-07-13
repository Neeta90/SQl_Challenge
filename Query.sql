-- create Deaprtmnets table
Create Table Departments 
(dept_no int NOT NULL PRIMARY KEY,
dept_name Varchar(255));
--create Dep_emp table
Create  Table Dep_emp 
(emp_no  int NOT NULL PRIMARY KEY,
 dept_no int,
 FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
--dept_no int FOREIGN KEY REFERENCES  Departments(dept_no),
from_date date,
to_date date);
--create Dept_manager table
Create Table  Dept_manager 
(dept_no int NOT NULL PRIMARY KEY,
 emp_no int,
 FOREIGN KEY (emp_no) REFERENCES Departments(dept_no),
from_date date,
to_date date);
--create employees table
Create Table employees  
(emp_no  int NOT NULL PRIMARY KEY ,
 FOREIGN KEY (emp_no) REFERENCES Departments(dept_no),
birth_date date,
first_name varchar(255),
last_name  varchar(255),
gender char,
hire_date date);
--create Salaries table
Create Table Salaries 
(emp_no  int NOT NULL PRIMARY KEY,
 FOREIGN KEY (emp_no) REFERENCES Departments(dept_no),
salary int,
from_date date, 
to_date date);
--create Titles table
Create Table Titles 
(emp_no  int NOT NULL PRIMARY KEY,
FOREIGN KEY (emp_no) REFERENCES Departments(dept_no),
title varchar(255),
from_date date);