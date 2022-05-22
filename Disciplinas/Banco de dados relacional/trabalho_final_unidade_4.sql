/*Para o schema Employees, responda as seguintes perguntas construindo os comandos SQL*/
 
/*1 – Quantidade de empregados alocados por setor  em cada um dos anos, separando em dois 
comandos diferentes, que podem ser views, funcionários ativos e inativos conforme o modelo.*/

CREATE ALGORITHM=UNDEFINED DEFINER=`naudim`@`%` 
SQL SECURITY DEFINER 
VIEW `active_emp` AS 
SELECT 
	`dept_emp`.`emp_no` AS `emp_no`,
	max(`dept_emp`.`to_date`) AS `final_date` 
FROM `dept_emp` 
WHERE (`dept_emp`.`to_date` > now()) 
GROUP BY `dept_emp`.`emp_no`;

CREATE ALGORITHM=UNDEFINED DEFINER=`naudim`@`%` 
SQL SECURITY DEFINER 
VIEW `fired_emp` AS 
SELECT 
	`dept_emp`.`emp_no` AS `emp_no`,
	max(`dept_emp`.`to_date`) AS `final_date` 
FROM `dept_emp` 
WHERE (`dept_emp`.`to_date` < now()) 
GROUP BY `dept_emp`.`emp_no`;

/*Todos usuários (ativos e inativos)*/
SELECT
	d.dept_no,
    d.dept_name,
    year(FROM_date) AS ano,
    COUNT(emp_no) AS qtde
FROM current_dept_emp cde
INNER JOIN departments d on cde.dept_no = d.dept_no
INNER JOIN 
GROUP BY 
	dept_no, 
    year(FROM_date)
ORDER BY 
	ano,
    dept_no;
--------------------------------------///////////////////////////////-----------------------------	
/*Usuários ativos*/
SELECT
	d.dept_no,
    d.dept_name,
    year(FROM_date) AS ano,
    COUNT(cde.emp_no) AS qtde
FROM current_dept_emp cde
INNER JOIN departments d ON cde.dept_no = d.dept_no
INNER JOIN active_emp ace ON cde.emp_no = ace.emp_no
GROUP BY 
	dept_no, 
    year(FROM_date)
ORDER BY 
	ano,
    dept_no;
--------------------------------------///////////////////////////////-----------------------------
/*Usuários inativos*/
SELECT
	d.dept_no,
    d.dept_name,
    year(FROM_date) AS ano,
    COUNT(cde.emp_no) AS qtde
FROM current_dept_emp cde
INNER JOIN departments d ON cde.dept_no = d.dept_no
INNER JOIN fired_emp fde ON cde.emp_no = fde.emp_no
GROUP BY 
	dept_no, 
    year(FROM_date)
ORDER BY 
	ano,
    dept_no;

  
/*2 – Quantidade de cargos ocupada por cada funcionário no histórico de prestação de serviços 
de cada um deles na empresa.*/

SELECT 
	t.emp_no,
    e.first_name,
    e.last_name,
    count(t.emp_no) AS Qtde
FROM titles t
INNER JOIN employees e ON t.emp_no = e.emp_no
GROUP BY emp_no;

/*3  –  Média  de  cargos  ocupada  por  cada  funcionário  e  geral  da  empresa  demonstrado,  em 
comandos separados, que podem ser views, quais deles ficaram abaixo da média geral de cargos 
e quais ficaram acima da média geral de cargos.*/  

CREATE VIEW `avg_title_emp` AS
SELECT
	AVG(qtde) AS average
FROM (
		SELECT 
			emp_no,
			count(emp_no) AS qtde
		FROM employees.titles
		GROUP BY emp_no
	) AS aux;
	
CREATE VIEW `avg_title` AS
SELECT
	AVG(qtde) AS average
FROM (
		SELECT 
			count(emp_no) AS qtde,
			title
		FROM employees.titles
		GROUP BY title
	) AS aux;

--------------------------------------///////////////////////////////-----------------------------
/*Funcionários acima da média de cargos*/	
SELECT
	aux.emp_no,
    e.first_name,
    e.last_name,
	aux.qtde
FROM (
		SELECT 
			emp_no,
			count(emp_no) AS qtde
		FROM employees.titles
		GROUP BY emp_no
	) AS aux
INNER JOIN employees e on aux.emp_no = e.emp_no
WHERE
	aux.qtde > (SELECT  average FROM avg_title_emp);

--------------------------------------///////////////////////////////-----------------------------
/*Cargos acima da média de funcionários*/	
SELECT
	aux.title,
	aux.qtde
