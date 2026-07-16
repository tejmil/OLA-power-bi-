create database Ola;
use ola;
select * from bookings;


create view successful AS
select * from bookings 
where Booking_status = "success";
select * from successful ;

create view ride_distance_for_each_vehicle as
select vehicle_type , avg(ride_distance)
as avg_distance from bookings 
group by vehicle_type;
select * from ride_distance_for_each_vehicle;

create view canceled_by_customer as
select count(*) from bookings where booking_status = "canceled by customer";

create view total_rides_5 as
select customer_id , count(booking_id) as total_rides
from bookings 
group by customer_id
order by total_rides desc limit 5;

create view canceled_ride_by_driver as
select count(*) from bookings
where canceled_rides_by_driver = "personal & car related issue";
select * from canceled_ride_by_driver;

create view minmax_rating_primesudan as
select max(customer_rating) as max_rating,
min(customer_rating) as min_rating
from bookings
where vehicle_type = "prime sedan";

create view payment_by_upi as
select * from bookings
where payment_method = "upi";