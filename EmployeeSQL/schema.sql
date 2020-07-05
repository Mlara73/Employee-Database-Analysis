DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

-- Create a table of titles
CREATE TABLE titles(
  ID VARCHAR PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL
  );

-- Create a table of employees
CREATE TABLE employees (
  ID INT PRIMARY KEY NOT NULL,
  title_id VARCHAR NOT NULL,
  FOREIGN KEY (title_id) REFERENCES titles(ID),
  birth_date DATE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
  );

-- Create a table of salaries
CREATE TABLE salaries (
  emp_id INT NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES employees(ID),
  salary INT NOT NULL,
  PRIMARY KEY (emp_id, salary)
);

-- Create a table of departments
CREATE TABLE departments (
  ID VARCHAR PRIMARY KEY NOT NULL,
  dept_name VARCHAR(255) NOT NULL
  );
  
-- Create a dept_emp junction table.
CREATE TABLE dept_emp (
  emp_id INTEGER NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES employees(ID),
  dept_id VARCHAR NOT NULL,
  FOREIGN KEY (dept_id) REFERENCES departments(ID),
  PRIMARY KEY (emp_id, dept_id)
);

-- Create a dept_manager table.
CREATE TABLE dept_manager (
  dept_id VARCHAR NOT NULL,
  FOREIGN KEY (dept_id) REFERENCES departments(ID),
  emp_id INTEGER NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES employees(ID),
  PRIMARY KEY (dept_id, emp_id)
);