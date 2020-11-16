USE sakila;

# What is the most popular day of rental?
select count(day(rental_date)), dayname(rental_date)
from rental
group by dayname(rental_date)
order by count(day(rental_date)) desc;

# Avg  day rent movie
select r.rental_id,date(r.return_date), date(r.rental_date),timestampdiff(day,r.rental_date,r.return_date)+1 AS "Number_days_of_rent",
		avg(timestampdiff(day,r.rental_date,r.return_date)+1) over() AS "AVG day", p.amount
from rental r join payment p on r.rental_id=p.rental_id
limit 50; 

# Movie by actor 
select fa.film_id, fa.actor_id,count(r.rental_id) as "Number of rent", c.name
from rental r join inventory i on i.inventory_id=r.inventory_id
join film_actor fa on i.film_id=fa.film_id
join film_category fc on fc.film_id=fa.film_id
join category c on c.category_id=fc.category_id 
group by fa.film_id,fa.actor_id
order by count(r.rental_id) desc;

# Sales by movie
select fa.film_id , sum(p.amount)  AS "Total"
from rental r join inventory i on i.inventory_id=r.inventory_id
join film_actor fa on i.film_id=fa.film_id
join payment p on p.rental_id=r.rental_id 
group by  fa.film_id
order by sum(p.amount) desc;

# Sales by actor 
select fa.actor_id, a.first_name, a.last_name, count(r.rental_id) as "Number of rent"
from rental r join inventory i on i.inventory_id=r.inventory_id
join film_actor fa on i.film_id=fa.film_id
join actor a on fa.actor_id=a.actor_id
group by fa.actor_id
order by count(r.rental_id) desc;

# Popular category
select fc.category_id, c.name, count(r.rental_id) as "Number of rent"
from rental r join inventory i on i.inventory_id=r.inventory_id
join film_category fc on i.film_id=fc.film_id
join category c on c.category_id= fc.category_id
group by fc.category_id
order by count(r.rental_id) desc;

# List of category
select distinct(fc.category_id)
from  rental r join inventory i on i.inventory_id=r.inventory_id
join film_category fc on i.film_id=fc.film_id
join category c on fc.category_id= c.category_id
group by   fc.category_id, fc.film_id
having  count(r.rental_id)>=30;

# Category by country
select  c.country,count(cu.customer_id), fc.category_id, ca.name
from address a join customer cu on a.address_id=cu.address_id
join city ci on a.city_id= ci.city_id
join country c on c.country_id= ci.country_id
join rental r on  cu.customer_id=r.customer_id
join inventory i on r.inventory_id=i.inventory_id
join film_category fc on fc.film_id=i.film_id 
join category ca on fc.category_id=ca.category_id
group by fc.category_id, c.country
order by count(cu.customer_id) desc;


drop procedure if exists category_country;


delimiter $$
create procedure category_country(IN ca_num1 float,IN ca_num2 float)
begin
select
c.country, count(cu.customer_id), fc.category_id
from
address a join customer cu on a.address_id=cu.address_id
join city ci on a.city_id= ci.city_id
join country c on c.country_id= ci.country_id
join rental r on  cu.customer_id=r.customer_id
join inventory i on r.inventory_id = i.inventory_id  
join film_category fc on i.film_id = fc.film_id   
where fc.category_id = ca_num1 or fc.category_id = ca_num2
group by c.country ;
end $$

DELIMITER ; 
 CALL category_country(16,10);
 
 # Number of category
 select c.name, c.category_id, count(film_id) as "Number"
 from category c join film_category fc on c.category_id=fc.category_id
 group by c.name
 order by count(fc.film_id) desc;
 
# How many movies per customer
select customer_id,
count(customer_id) as "number of rental"
from rental
group by customer_id;