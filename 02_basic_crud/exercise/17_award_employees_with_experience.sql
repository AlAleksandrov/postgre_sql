UPDATE
	employees
SET
	salary = salary + 1500,
	job_title = 'Senior ' || job_title
WHERE 
	hire_date BETWEEN '1998_01-01' AND '2000_01-05'
;