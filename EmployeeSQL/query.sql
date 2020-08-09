-- Employee details: Employee number, last name, first name, sex, salary
SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s 
	ON (e.emp_id=s.emp_id)
ORDER BY e.emp_id;

-- Hired in 1986; Employee first name, last name, hire date
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986
ORDER BY last_name;

--Manager of each dept; Dept no, dept name, manager emp id, manager last name, manager first name
SELECT dept_manager.dept_id AS "Dept ID", 
       d.dept_name AS "Department", 
	   dept_manager.emp_id AS "Manager ID", 
	   e.last_name AS "Manager Last Name", 
	   e.first_name AS "Manager First Name"
FROM departments AS d
INNER JOIN dept_manager
	ON (dept_manager.dept_id = d.dept_id)
INNER JOIN employees AS e
	ON (dept_manager.emp_id = e.emp_id)
ORDER BY d.dept_id;

--Employee Departments; Emp no, last name, first name, department name
SELECT dept_employees.emp_id, e.last_name, e.first_name, d.dept_name
FROM departments AS d
INNER JOIN dept_employees
	ON (dept_employees.dept_id = d.dept_id)
INNER JOIN employees AS e
	ON (dept_employees.emp_id = e.emp_id)
ORDER BY e.emp_id;

-- Employees with first name Hercules and last name beginning with B; first name, last name, sex
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Employees in Sales Dept; emp no, last name, first name, dept name
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM departments AS d
INNER JOIN dept_employees
	ON (dept_employees.dept_id = d.dept_id)
INNER JOIN employees AS e
	ON (dept_employees.emp_id = e.emp_id)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_id;

-- Employees in Sales & Development Depts; emp no, last name, first name, dept name
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM departments AS d
INNER JOIN dept_employees
	ON (dept_employees.dept_id = d.dept_id)
INNER JOIN employees AS e
	ON (dept_employees.emp_id = e.emp_id)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_id;

--Frequency count of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;