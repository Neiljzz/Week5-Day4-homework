--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

select *
from film f 

create or replace procedure add_film(title varchar(255), 
							description varchar(255), 
							release_year int, 
							language_id int, 
							rental_duration int, 
							rental_year decimal(4,2), 
							length int, 
							replacement_cost decimal(5,2),
							rating varchar(10)
							)
language plpgspl
as $$
begin
	insert into film(title, description, release_year, language_id, rental_duration, rental_rate, length,
					 replacement_cost, rating)
	values (title, description, release_year, language_id, rental_duration, rental_rate, length,
					 replacement_cost, rating)
end;
$$

--2. Create a Stored Function that will take in a category_id and return the number of films in that category

create or replace function get_film_count_by_category(category_id int)
returns int
as $$
declare
    film_count int;
begin
    select count(*) into film_count
    from film_category
    where category_id = get_film_count_by_category.category_id;
    
    return film_count;
end;
$$ language plpgsql;


