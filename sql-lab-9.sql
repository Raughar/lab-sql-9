use sakila;

-- Creting the table rental_may and adding the data from the table rentals for the month of may:
create table rentals_may like rental;

insert into rentals_may
select *
from rental
where month(rental_date) = 5;

select * from rentals_may;

-- Creating the table rentals_june and filling it with the data from rentals for the month of june:
create table rentals_june like rental;

insert into rentals_june
select *
from rental
where month(rental_date) = 6;

select * from rentals_june;

-- Getting the number of rentals for each customer in may:
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, count(rm.rental_id) as num_rentals_may
from rentals_may rm
join customer c on rm.customer_id = c.customer_id
group by rm.customer_id;

-- Getting the number of rentals for each customer in june:
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, count(rj.rental_id) as num_rentals_june
from rentals_june rj
join customer c on rj.customer_id = c.customer_id
group by rj.customer_id;