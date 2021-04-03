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
ORDER BY last_name DESC;

--Epilogue (Very Funny)
SELECT *
FROM employees
WHERE emp_no = 499942;

