use Shweta_Assignment

/*--Q1--*/
select e.LASTNAME,e.DEPARTMENT_ID,d.DEPARTMENT_NAME
from employees e
join departments d
on e.department_id = d.department_id;
select * from EMPLOYEES;

/*--Q2--*/
select distinct e.job_id,d.location_id
from employees e
join departments d
on e.department_id=d.department_id 
where e.department_id=30;

/*--Q3--*/
select e.lastname,d.department_name,d.location_id,l.city
from employees e
Join departments d
on e.department_id=d.department_id
join locations l
on d.location_id= l.location_id
where e.commission_pct is not null;

/*-Q4-*/
select e.lastname,d.department_name
from employees e
join departments d
on e.department_id=d.department_id 
where e.lastname like '%a%'; 

/*--Q5--*/
select e.lastname,
j.job_title,
e.department_id,
d.department_name
from employees e
join departments d
on e.department_id=d.department_id
join jobs j
on e.job_id=j.job_id
join locations l
on d.location_id=l.location_id
where l.city='Toronto';

/*--Q6--*/
select e.lastname as "employee",
e.employee_id as "emp#",
m.lastname as "manager",
m.employee_id as "manager#"
from employees e
join employees m
on e.manager_id =m.employee_id;

/*--Q7--*/
select e.lastname as "employee",
e.employee_id as "emp#",
m.lastname as "manager",
m.employee_id as "manager#"
from employees e
left join employees m
on e.manager_id=m.employee_id
order by e.employee_id;

/*-Q8-*/
select e1.lastname as "employee",
e1.department_id as department_No,
e2.lastname AS Colleague
from employees e1
join employees e2
on e1.department_id=e2.department_id
AND e1.employee_id <> e2.employee_id
where e1.lastname= 'KING'; 


/*--Q9--*/

select e.lastname as "employee",
e.job_id as job,
d.department_name as "department",
e.salary as "salary",
case
  when e.salary>15000 then 'A'
  when e.salary>10000 then 'B'
  when e.salary>5000 then 'C'
  else 'D'
end as "Grade"
from employees e
join departments d on e.department_id=d.department_id;
 

 /*--Q10--*/
 select e.lastname,e.hire_date 
 from employees e 
 where hire_date > (select hire_date from employees where lastname='Davies')
 order by lastname;
 
 /*--Q11--*/
 select 
 e.lastname as "employees",
 e.hire_date as "emp hired",
 m.lastname as "manager",
 m.hire_date as "manager hired"
from employees e
join employees m
on e.manager_id=m.employee_id
where e.hire_date < m.hire_date;

 /*--Q12--*/
 select max(salary) as "max",
 min(salary) as "min",
 sum(salary) as "sum",
 avg(salary) as "avg"
 from employees;

 /*--Q13--*/
 select job_id,
 max(salary) as "max",
 min(salary) as "min",
 sum(salary) as "salary",
 avg(salary) as "avg"
 from employees group by job_id;

 /*--Q14--*/
 select job_id,
 count(*) as num_people
 from employees
 group by job_id;

 /*--Q15--*/
 select
 count(distinct manager_id) as "number of managers"
 from employees
 where manager_id is not null;

 /*--Q16--*/
 select (max(salary) - min(salary)) as
 difference
 from employees;

 /*--Q17--*/
 select manager_id,
 min(salary) as lowest_salary
 from employees
 where manager_id is not null
 group by manager_id
 having min(salary)>=6000
 order by lowest_salary DESC;

 /*--18--*/
select d.department_name as Name,
        l.city as Location,
       count(*) as "No. of people",
       ROUND(avg(e.Salary), 2) as Salary 
from employees e
join departments d 
on e.department_id=d.department_id
join locations l 
on d.location_id=l.location_id
group by d.department_name, l.city;

 /*--19--Write a query to display the lastname, and hiredate of any employee in the department as the employee "Zlotkey". Exclude "Zlotkey".*/
 select e.lastname as employees,
          hire_date as "emp_hired"
 from employees e
 where department_id=(select department_id from employees where lastname='Zlotkey')
 and lastname<> 'Zlotkey';

 /*--20--Create a query to display the employee numbers and lastnames of all employees who earn more than the average salary. Sort the result in ascending order of salary.*/