FROM (
		SELECT 
			count(emp_no) AS qtde,
			title
		FROM employees.titles
		GROUP BY title
	) AS aux
WHERE
	aux.qtde > (SELECT  average FROM avg_title);

/*4 – Qual a média de salários de cada departamento e a média geral da empresa demonstrando 
em comandos  separados, que  podem  ser  views,    quais  focaram acima  e  abaixo  da média  por 
ano.*/

CREATE ALGORITHM=UNDEFINED DEFINER=`naudim`@`%` 
SQL SECURITY DEFINER 
VIEW `avg_salary` AS 
select 
	year(`salaries`.`from_date`) AS `ano`,
	avg(`salaries`.`salary`) AS `average` 
from `salaries` 
group by `ano`;

CREATE ALGORITHM=UNDEFINED DEFINER=`naudim`@`%` 
SQL SECURITY DEFINER 
VIEW `avg_salary_dep` AS 
select 
	`aux`.`dept_no` AS `dept_no`,
	`aux`.`ANO` AS `ANO`,
	avg(`aux`.`salary`) AS `average` 
from (
		select 
			`de`.`emp_no` AS `emp_no`,
			`de`.`dept_no` AS `dept_no`,
			`s`.`salary` AS `salary`,
			year(`de`.`from_date`) AS `ANO` 
		from (`dept_emp` `de` join `salaries` `s` on(((`de`.`emp_no` = `s`.`emp_no`) and (year(`de`.`from_date`) = year(`s`.`from_date`)))))
	 ) `aux` 
		group by 
			`aux`.`ANO`,
			`aux`.`dept_no` 
		order by 
			`aux`.`dept_no`,
			`aux`.`ANO`;

--------------------------------------///////////////////////////////-----------------------------
/*Departamentos acima da média de salário por ano*/
SELECT 
	* 
FROM avg_salary_dep sd
INNER JOIN avg_salary s on sd.ano = s.ano
WHERE
	sd.average > s.average
ORDER BY sd.ano

--------------------------------------///////////////////////////////-----------------------------
/*Departamentos abaixo da média de salário por ano*/
SELECT 
	* 
FROM avg_salary_dep sd
INNER JOIN avg_salary s on sd.ano = s.ano
WHERE
	sd.average < s.average
ORDER BY sd.ano

 
/*Para o schema sakila, responda as seguintes perguntas construindo os comandos SQL*/ 
 
/*1  –  Quantidade  de  filmes  locados  por  categoria  em  cada  um  dos  anos,  separando  em  dois 
comandos  diferentes,  que  podem  ser  views,  a  lista  de  filmes  e  a  lista  de  filmes  com  seus 
respectivos atores.*/ 

SELECT 
	c.name,
	YEAR(r.rental_date) AS ano,
	count(r.rental_id) AS qtde 
FROM sakila.rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film_category fc ON i.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY 
	c.name,
    ano
 
/*2 – Quantidade de filmes por categoria e os valores totais de locação de cada filme, separando 
em dois comandos diferentes, que podem ser views, valores por filme e valores por categoria.*/ 


/*3  –  Média  de  atuação  de  cada  ator  em  filmes  geral  do  inventário  de  filmes,  em  comandos 
separados, que podem ser views, quais deles ficaram abaixo da média geral de atuações e quais 
ficaram acima da média geral de atuações.*/ 

 
/*4 – Qual o valor médio de locações de cada categoria e a média geral da empresa demonstrando 
em comandos separados, que podem ser views,  quais filmes ficaram acima e abaixo da média 
da categoria por ano.*/ 



/*Para o schema world, responda as seguintes perguntas construindo os comandos SQL*/ 
 
/*1 – Top 3 continentes em quantidade populacional registrados na base de dados.*/  


/*2 – Expectativa de vida média por país e geral do planeta, de acordo com os dados registrados 
em comandos separados, que podem ser views, quais deles ficaram abaixo e quais ficaram acima 
da média geral da expectativa de vida.*/ 


/*3 – Média de quantidade populacional de cada país por continente, em comandos separados, 
que  podem ser  views,  quais  deles  ficaram  abaixo  da  média  geral  de  atuações  e  quais  ficaram 
acima da média geral da população levando em consideração o agrupamento dos continentes.*/  


/*4 – Qual o valor médio de locações de cada categoria e a média geral da empresa demonstrando 
em comandos separados, que podem ser views,  quais filmes ficaram acima e abaixo da média 
da categoria por ano.*/