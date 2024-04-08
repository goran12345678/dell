--DDL command 'CREATE' and set table name and column definitions (name datatype) in parens
CREATE TABLE Persons(
    name VARCHAR(255),
    email VARCHAR(1024)
)
CREATE TABLE Addresses(
    country CHAR(3),
    street VARCHAR(1024),
    regionCode TINYINT
)


SELECT emp.emp_no, emp.hire_date, emp.first_name, emp.last_name,
        emp.hire_date as empHireDate,
        de.dept_no, de.from_date, de.to_date, t.title,
        t.from_date AS titleFromDate, t.to_Date AS titleToDate
FROM employees emp RIGHT JOIN dept_emp de ON emp.emp_no=de.emp_no
RIGHT JOIN titles t ON t.emp_no=de.emp_no AND t.from_Date=de.from_date

SELECT emp.emp_no, emp.hire_date, emp.first_name, emp.last_name,
        emp.hire_date as empHireDate,
        de.dept_no, de.from_date, de.to_date, t.title,
        t.from_date AS titleFromDate, t.to_Date AS titleToDate
FROM employees emp RIGHT JOIN dept_emp de ON emp.emp_no=de.emp_no
RIGHT JOIN titles t ON t.emp_no=de.emp_no AND t.from_Date=de.from_date
 
 SELECT de.emp_no AS deptEmpNo, de.dept_no, 
 de.from_date AS deptFrom, de.to_date AS deptTo,
 t.title, t.from_date AS titleFrom, t.to_date AS titleTo 
 FROM dept_emp de INNER JOIN titles t ON t.emp_no=de.emp_no
 LEFT JOIN 

  SELECT de.emp_no AS deptEmpNo, de.dept_no, 
 de.from_date AS deptFrom, de.to_date AS deptTo,
 t.title, t.from_date AS titleFrom, t.to_date AS titleTo,
 emp.emp_no, emp.hire_date, emp.first_name, emp.last_name
 FROM dept_emp de INNER JOIN titles t ON t.emp_no=de.emp_no
 LEFT JOIN employees emp ON t.emp_no=emp.emp_no

 SELECT de.emp_no AS deptEmpNo, de.dept_no, 
 de.from_date AS deptFrom, de.to_date AS deptTo,
 t.title, t.from_date AS titleFrom, t.to_date AS titleTo,
 emp.emp_no, emp.hire_date, emp.first_name, emp.last_name,
 IF(mgr.emp_no IS NOT NULL,'Yes','No') AS isManager
 FROM dept_emp de INNER JOIN titles t ON t.emp_no=de.emp_no
 LEFT JOIN dept_manager mgr ON t.emp_no=mgr.emp_no AND t.from_date=mgr.from_date
 LEFT JOIN employees emp ON t.emp_no=emp.emp_no


SELECT ppd.*
FROM (
 SELECT de.emp_no AS deptEmpNo, de.dept_no, 
 de.from_date AS deptFrom, de.to_date AS deptTo,
 t.title, t.from_date AS titleFrom, t.to_date AS titleTo,
 emp.emp_no, emp.hire_date, emp.first_name, emp.last_name,
 IF(mgr.emp_no IS NOT NULL,'Yes','No') AS isManager
 FROM dept_emp de INNER JOIN titles t ON t.emp_no=de.emp_no
 LEFT JOIN dept_manager mgr ON t.emp_no=mgr.emp_no AND t.from_date=mgr.from_date
 LEFT JOIN employees emp ON t.emp_no=emp.emp_no
) AS ppd
ORDER BY ppd.deptEmpNo LIMIT 100

