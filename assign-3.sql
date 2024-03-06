--List all customers who live in Texas

select customer.first_name , customer.last_name , district
from customer 
inner join address 
on customer.address_id  = address.address_id
where district = 'Texas'

--Get all payments above $6.99 with the Customer's Full

select customer.first_name , customer.last_name , amount
from customer 
inner join payment 
on customer.customer_id = payment.customer_id  
where amount > 6.99

--Show all customers names who have made payments over $175(use

select store_id , first_name, last_name
from customer
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id
	having sum(amount)>175
	order by sum(amount) desc 
)

group by store_id, first_name, last_name;

--4. List all customers that live in Nepal

select customer.first_name , customer.last_name , country
from customer 
inner join address 
on customer.address_id  = address.address_id 
inner join city 
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Nepal'

--Which staff member had the most transactions?

select staff.first_name , staff.last_name , count(payment.staff_id)
from staff 
inner join payment 
on staff.staff_id = payment.staff_id 
group by staff.first_name , staff.last_name 
order by count(payment.staff_id) desc

--How many movies of each rating are there?

select rating , count(rating)
from film 
group by rating

--7.Show all customers who have made a single payment above $6.99

select customer.first_name , customer.last_name 
from customer 
where  customer_id  in(
	select customer_id 
	from payment 
	where amount > 6.99
	group by customer_id 

)

--How many free rentals did our store give away?

select count(amount) from payment p 
where amount = 0 
