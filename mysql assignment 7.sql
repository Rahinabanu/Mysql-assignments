use population;
create table country(id int primary key not null,country_name varchar(50),population int,area varchar(50));
create table persons(id int, fname varchar(50),lname varchar(50),population int,rating float,country_id int,foreign key(country_id)
references country(id),country_name varchar(50));
drop table persons;
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
select * from persons;

update persons set dob='1998-12-23' where id=1;
update persons set dob='1996-04-12' where id=2;
update persons set dob='1992-01-16' where id=3;
update persons set dob='1998-07-12' where id=4;
update persons set dob='1994-05-12' where id=5;
update persons set dob='1992-05-12' where id=6;
update persons set dob='1997-05-12' where id=7;
update persons set dob='1993-02-12' where id=8;
update persons set dob='1998-12-01' where id=9;
update persons set dob='1998-05-18' where id=10;

delimiter //

create function age(dob date)
returns int
deterministic
begin
return DATEDIFF(CURDATE(), dob) DIV 365;
end//

delimiter ;

select fname,age(dob) as age from persons;

delimiter //

create function countrynamelength(country_name varchar(50))
returns int 
deterministic
begin
return length(country_name);
end//

delimiter ;
select country_name, countrynamelength(country_name) as namelength from country;

delimiter //

create function firstthreeletters(country_name varchar(50))
returns varchar(50)
deterministic
begin
return substring(country_name,1,3);
end//

delimiter ;


select  country_name,firstthreeletters(country_name) as fst_three_ltr from country;

delimiter //

create function converttouppercase(country_name varchar(50))
returns varchar(50)
deterministic
begin
return ucase(country_name);
end//

delimiter ;


select country_name,converttouppercase(country_name) as uc_countryname from country;

delimiter //

create function converttolowercase(country_name varchar(50))
returns varchar(50)
deterministic
begin
return lcase(country_name);
end//

delimiter ;


