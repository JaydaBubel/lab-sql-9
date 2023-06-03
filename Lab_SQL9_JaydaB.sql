-- Create a table rentals_may to store the data from rental table with information for the month of May.
use sakila;
create table mayrentals (
    rental_date date,
    return_date date
);
select * from mayrentals;

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
-- *I changed name to "mayrentals", as error returned that rentals_may already existed somewhere (and i was nervous to drop it)*
insert into mayrentals (rental_date, return_date)
select rental_date, return_date
from rental
where month(rental_date) = 5;
select * from mayrentals;

-- Create a table rentals_june to store the data from rental table with information for the month of June.

create table junerentals (
    rental_date date,
    return_date date
);
select * from junerentals;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into junerentals (rental_date, return_date)
select rental_date, return_date
from rental
where month(rental_date) = 6;
select * from junerentals;

-- Check the number of rentals for each customer for May.

select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, count(*) as rental_count
from customer c
join rental r on c.customer_id = r.customer_id
where month(r.rental_date) = 5
group by c.customer_id, customer_name;


-- Check the number of rentals for each customer for June.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, count(*) as rental_count
from customer c
join rental r on c.customer_id = r.customer_id
where month(r.rental_date) = 6
group by c.customer_id, customer_name;