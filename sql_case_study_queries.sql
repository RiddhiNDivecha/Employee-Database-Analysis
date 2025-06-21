SELECT * from [LOCATION]
SELECT * from DEPARTMENT
SELECT * from JOB
SELECT * from EMPLOYEE

-- Simple Queries:
-- 1. List all the employee details.

SELECT * from EMPLOYEE


-- 2. List all the department details.

SELECT * from DEPARTMENT


-- 3. List all job details.

SELECT * from JOB


-- 4. List all the locations.

SELECT * from [LOCATION]


-- 5. List out the First Name, Last Name, Salary, Commission for all Employees.

select First_Name, Last_Name,Salary,Comm from Employee 


-- 6. List out the Employee ID, Last Name, Department ID for all employees and alias
--    Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id".

SELECT Employee_Id as [ID of the Employee] , Last_Name as [Name of the Employee] , Department_ID as Dep_id from Employee 


-- 7. List out the annual salary of the employees with their names only.

SELECT First_Name + ' ' + Last_Name as [Employee Name] , Salary * 12 as [Annual Salary] FROM Employee 



--                WHERE Condition:

-- 1. List the details about "Smith".

Select * from Employee where Last_Name = 'Smith'


-- 2. List out the employees who are working in department 20.

SELECT * from Employee where DEPARTMENT_ID = 20


-- 3. List out the employees who are earning salaries between 3000 and 4500.

Select * from Employee where salary BETWEEN 3000 AND 4500


-- 4. List out the employees who are working in department 10 or 20.

select * from Employee where DEPARTMENT_ID in (10,20)


-- 5. Find out the employees who are not working in department 10 or 30.

select * from Employee where DEPARTMENT_ID not in (10,30)


-- 6. List out the employees whose name starts with 'S'.

Select * from Employee where Last_Name like 'S%'


-- 7. List out the employees whose name starts with 'S' and ends with 'H'. 

Select * from Employee where Last_Name like 'S%H'


-- 8. List out the employees whose name length is 4 and start with 'S'.

Select * from Employee where First_Name like 'S%' AND Len(First_Name) = 4

-- 9. List out employees who are working in department 10 and draw salaries more than 3500.

select * from Employee where Department_ID = 10 and Salary > 3500

--10. List out the employees who are not receiving commission.

select * from Employee where comm is null



--------------------------       ORDER BY Clause:           

-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.

Select Employee_Id, Last_Name from Employee order by Employee_ID ASC


-- 2. List out the Employee ID and Name in descending order based on salary.

Select Employee_Id, First_Name + ' ' + Last_Name as Name from Employee order by Salary DESC


-- 3. List out the employee details according to their Last Name in ascending-order.

Select * from Employee Order BY Last_Name ASC


-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

Select * from Employee Order BY Last_Name ASC, Department_ID DESC


--------------------------         GROUP BY and HAVING Clause:

-- 1. How many employees are in different departments in the organization?

SELECT Department_ID, Count(*) as Employee_Count_Frm_Diff_Dept from Employee group by Department_ID

-- 2. List out the department wise maximum salary, minimum salary and average salary of the employees.

Select Department_ID, Max(Salary) as [Maximum Salary],Min(Salary) as [Minimum Salary], Avg(Salary) as [Avg Salary] from Employee
group by Department_ID 


-- 3. List out the job wise maximum salary, minimum salary and average salary of the employees.

Select JOB_ID, Max(Salary) as [Maximum Salary],Min(Salary) as [Minimum Salary], Avg(Salary) as [Avg Salary] from Employee
group by JOB_ID 


-- 4. List out the number of employees who joined each month in ascending order.

SELECT Month(Hire_Date) as Hire_Month, Count(*) from Employee group by Month(Hire_Date) 
order by Hire_Month ASC


-- 5. List out the number of employees for each month and year in ascending order based on the year and month.

SELECT Year(Hire_Date) as Hire_Year, Month(Hire_Date) as Hire_Month, Count(*) from Employee 
group by Year(Hire_Date), Month(Hire_Date) 
order by Hire_Year Asc,Hire_Month ASC


-- 6. List out the Department ID having at least four employees.

Select Department_ID, count(*) as [No of Emp] from Employee group by Department_ID
having count(*) >= 4 


-- 7. How many employees joined in the month of January?

Select Month(Hire_Date) as [Emp joined in January],count(*) as [No of Emp] from employee group by Month(Hire_Date)
having Month(Hire_Date) = 1


-- 8. How many employees joined in the month of January or September?

Select Month(Hire_Date) as [Emp joined in Month],count(*) as [No of Emp] from employee group by Month(Hire_Date)
having Month(Hire_Date) in (1,9)


