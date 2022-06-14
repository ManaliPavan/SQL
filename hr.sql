--select queries from HR

--OR,AND,IN,NOT IN,BETWEEN,IS,IS NOT,LIKE,DISTINCT,ORDER BY,DESC

SELECT * FROM employees WHERE department_id=3 OR department_id=5;

SELECT * FROM employees WHERE department_id=3 OR salary >10000;

SELECT * FROM employees WHERE department_id IN (1,3,5);

SELECT * FROM employees WHERE department_id  NOT IN (1,3,5);

SELECT * FROM employees WHERE salary>=5000 and salary<=10000;

SELECT * FROM employees WHERE salary BETWEEN 5000 AND 10000;

SELECT * FROM employees WHERE phone_number IS null;

SELECT * FROM employees WHERE phone_number IS NOT null;

--WILD CARD CHARACHTER %, _

SELECT * FROM employees WHERE first_name='john';

SELECT * FROM employees WHERE first_name like 'j%';

SELECT * FROM employees WHERE first_name like '_a__';

SELECT DISTINCT department_id FROM employees;

SELECT department_id FROM employees;

SELECT DISTINCT department_id,salary FROM employees;

SELECT * FROM employees ORDER BY salary;

SELECT * FROM employees ORDER BY salary DESC;

SELECT * FROM employees ORDER BY salary DESC,first_name;

SELECT * FROM employees WHERE department_id=3 ORDER BY salary desc;

SELECT TOP (3) * FROM employees;

SELECT TOP(1) * FROM employees ORDER BY salary DESC;

--Aggregate functions
--max,min,avg,sum,count
--in return it returns back single value

SELECT MAX(salary) AS 'Max Salary' FROM employees;

SELECT MIN(salary) AS 'Min Salary' FROM employees WHERE department_id=3;

SELECT AVG(salary) AS 'Average Salary' FROM employees;

SELECT COUNT(phone_number) AS 'Count(not null)' FROM employees;

SELECT COUNT(*) 'No. of Data Entered' FROM employees;

--Group by clause

SELECT first_name 'Name',last_name 'Surname' 
FROM employees;

SELECT department_id,MAX(salary) as 'Max of department' 
FROM employees GROUP BY department_id;

SELECT department_id,COUNT(department_id) as 'Count of department' 
FROM employees GROUP BY department_id;

--group by having clause

SELECT department_id,COUNT(department_id) as 'Count of department>5'
FROM employees GROUP BY department_id HAVING COUNT(*)>5;

SELECT department_id,COUNT(department_id) as 'Count of department with max(salary)>10000' ,max(salary) 'Max salary'
FROM employees GROUP BY department_id HAVING MAX(salary)>10000;

--subquery

--employees with department-name=sales
SELECT * FROM employees WHERE department_id=(SELECT (department_id) FROM departments WHERE department_name='sales');

--employees with job_title =programmer
SELECT * FROM employees WHERE job_id=(SELECT job_id FROM jobs WHERE job_title='programmer');

--update employees salary with department name=it
UPDATE employees SET salary=salary+5000 WHERE department_id=(SELECT department_id FROM departments WHERE department_name='it');

--extra queries
--booking amount discount 10% for those who booked on trivago
UPDATE Booking_details SET charges=charges-(charges*0.1) WHERE App_id in(SELECT App_id FROM Booking_app WHERE app_name='trivago');

--cancel booking of taj in mumbai
DELETE FROM Booking_details WHERE Hotel_id=(SELECT Hotel_id FROM Hotel WHERE Hotel_name='taj' and city='mumbai');

--joins

--list all employees (first_name,department_name)
SELECT first_name,department_name FROM employees e INNER JOIN departments d ON e.department_id=d.department_id;

--list all employees (first_name,job_title)
SELECT first_name,job_title FROM employees e INNER JOIN jobs j ON e.job_id=j.job_id;

--count employees acc. to department
SELECT department_id,COUNT(*) 'count' FROM employees GROUP BY department_id;

--count of employees count with department name
SELECT d.department_name,COUNT(*) 'count' FROM employees e INNER JOIN departments d ON e.department_id=d.department_id  GROUP BY department_name;

--self join

SELECT e.first_name 'emp name',m.first_name  'manager name' FROM employees e  INNER JOIN employees m ON e.employee_id=m.manager_id;

SELECT e.first_name 'emp name',m.first_name  'manager name' FROM employees e  INNER JOIN employees m ON e.employee_id=m.manager_id WHERE m.first_name='david';


