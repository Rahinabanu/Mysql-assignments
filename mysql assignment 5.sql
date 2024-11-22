use population;
create table country(id int primary key not null,country_name varchar(50),population int,area varchar(50));
create table persons(id int, fname varchar(50),lname varchar(50),population int,rating float,country_id int,foreign key(country_id)
references country(id),country_name varchar(50));
insert into country(id,country_name,population,area)values(1001,'america',2000000,'3.4 million km sqr'),
(1002,'china',3500000,'4.4 million km sqr'),
(1003,'india',2500000,'4.2 million km sqr'),
(1004,'japan',100000,'3.1 million km sqr'),
(1005,'australia',1500000,'3.9 million km sqr'),
(1006,'nepal',2000000,'3.7 million km sqr'),
(1007,'bhutan',1200000,'2.7 million km sqr'),
(1008,'pakisthan',2700000,'4.7 million km sqr'),
(1009,'afganisthan',2900000,'3.95 million km sqr'),
(1010,'canada',3600000,'4.2 million km sqr');
select * from country;
insert into persons(id,fname,lname,population,rating,country_id,country_name)values(001,'rahina','banu',2000000,3.4,1001,'america'),
(002,'shimna','shyam',3500000,4.4,1002,'china'),
(003,'semeer','A',2500000,3.1,1003,'india'),
(004,'athira','jithin',100000,3.9,1004,'japan'),
(005,'shyam','sidhi',1500000,4.1,1005,'australia'),
(006,'rahal','v',2000000,3.8,1006,'nepal'),
(007,'aswathi','banu',1200000,3.4,1007,'bhutan'),
(008,'rahi','balu',2700000,4.4,1008,'pakisthan'),
(009,'sushma','dhanush',2900000,3.4,1009,'afganisthan'),
(010,'renu','paru',3600000,3.8,1010,'canada');
select substring(country_name,1,3) as country_name_first_three_charecters from country;
select concat(fname,' ',lname) as full_name from persons;
select count(distinct country_name) from persons;
select max(population) from country;
select min(population) from persons;
insert into persons(id,lname,population,rating,country_id,country_name)values(012,'dhanush',2600000,3.1,1009,'afganisthan'),
(013,'aswathi',1900000,4.4,1007,'bhutan');
select * from persons;
select count(fname) from persons;
select count(id) as number_of_rows from persons;
select population from country limit 3;
select * from country order by rand() limit 3;
select fname from persons order by rating desc;
select sum(population) from persons;
select country_name from persons where population>50000;
select country_name,avg(rating)as avr_rating from persons group by country_name having count(country_name)>1;