-- 9. How many employees joined in 1985?

Select Year(Hire_Date) as [Emp joined in 1985], count(*) as [No of Emp] from employee group by Year(Hire_Date)
having Year(Hire_Date) = 1985


-- 10. How many employees joined each month in 1985?

Select Year(Hire_Date) as [Emp joined in 1985], Month(Hire_Date) as [Month], count(*) as [No of Emp] from employee 
group by Year(Hire_Date), Month(Hire_Date)
having Year(Hire_Date) = 1985 and Month(Hire_Date) BETWEEN 1 and 12

-- 11. How many employees joined in March 1985?

Select Year(Hire_Date) as [Emp joined in 1985], Month(Hire_Date) as [Emp joined in March],count(*) as [No of Emp] from employee 
group by Year(Hire_Date),Month(Hire_Date)
having Year(Hire_Date) = 1985 and Month(Hire_Date) = 3


-- 12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

Select Department_ID, Count(*) as [No of Emp] from Employee  
where Year(Hire_Date) = 1985 and MONTH(Hire_Date) = 4
Group by Department_ID
Having Count(*) >= 3

----------------------          Joins:

-- 1. List out employees with their department names.

Select E. Employee_ID,E.First_Name, E.Last_Name, D.Name as Dept_Name from Employee E 
inner JOIN Department D on E.Department_ID = D.Department_Id


-- 2. Display employees with their designations.

Select E. Employee_ID, E.First_Name, E.Last_Name, J.Designation from Employee E 
inner JOIN Job J on E.Job_ID = J.Job_ID


-- 3. Display the employees with their department names and regional groups.

Select E. Employee_ID,E.First_Name, E.Last_Name, D.Name as Dept_Names, L.City as Regional_Groups from Employee E 
inner JOIN Department D on E.Department_ID = D.Department_Id
inner JOIN [location] L on D.location_Id = L.location_Id

-- 4. How many employees are working in different departments? Display with department names.

Select count(E.Department_Id) as Emp_Count,E. Department_ID, D.Name from Employee E 
INNER JOIN Department D on E.Department_ID = D.Department_Id
Group by E.Department_id, D.Name

-- 5. How many employees are working in the sales department?

Select count(E.Department_Id) as Emp_Count,E. Department_ID, D.Name from Employee E 
INNER JOIN Department D on E.Department_ID = D.Department_Id
Group by E.Department_id, D.Name    
HAVING D.Name = 'Sales'

-- 6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.

Select count(E.Department_Id) as Emp_Count,E. Department_ID, D.Name from Employee E 
INNER JOIN Department D on E.Department_ID = D.Department_Id
Group by E.Department_id, D.Name    
HAVING count(E.Department_Id) >= 5
ORDER by D.name ASC


-- 7. How many jobs are there in the organization? Display with designations.

select count(E.Job_ID) As [No of Jobs], E.Job_Id, J.Designation from Employee E
inner join JOB J on E.Job_Id = J.Job_Id
GROUP BY E.Job_Id, J.Designation


-- 8. How many employees are working in "New York"?

Select Count(E.Employee_ID) As No_of_Emp, E.Department_ID, L.Location_Id, L.City from Employee E 
inner join Department D on E.Department_Id = D.Department_Id
inner join [Location] L on D.Location_Id = L.Location_Id
group by E.Department_ID, L.Location_Id, L.City
HAVING L.City = 'New York'

-- 9. Display the employee details with salary grades. Use conditional statement to create a grade column.

select Employee_Id, First_Name,Last_Name, Salary,
CASE 
When salary >= 2500 then 'A'
When salary >= 2000 then 'B'
When salary >= 1500 then 'C'
When salary >= 1000 then 'D'
else 'E'
End as Salary_Grade
From Employee

-- 10. List out the number of employees grade wise. Use conditional statement to create a grade column.

SELECT 
CASE 
When salary >= 2500 then 'A'
When salary >= 2000 then 'B'
When salary >= 1500 then 'C'
When salary >= 1000 then 'D'
else 'E'
END AS Salary_Grade,
    
COUNT(*) AS No_of_Employees
FROM 
Employee
GROUP BY 
CASE 
When salary >= 2500 then 'A'
When salary >= 2000 then 'B'
When salary >= 1500 then 'C'
When salary >= 1000 then 'D'
else 'E'
END


-- 11. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

SELECT 
CASE 
When salary >= 5000 then 'A'
When salary >= 4500 then 'B'
When salary >= 4000 then 'C'
When salary >= 3500 then 'D'
When salary >= 3000 then 'E'
When salary >= 2500 then 'F'
When salary >= 2000 then 'G'
ELSE 'J'
END AS Salary_Grade,
    
