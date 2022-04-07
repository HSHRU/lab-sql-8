use sakila;

-- 1. Write a query to display for each store its store ID, city, and country.

select store_id, city, country
from store
join address
using(address_id)
join city
using(city_id)
join country
using(country_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.

select store.store_id, sum(amount) as 'Revenue'
from store
join staff
on store.manager_staff_id = staff_id
join payment
using(staff_id)
group by store.store_id;

-- 3. Which film categories are longest?

select c.name, round(avg(length),0) as 'Avg_length'
from film f
join film_category fc
using(film_id)
join category c
using(category_id)
group by c.name
order by avg(length) desc;

-- 4. Display the most frequently rented movies in descending order.

select title, count(*) as 'rented_in_times'
from rental r
join inventory i using(inventory_id)
join film f using(film_id)
group by film_id
order by count(*) desc;

-- 5. List the top five genres in gross revenue in descending order.

select name, sum(amount) as 'Revenue'
from payment p
join rental r using(rental_id)
join inventory i using (inventory_id)
join film f using (film_id)
join film_category fc using (film_id)
join category c using(category_id)
group by category_id
order by sum(amount) desc
limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?

select *
from film f
join inventory i using(film_id)
where f.title = 'Academy Dinosaur' and i.store_id = 1;

-- 7. Get all pairs of actors that worked together.

select a1.first_name, a1.last_name, a2.first_name, a2.last_name
from film_actor f1
left join film_actor f2 using(film_id)
join actor a1 on f1.actor_id = a1.actor_id
join actor a2 on f2.actor_id = a2.actor_id
where f1.actor_id != f2.actor_id
order by f1.actor_id;

-- 8. Get all apirs of customers that rented the same film more than 3 times

SELECT customer_id, film_id, COUNT(*) as rented
FROM rental r1
LEFT JOIN inventory i1 USING(inventory_id)
GROUP BY i1.film_id
HAVING COUNT(*) > 3
ORDER BY r1.customer_id; -- i.film_id;

# 8 is still yet be solved


-- 9. For each film, list actor that has acted in more films.


select title, actor_id, first_name, last_name
from film f
join film_actor fa using(film_id)
join actor a using(actor_id)
order by title;
 
# 9 is still yet be solved