USE sakila;

SELECT actor_id, last_name
FROM actor
WHERE first_name like 'J%';

SELECT * FROM country;
SELECT country_id,country,last_update FROM country;
SELECT country_id,country FROM country;

SELECT payment_id, rental_id, amount+200 
FROM payment;

SELECT payment_id, payment_date, amount, 30*amount+100
FROM payment;

SELECT payment_id, payment_date, amount, 30*(amount+100)
FROM payment;

SELECT payment_id, payment_date, 
       amount, 30*amount "Valor para um mês "
FROM payment;

SELECT payment_id, payment_date, 
       amount, 30*(amount+100) as "Valor para um mês com multa"
FROM payment;

desc payment;

describe payment;

SELECT first_name, last_name, 
       CONCAT_WS('  ', first_name, last_name) as "Nome Completo"
FROM actor;

SELECT category_id 
FROM film_category
order by film_id;

SELECT payment_id, rental_id, amount, payment_date 
FROM payment 
WHERE amount BETWEEN 3 AND 5;

SELECT * 
FROM address
WHERE district IN ('Georgia', 'Tete', 'Gois') ; 


CREATE TABLE customer_copy (
  customer_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  store_id TINYINT UNSIGNED NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  address_id SMALLINT UNSIGNED NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  create_date DATETIME NOT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (customer_id),
  KEY idx_fk_store_id (store_id),
  KEY idx_fk_address_id (address_id),
  KEY idx_last_name (last_name),
  CONSTRAINT fk_customer_copy_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_customer_copy_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO customer_copy (customer_id, store_id, first_name, last_name, email, 
						   address_id, active, create_date, last_update) 
select * from customer;


update customer_copy set address_id = 602 where first_name = 'AUGUSTO' 