COUNT(*) AS No_of_Employees

FROM 
Employee
WHERE 
Salary BETWEEN 2000 AND 5000
GROUP BY 
CASE 
When salary >= 5000 then 'A'
When salary >= 4500 then 'B'
When salary >= 4000 then 'C'
When salary >= 3500 then 'D'
When salary >= 3000 then 'E'
When salary >= 2500 then 'F'
When salary >= 2000 then 'G'
ELSE 'J'
END

-- 12. Display all employees in sales or operation departments.

SELECT 
E.Employee_ID,
E.First_Name,
E.Last_Name,
D.Name AS Department_Name
FROM 
Employee E
INNER JOIN 
Department D ON E.Department_ID = D.Department_ID
WHERE 
D.Name IN ('Sales', 'Operations')


--------------    SET Operators:

-- 1. List out the distinct jobs in sales and accounting departments.

SELECT DISTINCT E.Job_ID
FROM 
Employee E
INNER JOIN 
Department D ON E.Department_ID = D.Department_ID
WHERE 
D.Name IN ('Sales','Accounting')


-- 2. List out all the jobs in sales and accounting departments.

SELECT 
E.Employee_ID,
E.First_Name,
E.Last_Name,
E.Job_ID,
D.Name AS Department_Name
FROM 
Employee E
INNER JOIN 
Department D ON E.Department_ID = D.Department_ID
WHERE 
D.Name IN ('Sales', 'Accounting')


-- 3. List out the common jobs in research and accounting departments in ascending order.

SELECT DISTINCT E.Job_ID
FROM Employee E
INNER JOIN Department D ON E.Department_ID = D.Department_ID
WHERE D.Name = 'Research'
AND E.Job_ID IN (
SELECT Job_ID
FROM Employee E
INNER JOIN Department D ON E.Department_ID = D.Department_ID
WHERE D.Name = 'Accounting'
)
ORDER BY E.Job_ID ASC


-------------------       Subqueries:

-- 1. Display the employees list who got the maximum salary.

Select Employee_ID,First_Name,Last_Name,Salary from Employee where 
Salary = (Select max(Salary) from Employee)


-- 2. Display the employees who are working in the sales department.

SELECT Employee_ID,First_Name,Last_Name,Job_ID,Department_ID FROM Employee WHERE Department_ID = ( SELECT Department_ID 
FROM Department WHERE Name = 'Sales')


-- 3. Display the employees who are working as 'Clerk'.

SELECT Employee_ID,First_Name,Last_Name,Job_ID FROM Employee WHERE Job_ID = ( SELECT Job_ID FROM Job 
WHERE Designation = 'Clerk')


-- 4. Display the list of employees who are living in "New York".

SELECT Employee_ID,First_Name,Last_Name,Job_ID,Department_ID FROM Employee WHERE Location_ID = (SELECT Location_ID
FROM [LOCATION] WHERE City = 'New York')


-- 5. Find out the number of employees working in the sales department.

SELECT Count(*) AS Sales_Emp_Count FROM EMPLOYEE E
INNER JOIN DEPARTMENT D on E.DEPARTMENT_ID = D.Department_Id
where D.Name = 'Sales'


-- 6. Update the salaries of employees who are working as clerks on the basis of 10%.

UPDATE E SET E.SALARY = E.SALARY * 1.10 from Employee E
INNER JOIN Job J on E.Job_ID = J.Job_Id
where J.Designation = 'clerk'


-- 7. Delete the employees who are working in the accounting department.


Delete E from Employee E
INNER JOIN DEPARTMENT D on E.DEPARTMENT_ID = D.Department_Id
where D.Name = 'Accounting'


-- 8. Display the second highest salary drawing employee details.

SELECT TOP 1 * FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee)
ORDER BY salary DESC;

-- 9. Display the nth highest salary drawing employee details.

DECLARE @N INT = 3;
WITH RankedSalaries AS (SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employee)

SELECT *
FROM RankedSalaries
WHERE salary_rank = @N

-- 10. List out the employees who earn more than every employee in department 30.

SELECT * FROM employee WHERE salary > (SELECT MAX(salary) FROM employee WHERE department_id = 30)

-- 11. List out the employees who earn more than the lowest salary in department.
SELECT * FROM employee WHERE salary > (SELECT MIN(salary) FROM employee)


-- 12. Find out which department has no employees.

SELECT D.* FROM department D 
LEFT JOIN employee E ON D.department_id = E.department_id WHERE E.employee_id IS NULL

-- 13. Find out the employees who earn greater than the average salary for their department.

SELECT * FROM employee E WHERE salary > (SELECT AVG(salary) FROM employee WHERE department_id = E.department_id)
