-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.id as "employee number",e.last_name as "last name", e.first_name as "first name", e.sex, s.salary
FROM employees e
JOIN salaries s ON
e.id = s.emp_id;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "first name", last_name as "last name", hire_date as "hire date"
FROM employees
WHERE hire_date >= to_date('1986','yyyy') AND hire_date < to_date('1987','yyyy');
-- optional
--WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.id as "department id", d.dept_name as "department name", e.id as "managers employee number", e.last_name as "last name", e.first_name as "first name"
FROM departments d
JOIN dept_manager ON
dept_manager.dept_id = d.id
JOIN employees e ON
dept_manager.emp_id = e.id;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.id as "employee number", e.last_name as "last name", e.first_name as "first_name", d.dept_name as "department name"
FROM departments d
JOIN dept_emp ON
d.id = dept_emp.dept_id
JOIN employees e ON
dept_emp.emp_id = e.id;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name as "first name", last_name as "last name", sex
FROM employees
WHERE first_name ILIKE 'Hercules%' AND
last_name ILIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.id as "employee number", e.first_name as "first name", e.last_name as "last name", d.dept_name as "department name"
FROM departments d
JOIN dept_emp ON
d.id = dept_emp.dept_id
JOIN employees e ON
dept_emp.emp_id = e.id
WHERE d.dept_name ILIKE 'sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.id as "employee number", e.first_name as "first name", e.last_name as "last name", d.dept_name as "department name"
FROM departments d
JOIN dept_emp ON
d.id = dept_emp.dept_id
JOIN employees e ON
dept_emp.emp_id = e.id
WHERE d.dept_name ILIKE 'sales'
OR d.dept_name ILIKE 'development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name as "last name", COUNT(last_name) as "frecuency count of employee LN"
FROM employees
GROUP BY last_name
ORDER BY "last name" DESC

-- BONUS
-- Query to  find average salary by title
SELECT titl.title, round(AVG(s.salary),2) as "Salary Average"
FROM salaries s
JOIN employees e ON
s.emp_id = e.id
JOIN titles titl ON
titl.id = e.title_id
GROUP BY titl.title
ORDER BY "Salary Average"

