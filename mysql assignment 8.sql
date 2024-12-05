use population;
SELECT COUNT(fname), country_name
FROM persons
GROUP BY Country_name;


select country_name,avg(rating)as avr_rating from persons where(select avg(rating)>3) group by country_name ;



SELECT COUNT(fname), country_name
FROM persons
GROUP BY Country_name
ORDER BY COUNT(fname) DESC;

SELECT country_name from persons where (select country_name,rating from persons where avgrating>3 group by country_name);




select country_name from persons where rating=(select rating from persons where country_name='america');

select country_name,population from country where population >(select avg(population) from country);

create database product;
use product;
create table customer(c_id int primary key not null,fname varchar(50),lname varchar(50),email varchar(120),ph_no int,address varchar(150),city varchar(70),state varchar(70),zip_code int,country varchar(150));
insert into customer(c_id,fname,lname,email,ph_no,address,city,state,zip_code,country) values(001,'farsana','sherin','farsana@gamil.com',46373829,'odungadan house','areekode','kerala',673639,'india'),
(002,'farsan','serin','farsan@gamil.com',463673829,'chungadan house','kozhikode','kerala',678639,'india'),
(003,'shyam','lal','shymalal@gamil.com',47873829,'mundan house','nilambur','kerala',675639,'india'),
(004,'shimna','shyam','shimna@gamil.com',46453829,'alikkal house','manjeri','kerala',672439,'india'),
(005,'semeer','sha','semeer@gamil.com',46773829,'mundanparambil house','payyannur','kerala',673678,'india'),
(006,'athira','s','athira@gamil.com',46173829,'nv house','vin','occalahoma',103639,'usa');







CREATE VIEW customer_info AS  
SELECT concat(fname,' ',lname)as full_name,email from customer;

select * from customer_info;

create view us_customer as select fname from customer where country='usa';

select * from us_customer;

create view customer_details as select concat(fname,' ',lname)as full_name,email,ph_no,state from customer;

select * from customer_details;

update customer_details set ph_no=2537382 where state='kerala';

select state,count(fname)as nmbrofperson from customer group by state having count(fname)>4;

select state,count(full_name)as nmbrofperson from customer_details group by state;

select * from customer_details  order by state asc;
