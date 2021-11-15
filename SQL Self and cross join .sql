
use sakila;

#Get all pairs of actors that worked together.

select f1.actor_id, f2.actor_id, f1.film_id from film_actor f1
join film_actor f2
on f1.actor_id <> f2.actor_id 
and f1.film_id = f2.film_id
order by f1.film_id, f1.actor_id;

#Get all pairs of customers that have rented the same film more than 3 times.

select c1.customer_id, c2.customer_id, count(*) as num_films
from sakila.customer c1
inner join rental r1 on r1.customer_id = c1.customer_id
inner join inventory i1 on r1.inventory_id = i1.inventory_id
inner join film f1 on i1.film_id = f1.film_id
inner join inventory i2 on i2.film_id = f1.film_id
inner join rental r2 on r2.inventory_id = i2.inventory_id
inner join customer c2 on r2.customer_id = c2.customer_id
where c1.customer_id <> c2.customer_id
group by c1.customer_id, c2.customer_id
having count(*) > 3
order by num_films desc;

#Get all possible pairs of actors and films

select distinct actor_id from actor;
select distinct film_id from film_actor;

select * from (
  select distinct actor_id as a1 from actor
) sub1
cross join (
select actor_id as a2 from actor 
)sub2
cross join (
  select distinct film_id from film_actor
) sub3;









