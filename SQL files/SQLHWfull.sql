DROP TABLE titles;
CREATE TABLE titles (
	title_id VARCHAR(255) PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

SELECT * FROM titles;
--
DROP TABLE employees;
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date VARCHAR(255) NOT NULL
);

SELECT * FROM employees LIMIT 7;
--
DROP TABLE salaries;
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);

SELECT * FROM salaries LIMIT 7;
--
DROP TABLE departments;
CREATE TABLE departments (
	dept_no VARCHAR(255) PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);

SELECT * FROM departments;
--
DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp LIMIT 7;
--
DROP TABLE dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM employees AS E
JOIN salaries AS S
	ON E.emp_no = S.emp_no;
	

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date 
LIKE '%1986';


--3. List the manager of each department with the following information: *department number,
--*department name, *the manager's employee number, last name, first name.
SELECT D.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM departments AS D
JOIN dept_manager AS DM
	ON D.dept_no = DM.dept_no
JOIN employees AS E
	ON DM.emp_no = E.emp_no;
	

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT E.emp_no AS "Employee Number", E.last_name AS "Last Name", E.first_name AS "First Name", D.dept_name AS "Department Name"
FROM employees AS E
JOIN dept_emp AS DE
	ON E.emp_no = DE.emp_no
JOIN departments AS D
	ON DE.dept_no = D.dept_no;


--5. List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees 
WHERE first_name = 'Hercules' and last_name LIKE 'B%';


--6. List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees AS E
JOIN dept_emp AS DE
	ON E.emp_no = DE.emp_no
JOIN departments AS D
	ON DE.dept_no = D.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees AS E
JOIN dept_emp AS DE
	ON E.emp_no = DE.emp_no
JOIN departments AS D
	ON DE.dept_no = D.dept_no
WHERE (dept_name = 'Sales' OR dept_name = 'Development');

--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name;

--Epilogue (Very Funny)
SELECT *
FROM employees
WHERE emp_no = 499942;

