USE sakila;

SELECT * 
FROM sakila.staff 
ORDER BY picture DESC;

SELECT *
FROM actor 
ORDER BY first_name ASC;

SELECT *
FROM sakila.actor 
ORDER BY first_name DESC;

SELECT *
FROM sakila.actor 
ORDER BY last_name, first_name ASC;

SELECT *
FROM actor 
WHERE actor_id BETWEEN 150 AND 300
ORDER BY first_name ASC, last_name DESC ;

SELECT (400/20) + 15 as "Resultado precedência com parênteses no inicio"
FROM DUAL;

SELECT 400/(20 + 15) as "Resultado precedência com parênteses no fim"
FROM DUAL;

SELECT SYSDATE() FROM DUAL;

SELECT USER() FROM DUAL;

SELECT * FROM DUAL;

USE employees;

SELECT first_name, UPPER(first_name) as "CONVERTI PARA MAIÚSCULO"
FROM employees;

USE sakila;

SELECT first_name, LOWER(first_name) "CONVERTI PARA MINÚSCULO"
FROM customer;

SELECT CONCAT('AUGUSTO', 'ZADRA')
FROM DUAL;

USE employees;

SELECT CONCAT_WS("-",first_name, "*",last_name) as "Complete Name"
FROM employees limit 10;

USE sakila;

SELECT first_name, 
       CONCAT(UPPER(LEFT(first_name, 1)),
       LOWER(SUBSTRING(first_name, 2, LENGTH(first_name)))) as "INITCAP ON MYSQL"
FROM customer;

USE employees;
       
SELECT first_name, last_name
FROM employees      
WHERE first_name =  (CONCAT(UPPER(LEFT(first_name, 1)), 
					LOWER(SUBSTRING(first_name, 2, LENGTH(first_name)))));
       
SELECT SUBSTR('HelloWorld',1,5)
FROM DUAL;     

SELECT LENGTH('HelloWorld') as "Tamanho da string"
FROM DUAL;

SELECT LENGTH(last_name) as "Tamanho da string"
FROM employees limit 3;
 
SELECT INSTR('HelloWorld', 'W') as "Posição que está a letra"
FROM DUAL;

SELECT LPAD('HelloWorld',15, '-') as "Preenchendo a esquerda"
FROM DUAL;

SELECT RPAD('HelloWorld',15, '-') as "Preenchendo a direita"
FROM DUAL;

SELECT TRIM(LEADING 'a' FROM 'abcba')
FROM DUAL;

SELECT TRIM(TRAILING 'a' FROM 'abcba')
FROM DUAL;

SELECT TRIM(BOTH 'a' FROM 'abcba')
FROM DUAL;

SELECT REPLACE('JACK and JUE','J','BL')
FROM DUAL;

SELECT REPLACE(last_name,'a','*')
FROM employees limit 10;

USE sakila;

SELECT amount, ROUND(amount,1)
FROM payment
WHERE amount > 2;

SELECT amount, truncate(amount,1)
FROM payment
WHERE amount > 2;

SELECT amount, MOD(amount,2)
FROM payment;

SELECT MOD(4,2) FROM DUAL;

SELECT MOD(5,2) FROM DUAL;

SELECT CURDATE() as "Data Corrente do SGBD" FROM DUAL;

SELECT SYSDATE() as "Data do Sistema" FROM DUAL;

USE employees;

SELECT last_name, hire_date, DATE_ADD(hire_date, INTERVAL 180 DAY) as "Daqui a 6 meses (convertidos em dias)"
FROM employees limit 10;

SELECT last_name, hire_date, DATE_ADD(hire_date, INTERVAL 5 YEAR) as "Daqui a 5 anos"
FROM employees limit 10;

SELECT last_name, hire_date, (DATEDIFF(CURDATE(),hire_date)/365) "Quantos tempo o empregado possui de empresa"
FROM employees limit 10;

SELECT dayofweek(hire_date) 
FROM employees limit 10; 

SELECT NOW(), SLEEP(3), NOW() FROM DUAL;

SELECT SYSDATE(), SLEEP(3), SYSDATE() FROM DUAL;
