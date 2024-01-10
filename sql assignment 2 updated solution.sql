use mavenmovies;

#1.retrieve the total no of rentals .

select count(rental_id) from rental;

#2. find the avg rental duration in days of movies rented.alter

select avg(rental_duration) from film;

#3. display first name and last name of customer in uppercase.

select upper(first_name) ,upper(last_name)from customer;

#4. extract the month from rental date and display it alongside the rental Id.

select rental_id, month(rental_date)from rental;

#5. retrieve the count of rentals for each customer (display customer id and count of rentals)

select c.customer_id,count( r.rental_id) as count from customer c inner join rental r on c.customer_id=r.customer_id group by customer_id;

#6.find total revenue generated by each store.
 
 select sum(p.amount),c.store_id from payment p inner join customer c on p.customer_id=c.customer_id group by c.store_id;
 
 #7.display title of movie,customer's first name,last name who rented it.
 
 select f.title, c.first_name,c.last_name from film f inner join inventory i on f.film_id=i.film_id inner join rental r on i.inventory_id=r.inventory_id inner join customer c on r.customer_id=c.customer_id;

#8. retrieve the names of all actors who have appeared in the film "gone with the wind'.

select f.title,a.first_name,a.last_name from actor a inner join film_actor fa on a.actor_id =fa.actor_id inner join film f on fa.film_id=f.film_id where f.title="gone with the wind";

#9.determine the total no of rentals for each category of movies.

select sum(f.rental_rate) , fc.category_id from film  f inner join film_category fc on f.film_id=fc.film_id group by fc.category_id;

#10.find the avg rental rate of movies in each language.

select avg(f.rental_rate), l.language_id from film f inner join language l on f.language_id=l.language_id group by l.language_id;

#11. retrieve the customer names along with the total amount they have spent on rentals.

select first_name , last_name,sum(p.amount) from customer c inner join rental r on c.customer_id=r.customer_id inner join payment p on r.rental_id =p.rental_id group by r.rental_id;

#12.list the title of movies rented by each customer in a particulart city(eg london).

select f.title,c.customer_id,ci.city from film as f inner join inventory  as i on f.film_id=i.film_id 
inner join rental  as r on i.inventory_id=r.inventory_id inner join customer c on r.customer_id=c.customer_id 
inner join address as a on c.address_id=a.address_id inner join city as ci
on a.city_id=ci.city_id where ci.city='london' group by c.customer_id, f.title;


#13.display the top 5 rented movies along with the no of times they have been rented.

select f.title, count(r.rental_id) from film as f inner join inventory as i
 on f.film_id=i.film_id inner join rental as r on i.inventory_id=r.inventory_id group by f.film_id  limit 5;


# 14..determine the customers who have rented movies from both stores.

select concat(first_name," ",last_name),c.store_id from rental as r inner join customer  as c on r.customer_id=c.customer_id 
inner join inventory as i on c.store_id=i.store_id where c.store_id in (1,2) group by c.customer_id having count(distinct(r.rental_id));