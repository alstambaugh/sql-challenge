CREATE TABLE departments (
    dept_id VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL	
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_title VARCHAR NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
    birthdate DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE dept_employees (
    emp_id INT NOT NULL,
	FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
    dept_id VARCHAR NOT NULL,
	FOREIGN KEY(dept_id) REFERENCES departments(dept_id),
	PRIMARY KEY (emp_id, dept_id)
);

CREATE TABLE dept_manager (
    dept_id VARCHAR NOT NULL,
	FOREIGN KEY(dept_id) REFERENCES departments(dept_id),
    emp_id INT NOT NULL,
	FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
	PRIMARY KEY (emp_id,dept_id)
);

CREATE TABLE salaries (
    emp_id INT PRIMARY KEY,
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    salary INT NOT NULL
);


