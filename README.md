# sql-challenge

Was tasked with finding the following information using Panas and SQL:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

I Imported the SQL database direclty into Pandas.

I also made an ERD showing the relationship between the tables. You can find this in the images folder. I had the 'Employees' table as the main reference piece for the diagram. The 'titles' and 'salaries' tables only need the employee number off of the main table. The 'Departments' table, along with the main table,was referenced by the 'dept_emp' and 'dept_manager' tables. I find ERD's tough but did find it helpful!!

I have 3 SQL files for the pgadmin in a folder. One is the schemata, one is the queires and one is everything combined.

in the jupyter notebook you will find the bonus work with the histogram and the bar chart.

the csv files are just the files from the hw folder copied so I could use from that local destination.
