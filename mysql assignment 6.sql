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

select c.area,c.population,p.rating from country c inner join persons p on c.id=p.country_id;
select c.population,p.country_name,p.rating from country c left join persons p on c.id=p.country_id;
select c.population,p.country_name,p.rating from country c right join persons p on c.id=p.country_id;
select distinct country_name as c_name from country
union
select distinct country_name as c_name from persons;
select country_name as all_countries from country
union all select country_name as all_countries from persons;
select round(rating) from persons;