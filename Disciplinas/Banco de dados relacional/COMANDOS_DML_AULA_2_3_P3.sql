UPDATE film_actor 
SET  actor_id = (SELECT actor_id
							FROM actor 
                            WHERE last_name = 'PFEIFFER'),
     film_id = 1000                       
WHERE actor_id = (SELECT actor_id
							FROM actor 
                            WHERE last_name = 'PESCI')
AND film_id IN ( SELECT film_id
					   FROM film
					   WHERE film_id BETWEEN 200 and 220)  ;    
                       
                       
SELECT actor_id, first_name, last_name 
FROM actor 
where last_name = 'PHOENIX' 
FOR UPDATE; 
COMMIT;


DELETE 
FROM film_actor
WHERE actor_id = (SELECT actor_id
							FROM actor 
                            WHERE last_name = 'PESCI')
AND film_id IN ( SELECT film_id
					   FROM film
					   WHERE film_id BETWEEN 200 and 220)  ;
                       
                       
                       
SELECT SYSDATE() FROM DUAL;     

INSERT INTO actor (actor_id, first_name, last_name,last_update) 
VALUES      (DEFAULT ,'AUGUSTO'  , 'ZADRA', DEFAULT);

UPDATE actor SET first_name = 'AUGUSTO', last_name = 'NOGUERIA ZADRA', last_update = DEFAULT 
WHERE first_name = 'AUGUSTO' AND last_name = 'ZADRA';                  