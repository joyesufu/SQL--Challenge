--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


--List first name, last name, and hire date for employees 
--who were hired in 1986.

SELECT employees.first_name, employees.last_name, 
EXTRACT(YEAR FROM employees.hire_date) AS Year
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986
ORDER BY first_name, last_name;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY last_name, first_name;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;


--List first name, last name, 
--and sex for employees whose first name is "Hercules" 
--and last names begin with "B"

SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;



--List all employees in the Sales department, 
--including their employee number, 
--last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
ORDER BY last_name, first_name;


--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name

SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY last_name, first_name;


--List the frequency count of employee last names 
--(i.e., how many employees share each last name) in descending order

SELECT DISTINCT(last_name), COUNT(last_name) AS "Frequency" FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


--What I was able to analyze from the data:

SELECT EXTRACT(YEAR FROM hire_date), COUNT(EXTRACT(YEAR FROM hire_date)) 
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY EXTRACT(YEAR FROM hire_date);

