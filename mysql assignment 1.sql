create database school;
use school;
create table student(
Roll_number int auto_increment primary key,
Student_name varchar(50) not null,
Mark int(15),
Grade varchar(10)
);

desc student;
insert into student(Roll_number,Student_name,Mark,Grade) values(1,'Rasiya',95,'A'),(2,'jenny',85,'B'),(3,'Hazel',65,'C'),(4,'shimna',90,'A'),(5,'semeer',75,'C');
alter table student add Contact_number int(10) not null;
alter table student drop column Contact_name;
alter table student add Contact_number int(10) not null;
alter table student drop column Grade;
alter table student rename classten;
truncate classten;
select * from classten;
drop table classten;



