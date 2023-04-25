--1.Retrieve the emp_no, first_name, and last_name columns from the Employees table

SELECT e.emp_no, e.first_name, e.last_name,
ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ti
ON e.emp_no=ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no

--2. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;

--3.
SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC

--Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
ti.title, de.from_date, de.to_date
INTO mentorship_eligibilty
FROM employees as e
JOIN titles as ti
ON e.emp_no=ti.emp_no
JOIN dept_emp as de
ON e.emp_no=de.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date='9999-01-01'
ORDER BY e.emp_no