select employee_id, lastname
from employees
where salary>(select avg(salary)from employees)order by salary ASC;

/*--21-Write a query that displays the employee number and lastname of all employees who work in a department with any employee whose lastname contains a "u".*/

select employee_id, lastname
from employees
where department_id in(
select distinct department_id from employees
where lastname Like '%u%'
);

/*--22--Display the lastname, department number, and job id of all employees whose department location id is 1700.--*/
select e.lastname, e.department_id, e.job_id 
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id=l.location_id
where l.location_id = 1700

/*--23--Display the lastname and salary of every employee who reports to "King".--*/
select e.lastname, e.salary 
from employees e 
join employees m on e.manager_id=m.employee_id
where m.lastname = 'king';

/*--24--Display the department number, lastname, and job id for every employee in the "Executive" department.--*/
select e.department_id, e.lastname, e.job_id
from employees e
join departments d on e.department_id=d.department_id
where d.department_name='Executive';

/*--25--Display the employee number, lastname, and salary of all employees who earn more than the average salary and who work in a department with any employee with a "u" in their lastname.--*/
select e.employee_id,e.lastname, e.salary
from employees e
where e.salary>(select avg(salary) from employees)
and e.department_id in(
select distinct department_id from employees
where lastname Like '%u%');

/*--26--Write a query to get unique department ID from employee table.--*/
select distinct department_id
from employees;

/*--27--Write a query to get all employee details from the employee table order by first name, descending.--*/
select * from employees order by firstname desc;

/*--28--Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).--*/
select firstname,lastname,salary,(salary * 0.15) as pf from employees;

/*--29--Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.*/
select employee_id,firstname,lastname,salary from employees order by salary Asc;

/*--30--Write a query to get the total salaries payable to employees.--*/
select sum(salary) as total_salaries from employees;

/*--31--Write a query to get the maximum and minimum salary from employees table.--*/
select min(salary) as minimum_salary,
max(salary) as maximum_salary from employees;

/*--32--Write a query to get the average salary and number of employees in the employees table.--*/
select avg(salary) as average_salary,
count(*) as total_employees from employees;

/*--33--Write a query to get the number of employees working with the company.--*/
select count(*) as number_of_employees from employees;

/*--34--Write a query to get the number of jobs available in the employees table.--*/
select count(Distinct job_id) as number_of_jobs from employees;

/*--35--Write a query get all first name from employees table in upper case.--*/
select upper(firstname) as first_name_upper from employees;

/*--36--Write a query to get the first 3 characters of first name from employees table.--*/

select substring(firstname,1,3) as first_three_chars from employees;

/*-37--Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.-*/
select firstname from employees;

/*--38--Write a query to get first name from employees table after removing white spaces from both side.--*/
select trim(firstname) from employees;

/*--39--Write a query to get the length of the employee names (first_name, last_name) from employees table.--*/
select firstname,lastname, len(firstname)as firstname_len,
len(lastname) as lastname_len,
len(firstname + lastname)as full_name_len
from employees;

/*--40--Write a query to check if the first_name fields of the employees table contains numbers.--*/
select firstname from employees where firstname like '%[0-9]%';

/*--41--Write a query to select first 10 records from a table--*/
select top 10 * from employees;

/*--42Write a query to get monthly salary (round 2 decimal places) of each and every employee.--*/
select employee_id,firstname,lastname, cast(salary / 12.0 as decimal(10,2)) as monthly_salary from employees;

/*--43--Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.--*/
select firstname,lastname,salary from employees where salary not between 10000 and 15000;

/*--44--Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.-*/
select firstname,lastname,department_id from employees 
where department_id in(30,100)
order by department_id asc;

/*--45--Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.--*/
select firstname,lastname,salary from employees where salary not between 10000 and 15000 and department_id in(30,100);

/*--46--Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.*/
select firstname,lastname,hire_date from employees
where year(hire_date)=1987;

/*--47--Write a query to display the first_name of all employees who have both "b" and "c" in their first name.--*/
select firstname from employees 
where firstname like '%b%' 
and firstname like '%c%';

