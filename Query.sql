
-- DA1--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.first_name,e.last_name,e.gender,s.salary 
FROM employees AS e JOIN salaries AS s ON e.emp_no = s.emp_no;

---DA2--List employees who were hired in 1986.
SELECT  first_name, last_name,hire_date 
FROM employees WHERE hire_date>= '1986-01-01'AND hire_date <'1987-01-01';

--DA3--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no,dm.emp_no,de.from_date,de.to_date,d.dept_name, e.first_name,e.last_name 
 FROM dept_manager AS dm JOIN departments AS d
 ON dm.dept_no = d.dept_no
 JOIN employees AS e
 ON dm.emp_no = e.emp_no
 JOIN dep_emp AS de
 ON dm.emp_no = de.emp_no;
 
 --DA4--List the department of each employee with the following information:
 --employee number, last name, first name, and department name.
 
 SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
 FROM employees AS e JOIN dep_emp AS de
 ON e.emp_no = de.emp_no
 JOIN departments AS d 
 ON de.dept_no = d.dept_no;
 
--DA5:List all employees whose first name is "Hercules" and last names begin with "B".

 SELECT first_name,last_name FROM employees
   WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
 
 --DA6 :List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name  
    FROM employees AS e, dep_emp AS de,
         (SELECT dept_no,dept_name
          FROM departments
          WHERE dept_name LIKE 'Sales') AS d
    WHERE de.dept_no = d.dept_no
    AND de.emp_no = e.emp_no;

---DA7:List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
 SELECT e.emp_no,e.last_name,e.first_name,d.dept_name  
    FROM employees AS e, dep_emp AS de,
         (SELECT dept_no,dept_name
          FROM departments
          WHERE dept_name ='Sales' OR dept_name = 'Development') AS d
    WHERE de.dept_no = d.dept_no
    AND de.emp_no = e.emp_no;

 
--DA8:In descending order, list the frequency count of employee last names,i.e., how many employees share each last name.

SELECT last_name ,COUNT(last_name) FROM employees GROUP BY last_name
ORDER BY last_name DESC;
