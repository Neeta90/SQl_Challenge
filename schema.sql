-- Drop table if exists
/*DROP TABLE departments;
DROP TABLE dep_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;*/

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
( --dep_emp_id serial  PRIMARY KEY,
 emp_no  int,
 FOREIGN KEY(emp_no ) REFERENCES  employees(emp_no),
 dept_no VARCHAR,
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
--dept_no int FOREIGN KEY REFERENCES  Departments(dept_no),
from_date date,
to_date date);
--create the dept_manager table
Create Table  dept_manager 
(--dept_manager_id serial NOT NULL PRIMARY KEY,
 dept_no VARCHAR, 
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
 emp_no int,
 FOREIGN KEY (emp_no) REFERENCES  employees(emp_no),
from_date date,
to_date date);

--create the salaries table
Create Table salaries 
( --salary_id serial NOT NULL PRIMARY KEY,
 emp_no  int,
 FOREIGN KEY (emp_no) REFERENCES  employees(emp_no),
 salary int,
from_date date, 
to_date date);
--create the titles table
Create Table titles 
( --title_id serial NOT NULL PRIMARY KEY,
emp_no  int,
FOREIGN KEY (emp_no) REFERENCES  employees(emp_no),
title varchar(255),
from_date date,
to_date date);
--select * from titles;
-- dataanalysis 1
select e.emp_no,e.first_name,e.last_name,e.gender,s.salary from employees AS e JOIN salaries AS s on e.emp_no = s.emp_no;
---da2
SELECT  first_name, last_name,hire_date FROM employees where hire_date>= '1986-01-01'and hire_date <'1987-01-01';
--SELECT dept_name FROM departments where dept_no IN (SELECT * FROM dept_manager );
--SELECT * FROM dept_manager JOIN departments ON dept_manager.dept_no = departments.dept_no WHERE emp_no.dept_manager = emp_no.employees ;
--SELECT e.first_name,e.last_name  FROM employees AS e JOIN (SELECT * FROM dept_manager JOIN departments ON dept_manager.dept_no = departments.dept_no) ;


--DA3
SELECT dm.dept_no,dm.emp_no,de.from_date,de.to_date,d.dept_name, e.first_name,e.last_name 
 FROM dept_manager AS dm JOIN departments AS d
 ON dm.dept_no = d.dept_no
 JOIN employees AS e
 ON dm.emp_no = e.emp_no
 JOIN dep_emp AS de
 ON dm.emp_no = de.emp_no;
 ----------DA4------------
 
 SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
 FROM employees AS e JOIN dep_emp AS de
 ON e.emp_no = de.emp_no
 JOIN departments AS d 
 ON de.dept_no = d.dept_no
 -----------DA5:List all employees whose first name is "Hercules" and last names begin with "B."----------------
 SELECT first_name,last_name FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
 --DA6 :List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name  	
 FROM employees AS e
 JOIN dep_emp AS de
 ON e.emp_no = de.emp_no
 JOIN departments AS d 
 ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
---DA7:List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
 SELECT e.emp_no,e.last_name,e.first_name,d.dept_name  	
 FROM employees AS e
 JOIN dep_emp AS de
 ON e.emp_no = de.emp_no
 JOIN departments AS d 
 ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development' ;
--DA8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name ,COUNT(last_name) FROM employees GROUP BY last_name
ORDER BY last_name DESC;