/*--48--Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.--*/
select e.lastname,j.job_title,e.salary from employees e
join jobs j on e.job_id=j.job_id
where j.job_title in('Programmer', 'shipping Clerk')
and e.salary not in(4500,10000,15000);

/*--49--Write a query to display the last name of employees whose names have exactly 6 characters.--*/
select lastname from employees where len(lastname)=6;

/*--50--Write a query to display the last name of employees having 'e' as the third character.--*/
select lastname from employees
where lastname like '__e%';

/*--51--Write a query to display the jobs/designations available in the employees table.--*/
select distinct job_id from employees;

/*--52--Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.--*/
select firstname,lastname,salary,(salary*0.15) as pf from employees;

/*--53--Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.--*/
select * from employees where lastname in('BLAKE', 'SCOTT', 'KING', 'FORD');

/*--54--Write a query to list the number of jobs available in the employees table.*/
select count(distinct job_id)as number_of_jobs from employees;

/*--55--Write a query to get the total salaries payable to employees.--*/
select sum(salary) as total_salaries from employees;

/*--56--Write a query to get the minimum salary from employees table.--*/
select min(salary)from employees;

/*--57--Write a query to get the maximum salary of an employee working as a Programmer.--*/

select max(salary) as max_programmer_salary from employees where job_id='Prohrammer';

/*--58--Write a query to get the average salary and number of employees working the department 90.--*/
select max(salary) as max_programmer_salary from employees where job_id ='Programmer';

/*--59--Write a query to get the highest, lowest, sum, and average salary of all employees.--*/
select max(salary) as highest_salary,
min(salary) as lowest_salary,
sum(salary) as total_salary,
avg(salary) as average_salary
from employees;

/*--60--Write a query to get the number of employees with the same job.--*/
select job_id, count(*) as number_of_employees from employees group by job_id

/*--61--Write a query to get the difference between the highest and lowest salaries.--*/
select (max(salary)-min(salary))as salary_difference from employees;

/*--62--Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.--*/
select manager_id,
min(salary) as lowest_salary from employees group by manager_id;

/*--63--Write a query to get the department ID and the total salary payable in each department.--*/
select department_id,
sum(salary) as total_salary from employees group by department_id;

/*--64--Write a query to get the average salary for each job ID excluding programmer.-*/
select job_id,
avg(salary)as average_salary
from employees
where JOB_ID <> 'programmer'
group by JOB_ID;

/*--65--Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.--*/
select
    job_id,
    sum(salary) AS total_salary,
    max(salary) AS max_salary,
    min(salary) AS min_salary,
    avg(salary) AS avg_salary
from employees
where department_id = 90
group by job_id;

/*--66--Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.--*/
select job_id, max(salary) as max_salary from employees group by job_id having max(salary) >=4000;

/*--67--Write a query to get the average salary for all departments employing more than 10 employees.--*/
select department_id,avg(salary) as avg_salary from employees group by department_id having count(*) > 10;

/*--68-Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.*/
select firstname,lastname salary from EMPLOYEES where salary>(select SALARY from EMPLOYEES where lastname='Bull');

/*--69--Write a query to find the name (first_name, last_name) of all employees who works in the IT department.--*/
select firstname,lastname from EMPLOYEES e
join DEPARTMENTS d on e.department_id=d.department_id where d.department_name='IT';

/*--70--Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department. (Hint : Write single-row and multiple-row subqueries)--*/
SELECT firstname, lastname
FROM employees
WHERE manager_id IS NOT NULL
  AND department_id = (
      SELECT min(department_id)
      FROM departments
      WHERE location_id =  (
          SELECT min(location_id)
          FROM locations l
          join countries c on l.country_id=c.country_id
          where c.country_name='USA'
        
         )

  );

/*--71--Write a query to find the name (first_name, last_name) of the employees who are managers.--*/
  select firstname,lastname from EMPLOYEES
  where EMPLOYEE_ID in(
  select distinct MANAGER_ID from employees where MANAGER_ID is not null);
  
/*--72--Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.--*/
select firstname,lastname,salary from employees where salary>(select AVG(salary) from employees);
  
