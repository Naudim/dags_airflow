/*Problema 1*/
/*a)*/ SELECT category_id  FROM film_category;
/*b)*/ SELECT payment_id, rental_id, amount, payment_date  FROM payment;
/*c)*/ SELECT * FROM address WHERE district in ('Georgia', 'Tete', 'Gois'); 
/*d)*/ SELECT actor_id, last_name  FROM actor WHERE first_name like ('J%');

/*Problema 2*/
/*a)*/ SELECT amount, amount + (amount * 0.02) as multa FROM payment;
/*b)*/ SELECT * FROM city where city like ('%ana%');
/*c)*/ SELECT * FROM country where country like ('r%a');
/*d)*/ SELECT * FROM film where description like ('%feminist%');
/*e)*/ SELECT * FROM rental where customer_id between 100 and 300;
/*f)*/ SELECT * FROM staff where password is null;

/*Problema 3*/ 

create table `payment_copy` (
  `payment_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `fk_payment_rental` (`rental_id`),
  CONSTRAINT `fk_payment_copy_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_copy_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_copy_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into payment_copy select * from payment;

create table `film_actor_copy` (
  `actor_id` smallint unsigned NOT NULL,
  `film_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`,`film_id`),
  KEY `idx_fk_film_id` (`film_id`),
  CONSTRAINT `fk_film_actor_copy_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_copy_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into film_actor_copy select * from film_actor;

/*a)*/ update payment_copy set amount = 19.99 where payment_id in (select payment_id from payment where amount < 1.99);
/*b)*/ select * from payment_copy where amount between 6.00 and 10.00;
/*c)*/ select film_actor_copy.actor_id, film_actor_copy.film_id, film.title from film_actor_copy left join film on film_actor_copy.film_id = film.film_id where actor_id = 36;
/*d)*/ update film_actor_copy set actor_id = 44  where actor_id = 36 and film_id <> 875;