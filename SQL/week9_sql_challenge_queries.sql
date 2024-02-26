-- Data Analysis:

-- List the employee number, last name, first name, sex, and salary of each employee 
-- 300,024 results were returned from the query

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
employees.sex, 
salaries.salary

FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 
-- 36,150 results were returned from the query

SELECT first_name, 
last_name, 
hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name 
-- 24 results were returned from the query 

SELECT dept_manager.dept_no, 
Departments.dept_name, 
dept_manager.emp_no 

AS manager_emp_no, 
employees.last_name 

AS manager_last_name, 
employees.first_name 

AS manager_first_name

FROM dept_manager
JOIN Departments ON dept_manager.dept_no = Departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
-- 331,603 results were returned from the query 

SELECT dept_employee.emp_no, 
employees.last_name, 
employees.first_name, 
dept_employee.dept_no, 
Departments.dept_name

FROM dept_employee
JOIN Departments ON dept_employee.dept_no = Departments.dept_no
JOIN employees ON dept_employee.emp_no = employees.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
-- 20 results were returned from the query 

SELECT first_name, 
last_name, 
sex

FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name 
-- 52,245 results were returned from the query 

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name

FROM employees, 
dept_employee, 
Departments


WHERE employees.emp_no = dept_employee.emp_no
AND dept_employee.dept_no = Departments.dept_no
AND Departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
-- 137,952 results were returned from the query 

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
Departments.dept_name

FROM employees, 
dept_employee, 
Departments

WHERE employees.emp_no = dept_employee.emp_no
AND dept_employee.dept_no = Departments.dept_no
AND (Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
-- 1,638 results were returned from the query 

SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;