/*--73--Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.--*/
select firstname,lastname,salary,job_id
from EMPLOYEES e
where SALARY=(
select MIN(salary) from employees where JOB_ID=e.JOB_ID);

/*--74--Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments--*/
select e.firstname,e.lastname,e.salary from EMPLOYEES e
where e.SALARY>(select AVG(salary)from EMPLOYEES)
and e.DEPARTMENT_ID in(select DEPARTMENT_ID from DEPARTMENTS where DEPARTMENT_NAME like '%IT%');

/*--75--Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.--*/
select firstname,lastname,salary from EMPLOYEES
where SALARY>(select SALARY from EMPLOYEES where lastname='Bell');

/*--76--Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.--*/
select firstname,lastname,salary from EMPLOYEES e
where SALARY=(select MIN(salary)from EMPLOYEES where DEPARTMENT_ID=e.DEPARTMENT_ID);

/*--77--Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.--*/
select firstname,lastname,salary from EMPLOYEES where SALARY>(select AVG(salary)from EMPLOYEES);

/*--78--Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.--*/
select firstname,lastname,salary from EMPLOYEES
where salary>all (select salary from EMPLOYEES where job_id='SH_CLERK')
order by salary ASC;

/*--79--Write a query to find the name (first_name, last_name) of the employees who are not supervisors.--*/
select firstname,lastname from EMPLOYEES
where employee_id not in(select distinct manager_id from EMPLOYEES where MANAGER_ID is not null);

/*--80--Write a query to display the employee ID, first name, last name, and department names of all employees.--*/
select e.employee_id,e.firstname,e.lastname,d.department_name from EMPLOYEES e
left join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

/*--81--Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.--*/
select e.employee_id,e.firstname,e.lastname,e.salary
from employees e
where e.salary>(
select AVG(salary)from EMPLOYEES where DEPARTMENT_ID=e.department_id);

/*--82--Write a query to fetch even numbered records from employees table.--*/
select e.employee_id,e.firstname,e.lastname,e.salary, d.DEPARTMENT_NAME from employees e
join departments d on e.department_id=d.department_id
where e.SALARY>(select AVG(salary) from EMPLOYEES where DEPARTMENT_ID=e.DEPARTMENT_id);

/*--83--Write a query to find the 5th maximum salary in the employees table.--*/
select salary
from(select salary, ROW_NUMBER() over(order by salary desc)as rn from EMPLOYEES)sub where rn=5;

/*--84--Write a query to find the 4th minimum salary in the employees table.--*/
select salary
from(select salary, ROW_NUMBER() over(order by salary asc)as rn from EMPLOYEES)sub where rn=4;

/*--85--Write a query to select last 10 records from a table.--*/
select TOP(10) *
from employees 
order by hire_date desc;

/*--86--Write a query to list the department ID and name of all the departments where no employee is working.--*/
select d.department_id,d.department_name from departments d
where department_id not in(select distinct e.department_id from employees e
where e.department_id is not null);

/*--87--Write a query to get 3 maximum salaries.--*/
select distinct TOP (3) salary from employees order by salary desc;

/*--88--Write a query to get 3 minimum salaries.--*/
select distinct TOP (3) salary from employees order by salary asc;

/*--89--Write a query to get nth max salaries of employees.--*/
select salary from(
select salary, DENSE_RANK() over (order by salary DESC)as rnk
from EMPLOYEES)t
where rnk=3;

/*--90--Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.--*/
select d.department_id,
l.location_id,
l.street_address,
l.city,
l.state_province,
c.country_name
from departments d
join loactions l
on d.location_id = l.location_id join countries c
on l.country_id = c.country_id;

/*--91--Write a query to find the name (first_name, last name), department ID and name of all the employees.--*/
SELECT
    e.firstname,
    e.lastname,
    e.department_id,
    d.department_name
FROM 
    Employees e
JOIN 
    Departments d ON e.department_id = d.department_id;

/*--92--Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.--*/
SELECT
    e.firstname,
    e.lastname,
    e.job_id,
    e.department_id,
    d.department_name
FROM 
    Employees e
JOIN 
    Departments d ON e.department_id = d.department_id
JOIN 
    Locations l ON d.location_id = l.location_id
WHERE 
    l.city = 'London';

