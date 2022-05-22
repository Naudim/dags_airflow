use world;

SELECT MIN(Percentage)
FROM countrylanguage
WHERE Language = 'English'
AND IsOfficial = 'T'
AND Percentage >0;

SELECT MIN(LifeExpectancy)
FROM country;

SELECT MIN(Name)
FROM country;

SELECT name
FROM country
ORDER BY name;


SELECT MAX(Percentage)
FROM countrylanguage
WHERE Language = 'English'
AND IsOfficial = 'T'
AND Percentage >0;

SELECT MAX(LifeExpectancy)
FROM country;

SELECT MAX(Name)
FROM country;

SELECT name
FROM country
ORDER BY name DESC;

SELECT SUM(SurfaceArea) as "Área da Superfície Total do Caribe"
FROM country
WHERE Region = 'Caribbean';


USE employees;

SELECT ROUND(SUM(salary),2)
FROM salaries s INNER JOIN employees e   ON (s.emp_no=e.emp_no)
                INNER JOIN dept_emp de   ON (e.emp_no=de.emp_no)
                INNER JOIN departments d ON (de.dept_no= d.dept_no)
 WHERE d.dept_name = 'Marketing'
 AND de.to_date ='9999-01-01'
 AND e.hire_date > '1999-01-01';
 
SELECT ROUND(AVG(salary),2)
FROM salaries s INNER JOIN employees e   ON (s.emp_no=e.emp_no)
                INNER JOIN dept_emp de   ON (e.emp_no=de.emp_no)
                INNER JOIN departments d ON (de.dept_no= d.dept_no)
 WHERE d.dept_name = 'Marketing'
 AND de.to_date ='9999-01-01'
 AND e.hire_date > '1999-01-01';
 
SELECT ROUND(AVG(salary),2)
FROM salaries s INNER JOIN employees e   ON (s.emp_no=e.emp_no)
                INNER JOIN dept_emp de   ON (e.emp_no=de.emp_no)
                INNER JOIN departments d ON (de.dept_no= d.dept_no)
 WHERE d.dept_name = 'Marketing'
 AND de.to_date ='9999-01-01'
 AND e.hire_date < '1999-01-01';
 
use world;
 
SELECT ROUND(VARIANCE(LifeExpectancy),4)
FROM country;
 
SELECT ROUND(STDDEV(LifeExpectancy),4)
FROM country;

SELECT MIN(LifeExpectancy), MAX(LifeExpectancy), 
       AVG (LifeExpectancy)
FROM country;

use employees;

SELECT COUNT(*)
FROM employees
WHERE hire_date < '1999-01-01';

use world;

SELECT DISTINCT(Continent) 
FROM country;

SELECT COUNT(DISTINCT(Continent)) 
FROM country;

use employees;

SELECT DISTINCT emp_no, dept_no
FROM dept_emp
WHERE to_date = '9999-01-01'
AND dept_no = 'd007';

SELECT dept_no,COUNT(emp_no)
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no;

use world;

SELECT Continent,SUM(SurfaceArea)
FROM country 
GROUP BY Continent
ORDER BY Continent;

SELECT ct.Name , c.District, SUM(c.Population)
FROM city c INNER JOIN country ct ON (c.CountryCode=ct.Code)
GROUP BY c.CountryCode, c.District;
 
SELECT ct.Name , c.District, AVG(c.Population)
FROM city c INNER JOIN country ct ON (c.CountryCode=ct.Code)
GROUP BY c.CountryCode,c.District;
 
SELECT ct.Name , c.District, SUM(c.Population)
FROM city c INNER JOIN country ct ON (c.CountryCode=ct.Code)
GROUP BY c.CountryCode, c.District
HAVING COUNT(c.District) > 2;

use employees;

SELECT d.dept_name, ROUND((MAX(salary)/12),2)
FROM dept_emp de INNER JOIN employees e   ON (de.emp_no=e.emp_no)
                 INNER JOIN departments d ON (de.dept_no=d.dept_no)
                 INNER JOIN salaries    s ON (s.emp_no=e.emp_no)
WHERE de.to_date = '9999-01-01'
AND    s.to_date = '9999-01-01'
GROUP BY d.dept_no
HAVING AVG(salary) > 70000
ORDER BY d.dept_no;

use world;

SELECT ct.Name , c.District, AVG(c.Population)
FROM city c INNER JOIN country ct ON (c.CountryCode=ct.Code)
GROUP BY ct.Name,c.District WITH ROLLUP;

SELECT ct.Region , c.Name, AVG(c.Population)
FROM city c INNER JOIN country ct ON (c.CountryCode=ct.Code)
GROUP BY ct.Region,c.Name WITH ROLLUP;

SELECT ct.Region , c.Name, c.District, AVG(c.Population)
FROM city c INNER JOIN country ct ON (c.CountryCode=ct.Code)
GROUP BY ct.Region,c.Name, c.District WITH ROLLUP;

use employees;

SELECT d.dept_name, ROUND((AVG(salary)/12),2) as "Média de salário mensal"
FROM dept_emp de INNER JOIN employees e   ON (de.emp_no=e.emp_no)
                 INNER JOIN departments d ON (de.dept_no=d.dept_no)
                 INNER JOIN salaries    s ON (s.emp_no=e.emp_no)
WHERE de.to_date = '9999-01-01'
AND    s.to_date = '9999-01-01'
GROUP BY d.dept_name WITH ROLLUP
ORDER BY d.dept_name;

SELECT d.dept_name, t.title, count(de.emp_no) as "Qtde de funcionários com este cargo", 
       ROUND((AVG(salary)/12),2) as "Média de salário mensal", 
       ROUND((MAX(salary)/12),2) as "Maior salário mensal do departamento",
       ROUND((MIN(salary)/12),2) as "Menor salário mensal do departamento"
FROM dept_emp de INNER JOIN employees e   ON (de.emp_no=e.emp_no)
                 INNER JOIN departments d ON (de.dept_no=d.dept_no)
                 INNER JOIN salaries    s ON (s.emp_no=e.emp_no)
                 INNER JOIN titles      t ON (e.emp_no=t.emp_no)
WHERE de.to_date = '9999-01-01'
AND    s.to_date = '9999-01-01'
GROUP BY d.dept_name, t.title  WITH ROLLUP
ORDER BY d.dept_name;

SELECT IF(GROUPING(d.dept_name),"Todos os Departamentos",d.dept_name) as "Departamentos",
       IF(GROUPING(t.title),"Todos os cargos",t.title) as "Cargos", 
       count(de.emp_no) as "Qtde de funcionários com este cargo", 
       ROUND((AVG(salary)/12),2) as "Média de salário mensal", 
       ROUND((MAX(salary)/12),2) as "Maior salário mensal do departamento",
       ROUND((MIN(salary)/12),2) as "Menor salário mensal do departamento"
FROM dept_emp de INNER JOIN employees e   ON (de.emp_no=e.emp_no)
                 INNER JOIN departments d ON (de.dept_no=d.dept_no)
                 INNER JOIN salaries    s ON (s.emp_no=e.emp_no)
                 INNER JOIN titles      t ON (e.emp_no=t.emp_no)
WHERE de.to_date = '9999-01-01'
AND    s.to_date = '9999-01-01'
GROUP BY d.dept_name, t.title  WITH ROLLUP
ORDER BY d.dept_name, Cargos;


SELECT emp_no
FROM employees e 
UNION ALL 
SELECT emp_no
FROM dept_emp;


SELECT emp_no
FROM employees e 
UNION DISTINCT
SELECT emp_no
FROM dept_emp;


