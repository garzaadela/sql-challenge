-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM public."Employees" e
INNER JOIN "Salaries" s ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.emp_no, e.last_name, e.first_name, e.sex
FROM public."Employees" e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'  

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, ms.emp_no, e.last_name, e.first_name
FROM public."Departments" d
INNER JOIN "Managers" ms ON d.dept_no = ms.dept_no
INNER JOIN "Employees" e ON ms.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Departments" d
INNER JOIN "Dept_Emp" de ON d.dept_no = de.dept_no
INNER JOIN "Employees" e ON de.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM public."Employees" e
WHERE e.first_name = 'Hercules' AND e.last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Dept_Emp" de
INNER JOIN "Departments" d ON de.dept_no = d.dept_no
INNER JOIN "Employees" e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Dept_Emp" de
INNER JOIN "Departments" d on de.dept_no = d.dept_no
INNER JOIN "Employees" e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(*) AS last_name_count
FROM public."Employees" e
GROUP BY e.last_name
ORDER BY COUNT(*) DESC