/*--93--Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).--*/
select e.employee_id,
e.lastname as employee_lastname,
m.employee_id as manager_id,
m.lastname as manager_lastname
from employees e
join employees m
on e.MANAGER_ID = m.employee_id;

/*--94--Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.--*/
select firstname,lastname,hire_date
from employees
where hire_date > (
select hire_date from employees
where lastname='Jones');

/*--95--Write a query to get the department name and number of employees in the department.--*/
select d.department_name, 
count(e.employee_id) as num_of_employees
from departments d
left join EMPLOYEES e
on d.department_id=e.department_id
group by d.department_name

/*--96--Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.--*/
SELECT
    e.employee_id,
    j.job_title,
    DATEDIFF(day,jh.start_date, jh.end_date) AS No_Of_days
FROM 
    job_history jh
JOIN 
    employees e 
    ON jh.employee_id = e.employee_id join jobs j 
    on j.job_id=j.job_id
WHERE 
    e.department_id = 90;

/*--97--Write a query to display the department ID and name and first name of manager.--*/
SELECT
    d.department_id,
    d.department_name,
    e.firstname AS manager_firstname
FROM 
    departments d
JOIN 
    employees e ON d.manager_id = e.employee_id;

/*--98--Write a query to display the department name, manager name, and city.--*/
SELECT
    d.department_name,
    CONCAT(e.firstname, ' ', e.lastname) AS manager_name,
    l.city
FROM 
    departments d
JOIN 
    employees e ON d.manager_id = e.employee_id
JOIN 
    locations l ON d.location_id = l.location_id;

/*--99--Write a query to display the job title and average salary of employees.--*/
SELECT
    j.job_title,
    AVG(e.salary) AS avg_salary
FROM 
    employees e
join JOBS j
on e.JOB_ID=j.job_id
GROUP BY 
    job_title;

/*--100-Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.--*/
SELECT
    j.job_title,
    CONCAT(e.firstname, ' ', e.lastname) AS employee_name,
    e.salary - j.min_salary AS salary_difference_min
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id;

/*--101--Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.--*/
SELECT
    jh.employee_id,
    j.job_title,
    jh.start_date,
    jh.end_date
FROM 
    job_history jh
JOIN 
    employees e ON jh.employee_id = e.employee_id
JOIN 
    jobs j ON jh.job_id = j.job_id
WHERE 
    e.salary > 10000;

    /*--102--Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.--*/
    SELECT
    d.department_name,e.firstname,e.lastname,e.hire_date,e.salary from employees e
    join DEPARTMENTS d
    on e.DEPARTMENT_ID =d.DEPARTMENT_ID where e.JOB_ID like '%MAN%' 
    and DATEDIFF(year, e.hire_date, GETDATE())>15;

/*--103--Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'--*/
select firstname,hire_date 
from EMPLOYEES
where HIRE_DATE between '1987-06-01' and '1987-07-30';

/*--104--Write a query to get the firstname, lastname who joined in the month of June.--*/
select firstname,lastname,hire_date from EMPLOYEES where MONTH(hire_date)=6;

/*--105--Write a query to get the years in which more than 10 employees joined.--*/
select YEAR(hire_date)as join_year,COUNT(*) as total_employees from EMPLOYEES group by YEAR(hire_date)having COUNT(*)>10;

/*--106--Write a query to get first name of employees who joined in 1987.--*/
SELECT FirstName
FROM Employees
WHERE YEAR(hire_date) = 1987;

/*--107--Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.--*/
SELECT
    d.Department_Name,
    e.FirstName + ' ' + e.LastName AS ManagerName,
    e.Salary
FROM 
    Employees e
JOIN 
    Departments d ON e.Employee_id = d.Manager_id
WHERE 
    DATEDIFF(YEAR, e.hire_date, GETDATE()) > 5;

/*--108--Write a query to get employee ID, last name, and date of first salary of the employees.--*/
select e.employee_id,e.lastname,
MIN(jh.start_date)as first_salary_date
from employees e
join job_history jh
on e.EMPLOYEE_ID=jh.employee_id
group by e.EMPLOYEE_ID,e.lastname;

