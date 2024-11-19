use sales;
create table managers(manager_id int, first_name varchar(50),last_name varchar(50),DOB date, age int,check(age>=18),gender varchar(30),department varchar(30) not null,salary int not null);

insert into managers(manager_id,first_name,last_name,DOB,age,gender,department,salary)values(1001,'rahina','banu','1998-03-25',28,'F','sales',28000),
(1002,'ruksnan','pathu','1998-09-23',26,'F','sales',27000),
(1003,'semeer','A','1997-03-26',27,'M','IT',30000),
(1004,'meera','reddy','1994-04-29',30,'F','IT',29000),
(1005,'himna','shyam','1995-04-26',29,'F','exporting',27000),
(1006,'jithin','sai','1990-05-28',34,'M','exporting',20000),
(1007,'athira','sidhi','1998-04-27',26,'F','IT',23000),
(1008,'sisira','dhanesh','1999-12-30',25,'F','sales',24000),
(1009,'ekha','A','2000-05-30',24,'F','Marketing',22000),
(1010,'Hazel','Mehwish','1998-09-29',26,'F','marketing',25000);
select * from managers;
select first_name,DOB from managers where manager_id=1002;
select * from managers where not(first_name='rahina');
select * from managers where department='IT' and salary>25000;
select first_name,(salary*12)as emp_annual_salary from managers;
select * from managers where salary between 26000 and 30000;