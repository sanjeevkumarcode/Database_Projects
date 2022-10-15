/****************************************/
/*   30 Simple SQL Interview Queries    */
/****************************************/
create database employee1;
use employee1;

/*1. Delete table Employee, Department and Company.*/
drop table employee;
drop table department;
drop table company;

/*
2. Create tables:
Employee with attributes (id, name, city, department, salary)
Department with attributes (id, name)
Company with attributes (id, name, revenue)
*/
create table employee(
id int(12) not null,
name varchar(12) not null,
city varchar(12) not null,
department varchar(11) not null,
salary int(23) not null
);

CREATE TABLE department(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE company(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    revenue INT
);

/*
4. Add rows into Department table
(1, 'IT'),
(2, 'Management'),
(3, 'IT'),
(4, 'Support');
*/
insert into  department values(1,'IT'),(2,'management'),(3,'IT'),(4,'support');

/*
5. Add rows into Company table
(1, 'IBM', 2000000),
(2, 'GOOGLE', 9000000),
(3, 'Apple', 10000000);
*/
insert into company values(1,'IBM',200000),(2,'GOOGLE',90000000),(3,'Apple',100000);

/*
6. Add rows into employee table:
(1, 'David', 'London', 'IT', 80000),
(2, 'Emily', 'London', 'IT', 70000),
(3, 'Peter', 'Paris', 'IT', 60000),
(4, 'Ava', 'Paris', 'IT', 50000),
(5, 'Penny', 'London', 'Management', 110000),
(6, 'Jim', 'London', 'Management', 90000),
(7, 'Amy', 'Rome', 'Support', 30000),
(8, 'Cloe', 'London', 'IT', 110000);
*/
INSERT INTO employee (id,name,city,department,salary)
VALUES
(1,'David', 'London', 3, 80000),
(2,'Emily', 'London', 3, 70000),
(3,'Peter', 'Paris', 3, 60000),
(4,'Ava', 'Paris', 3, 50000),
(5,'Penny', 'London', 2, 110000),
(6,'Jim', 'London', 2, 90000),
(7,'Amy', 'Rome', 4, 30000),
(8,'Cloe', 'London', 3, 110000);

/*
7. Query all rows from Department table
*/
SELECT * FROM department;

/*
8. Change the name of department with id =  1 to 'Management'
*/
select * from department;
update department set name='management' where id=1;

/*
9. Delete employees with salary greater than 100 000
*/
select * from employee;
delete from employee where salary>100000;

/*
10. Query the names of companies
*/
SELECT name FROM company;

/*
11. Query the name and city of every employee
*/
SELECT name, city
FROM employee;

/*
12. Query all companies with revenue greater than 5 000 000
*/
SELECT * FROM company
WHERE revenue > 5000000;

/*
13. Query all companies with revenue smaller than 5 000 000
*/
SELECT * FROM company
WHERE revenue < 5000000;

/*
14. Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator
*/
select * from company
where not revenue  > 500000;

/*
15. Query all employees with salary greater than 50 000 and smaller than 70 000
*/
select * from employee
where salary between 50000 and 70000;

/*
16. Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN
*/
select * from employee
where salary > 50000 and salary < 70000;

/*
17. Query all employees with salary equal to 80 000.
*/
SELECT * FROM employee
WHERE salary = 80000;

/*
18. Query all employees with salary not equal to 80 000.
*/
select * from employee
where salary !=80000;

SELECT * FROM employee
WHERE salary <> 80000;

/*
19. Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.
*/
select * from employee
where salary > 70000 and department = 'IT';

/*
20. Query all employees that work in city that starts with 'L'
*/
SELECT * FROM employee
WHERE city LIKE 'L%';

/*
21. Query all employees that work in city that starts with 'L' or ends with 's'
*/
SELECT * FROM employee
WHERE city LIKE 'L%' OR city LIKE '%s';

/*
22. Query all employees that  work in city with 'o' somewhere in the middle
*/
SELECT * FROM employee
WHERE city LIKE '%o%';

/*
23. Query all departments (each name only once)
*/
SELECT DISTINCT name FROM department;

/*
24. Query names of all employees together with id of department they work in, but you cannot use JOIN.
*/
SELECT emp.name,dep.id,dep.name
FROM employee emp, department dep
WHERE emp.department_id = dep.id
ORDER BY emp.name, dep.id;

/*
25. Query names of all employees together with id of department they work in, using JOIN.
*/
SELECT emp.name,dep.id,dep.name
FROM employee emp
JOIN department dep
ON emp.department_id = dep.id
ORDER BY emp.name, dep.id;

/*
26. Query name of every company together with departments without the 'Support' department
*/
SELECT com.name,dep.name
FROM company com, department dep
WHERE dep.name NOT LIKE 'Support'
ORDER BY com.name;

/*
27. Query employee name together with the department name that they are not working in
*/
SELECT emp.name, dep.name
FROM employee emp, department dep
WHERE emp.department_id <> dep.id;

/*
28.Query names of every company and change the name of column to 'Company'
*/
SELECT name AS Company
FROM company;