/*--109--Write a query to get first name, hire date and experience of the employees.--*/
SELECT
    FirstName,
    hire_date,
    DATEDIFF(YEAR, hire_date, GETDATE()) AS ExperienceYears
FROM 
    Employees;

/*--110--Write a query to get the department ID, year, and number of employees joined.--*/
SELECT
    Department_id,
    YEAR(hire_date) AS JoinYear,
    COUNT(*) AS NumEmployeesJoined
FROM 
    Employees
GROUP BY 
    Department_id, YEAR(hire_date)
ORDER BY 
    Department_id, JoinYear;

/*--111-Write a query to get the job_id and related employee's id.--*/
SELECT
    Job_id,
    Employee_id
FROM 
    Employees;

/*--112--Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.--*/
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';
select * from EMPLOYEES e;

/*--113--Write a query to get the details of the employees where the length of the first name greater than or equal to 8.--*/
SELECT *
FROM employees
WHERE LEN(firstname) >= 8;

/*--114--Write a query to display leading zeros before maximum and minimum salary.--*/
SELECT
    RIGHT(REPLICATE('0', 8) + CAST(MAX(salary) AS VARCHAR), 8) AS max_salary_with_zeros,
    RIGHT(REPLICATE('0', 8) + CAST(MIN(salary) AS VARCHAR), 8) AS min_salary_with_zeros
FROM employees;

/*--115--Write a query to append '@example.com' to email field.--*/
UPDATE employees
SET email = email + '@example.com';
select * from EMPLOYEES e;

/*--116--Write a query to get the employee id, first name and hire month.--*/
SELECT
    employee_id, 
    firstname, 
    MONTH(hire_date) AS hire_month
FROM employees;

/*--117--Write a query to get the employee id, email id (discard the last three characters).--*/
SELECT
    employee_id, 
    LEFT(email, LEN(email) - 3) AS trimmed_email
FROM employees;

/*--118--Write a query to find all employees where first names are in upper case.--*/
SELECT *
FROM employees
WHERE firstname = UPPER(firstname);

/*--119--Write a query to extract the last 4 character of phone numbers.--*/
SELECT
    employee_id, 
    RIGHT(phone_number, 4) AS last_four_digits
FROM employees;

/*--120--Write a query to get the last word of the street address.--*/
SELECT
  street_address,
  RIGHT(street_address, CHARINDEX(' ', REVERSE(street_address)) - 1) AS last_word
FROM locations;


/*--121--Write a query to get the locations that have minimum street length.-*/
SELECT *
FROM locations
WHERE street_address = (
    SELECT MIN(street_address) FROM locations
);


/*--122--Write a query to display the first word from those job titles which contains more than one words.--*/
SELECT
    job_title,
    LEFT(job_title, CHARINDEX(' ', job_title) - 1) AS [First Word]
FROM 
    jobs
WHERE 
    CHARINDEX(' ', job_title) > 0;

/*--123--Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position.--*/
SELECT
    firstname,
    LEN(firstname) AS first_name_length
FROM 
    employees
WHERE 
    CHARINDEX('c', SUBSTRING(lastname, 3, LEN(lastname))) > 0;

/*--124--Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.--*/
SELECT
    firstname AS "First Name",
    LEN(firstname) AS "Name Length"
FROM 
    employees
WHERE 
    firstname LIKE 'A%' 
    OR firstname LIKE 'J%' 
    OR firstname LIKE 'M%'
ORDER BY 
    firstname;

/*--125--Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.--*/
SELECT
    firstname AS [First Name],
    RIGHT(REPLICATE('$', 10) + CAST(salary AS VARCHAR), 10) AS [SALARY]
FROM 
    employees;

/*--126--Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.--*/
SELECT
    LEFT(firstname, 8) AS [First Name],
    REPLICATE('$', salary / 1000) AS [SALARY]
FROM 
    employees
ORDER BY 
    salary DESC;

/*--127--Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.-*/
SELECT
    employee_id AS "Employee Code",
    firstname AS "First Name",
    lastname AS "Last Name",
    hire_date AS "Hire Date"
FROM 
    employees
WHERE 
    EXTRACT(DAY FROM hire_date) = 7
    OR EXTRACT(MONTH FROM hire_date) = 7;

    
