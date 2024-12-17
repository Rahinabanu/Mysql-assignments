use population;
create table teachers(id int primary key not null,name varchar (50),subject varchar(50),experience float,salary int);
insert into teachers(id,name,subject,experience,salary)values(1,'chetan','maths',7.5,30000),
(2,'reshmika','computer science',5,35000),
(3,'rahina','biology',4,40000),
(4,'shimna','zoology',12,50000),
(5,'aradhya','english',12,48000),
(6,'sisira','GK',9,32000),
(7,'semeer','PT',6,45000),
(8,'jithin','malayalam',8,37000);


delimiter $$
create trigger before_insert_teacher
before insert on teachers for each row
begin
if new.salary<0 then
signal sqlstate '45000' set message_text='salary cannott be sa negative value';
end if;
end$$
delimiter ;

insert into teachers(id,name,subject,experience,salary)value(9,'dhanesh','economics',9,-24);
drop table teachers;
delimiter $$
create trigger before_delete_teacher
before delete on teachers for each row
begin
if old.experience>10 then
signal sqlstate '45000' set message_text='you cannot delete this data';
end if;
end$$
delimiter ;

delete from teachers where id=4;

select * from teachers;

create table teachers_log (teachers_id int,foreign key(teachers_id)
references teachers(id),actions varchar(50),t_timestamp time);

delimiter $$
create trigger after_insert_teacher
after insert on teachers for each row
begin

insert into teachers_log(teachers_id,actions,t_timestamp)values(new.id,'new value added',current_time());

end$$
delimiter ;
drop trigger after_insert_teacher;
insert into teachers(id,name,subject,experience,salary)values(12,'dhanesh','arabic',13,25000);
select * from teachers_log;



create table teacher_log(t_id int,T_action varchar (50),action_time time);


delimiter $$
create trigger after_delete_teacher
after delete on teachers for each row
begin

insert into teacher_log(t_id,T_action,action_time)values(old.id,'new value added',current_time());

end$$
delimiter ;

delete from teachers where id=8;
select * from teacher_log;