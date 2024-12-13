create database workers;
use workers;
create table worker(worker_id int,first_name char(25),last_name char(25),salary int(15),joiningdate datetime,department char(25));
insert into worker(worker_id,first_name,last_name,salary,joiningdate,department)values(001,'shoba','kumar',27000,'2012-02-23','sales'),
(002,'shopika','manoj',29000,'2016-06-23','sales'),
(003,'shibu','kalyani',37000,'2015-06-28','marketing'),
(004,'athira','jithin',25000,'2020-06-20','marketing'),
(005,'sisira','dhanesh',22000,'2019-02-23','accounts');
select * from worker;

delimiter //

create procedure getinfo(in wid int,in fname varchar(25),in lname varchar(25),in wsalary int(15),in jdate datetime,in wdepartment char(25))

begin
insert into worker(worker_id,first_name,last_name,salary,joiningdate,department)values(wid,fname,lname,wsalary,jdate,wdepartment);
end//

delimiter ;


call getinfo(6,'anshila','suhail',22000,'2020-03-23','finance');

delimiter //

create procedure idinfo(in wid int,out wsalary int(15))

begin
select count(*) into wsalary from worker where worker_id=wid;
end//

delimiter ;


call idinfo(001, @wsalary);

delimiter //

create procedure depinfo(in wid int,in wdepartment char(25))

begin
update worker set department=wdepartment where worker_id=wid;
end//

delimiter ;

call depinfo(1,'managment');

delimiter //

create procedure countinfo(in wdepartment char(25),out p_workercount int(15))

begin
select wdepartment,count(first_name) as p_workercount from worker where department=wdepartment ;
end//

delimiter ;

call countinfo('managment',@p_workercount);


delimiter //

create procedure avg_salary(in wdepartment char(25),out wsalary int(15))

begin
select wdepartment,avg(salary) as average_salary from worker where department=wdepartment ;
end//

delimiter ;

call avg_salary('marketing',@wsalary);