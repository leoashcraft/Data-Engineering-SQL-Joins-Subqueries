-- 1. List all customers who live in Texas (use JOINs)
select customer.customer_id, customer.first_name, customer.last_name 
from address
inner join customer on customer.address_id = address.address_id
where address.district = 'Texas'

/*
 * customer_id	first_name	ast_name 
 * 6			Jennifer	Davis
 * 118			Kim			Cruz
 * 305			Richard		Mccrary
 * 400			Bryan		Hardison
 * 561			Ian			Still
 * 
-----------------------------------------------------------------------------------------------*/

-- 2. Get all payments above $6.99 with the Customer's Full Name
select concat(first_name, ' ', last_name) as "full_name", payment.payment_id as p_id, payment.amount
from customer
inner join payment on customer.customer_id = payment.customer_id
where payment.amount > 6.99


/* 
 * full_name		p_id	amount		full_name	p_id	amount
 * Douglas Graf		22686	919.67		Peter Menard	20207	66.99
 * Mary Smith		22687	478.86		Peter Menard	20208	72.99
 * Alfredo Mcadams	22348	74.94		Peter Menard	26007	70.99
 * Mary Smith		28995	980.45		Peter Menard	26008	68.99
 * Peter Menard		17503	73.99		Peter Menard	26009	70.99
 * Peter Menard		17504	67.99		Peter Menard	26010	66.99
 * Peter Menard		17505	73.99		Peter Menard	26011	68.99
 * Peter Menard		17506	68.99		Peter Menard	26012	68.99
 * Peter Menard		17507	73.99		Peter Menard	26013	75.99
 * Peter Menard		17508	71.99
 * Peter Menard		20200	66.99
 * Peter Menard		20201	72.99
 * Alvin Deloach	18000	33.44
 * Peter Menard		20202	68.99
 * Peter Menard		20203	66.99
 * Peter Menard		20204	74.99
 * Peter Menard		20205	70.99
 * Peter Menard		20206	70.99
 * 
-----------------------------------------------------------------------------------------------*/			

-- 3. Show all customers names who have made payments over $175(use subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 175
)

/* 
 * customer_id	first_name	last_name
 * 1			Mary		Smith
 * 343			Douglas		Graf
 * 
-----------------------------------------------------------------------------------------------*/

-- 4. List all customers that live in Nepal (use the city table)
select customer_id, first_name, last_name
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
where city = 'Nepal'

/*
 * 0 – No results.
 * 
-----------------------------------------------------------------------------------------------*/

-- 5. Which staff member had the most transactions?
select staff.staff_id, staff.first_name, staff.last_name, count(payment.payment_id) as trans_count
from staff
inner join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by trans_count desc
limit 1

/*
 * staff_id	first_name	last_name	trans_count
 * 2		Jon			Stephens	7304
 * 
-----------------------------------------------------------------------------------------------*/

-- 6. How many movies of each rating are there?
select rating, count(film_id) as movie_count
from film
group by rating

/*
 * rating	movie_count
 * NC-17	209
 * G		178
 * PG-13	223
 * PG		194
 * R		196
 * 
-----------------------------------------------------------------------------------------------*/

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
)

/*
 * customer_id	first_name	last_name
 * 1			Mary		Smith
 * 341			Peter		Menard
 * 343			Douglas		Graf
 * 467			Alvin		Deloach
 * 567			Alfredo		Mcadams
 * 
-----------------------------------------------------------------------------------------------*/

-- 8. How many free rentals did our stores give away?
select count(amount) as free_rentals
from payment
where amount < 0

/*
 * free_rentals
 * 14,569
 * 
-----------------------------------------------------------------------------------------------*/