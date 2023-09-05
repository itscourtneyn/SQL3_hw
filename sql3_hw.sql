--1. List all customers who live in Texas (use JOINs)
select * from address

select customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name


select customer.first_name, customer.last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99
	
	
--3. Show all customers names who have made payments over $175(use subqueries)
select customer.first_name, customer.last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount in (
	select amount
	from payment
	group by amount
	having sum(amount) > 175
	order by sum(amount) desc);


--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, country
from customer
full join address 
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';


--5. Which staff member had the most transactions?
select * from payment

select payment.staff_id, count(payment.staff_id), first_name, last_name
from payment
full join staff
on payment.staff_id = staff.staff_id
group by payment.staff_id, first_name, last_name
order by count(payment.staff_id) desc 
--Jon had the most transactions with 7,304 total.

--6. How many movies of each rating are there?
select rating, count(distinct rating)
from film 
group by rating 
-- one of each

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer.first_name, customer.last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount in (
	select amount
	from payment
	group by amount
	having amount > 6.99
	order by amount desc);

--8. How many free rentals did our stores give away?
select customer.first_name, customer.last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount in (
	select amount
	from payment
	group by amount
	having amount = 0);
-- none 