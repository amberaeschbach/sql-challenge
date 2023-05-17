-- list the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   employees.sex,
	   salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

-- list the first name, last name, and hire date for the employees hired in 1986

SELECT * FROM employees
WHERE DATE_PART('year',hire_date)= 1986
ORDER BY emp_no;

-- list the manager of each department along with their department number, department name, employee number, last name, first name

SELECT dept_managers.dept_no,
       departments.dept_name,
       dept_managers.emp_no,
       employees.last_name,
       employees.first_name
FROM dept_managers
LEFT JOIN departments ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees ON dept_managers.emp_no = employees.emp_no
ORDER BY emp_no;

-- list the department number for each employee along with that employee's employee number, last name, first name, department name

SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   dept_emp.dept_no,
	   departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by emp_no;

-- list first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with B

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- list each employee in the sales departments, and their employee number, last, and first name

SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

-- list each employee in the sales and development department, and their employee number, last and first name, and department name

SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')

--list the frequency counts in descending order, of all the employee last names

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;