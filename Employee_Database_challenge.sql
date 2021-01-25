-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retire_emp
FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '01-01-1952' AND '12-31-1955'
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name,
last_name,
title
INTO retire_titles
FROM retire_emp
ORDER BY emp_no ASC, to_date DESC;

SELECT COUNT(title), title 
INTO retiring_titles
FROM retire_titles
GROUP BY title;

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date,
	t.title
INTO mentor_table
FROM employees e
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN titles t on e.emp_no = t.emp_no 
WHERE e.birth_date BETWEEN '01-01-1965' AND '12-31-1965'
ORDER BY e.emp_no;



