



CREATE TABLE TITLES (
EMP_NO INT NOT NULL,
TITLE VARCHAR(50) NOT NULL,
FROM_DATE DATE NOT NULL,
TO_DATE DATE NOT NULL
);

SELECT *
FROM TITLES;

SELECT E.EMP_NO,
E.FIRST_NAME,
E.LAST_NAME,
TI.TITLE,
TI.FROM_DATE,
TI.TO_DATE
INTO RETIRMENT_TITLES
FROM EMPLOYEES AS E
INNER JOIN TITLES AS TI
ON E.EMP_NO = TI.EMP_NO
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY EMP_NO;

SELECT *
FROM RETIRMENT_TITLES;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirment_titles as rs
WHERE rs.to_date = '9999-01-01'
ORDER BY emp_no, emp_no DESC;

select *
from unique_titles;

-- unique title table 
SELECT COUNT(title) COUNT,
TITLE
INTO retiring_titles
FROM unique_titles as u
GROUP BY TITLE
ORDER BY COUNT DESC;

select *
FROM RETIRING_titles;

-- mentorship

select DISTINCT ON (e.emp_no) 
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligilty
FROM employees AS E
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN TITLES AS TI
on ti.emp_no = de.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01');

select *
from mentorship_eligilty;

select *
from dept_emp;
