create database library;

use library;

create table branch(branch_no int primary key not null,manager_id int,branch_address varchar (150),contact_number int);
insert into branch(branch_no,manager_id,branch_address,contact_number)values(001,1,'vettilappara po,areekode',64645373),
(002,2,'akampadam po,eranchimangad',65767677),(003,3,'nilambur po,nilambur',6746373),(004,4,'edavanna po,edvanna',6473838),
(005,5,'mukkam po,mukkam',6474746);

create table employee(emp_id int primary key not null,emp_name varchar(50),position varchar(35),salary int,branch_no int,foreign key(branch_no)references branch(branch_no));
insert into employee(emp_id,emp_name,position,salary,branch_no)values(101,'radheesh','c level',28000,001),(102,'reshma','D level',25000,002),(103,'sisira','B level',30000,003),(104,'semeer','B level',32000,004),(105,'dhanesh','D level',23000,005);
insert into employee(emp_id,emp_name,position,salary,branch_no)values(106,'raghu','c level',28000,001),(107,'radhu','c level',28000,001),(108,'chanthu','c level',28000,001),(109,'chinnu','c level',28000,001);
insert into employee(emp_id,emp_name,position,salary,branch_no)values(110,'rahina','manager',28000,002);

create table books(ISBN int primary key not null,book_title varchar(150),category varchar(35),rental_price int,status varchar(15),author varchar(50),publisher varchar (150));
insert into books(ISBN,book_title,category,rental_price,author,status,publisher)values(201,'once upon a time','short story',50,'M manoj','yes','Dc books'),(202,'pathummayude aadu','novel',60,'vaikkam muhammed  basheer','Yes','bc books'),(203,'oru dheshthinte kadha','novel',70,'s.k pottakkad','no','pavizham'),(204,'mantharam','poetry',60,'janaky','yes','bc books'),(205,'neermadhalam pootha kaalam','poetry',85,'madhavikkutty','no','shakthi books');
insert into books(ISBN,book_title,category,rental_price,author,status,publisher)values(208,'jalian vaala baagh','history',50,'A K mishra','yes','Dc books');

create table customer(customer_id int primary key not null,customer_name varchar(50),customer_address varchar(150),reg_date date);
insert into customer(customer_id,customer_name,customer_address,reg_date)values(301,'shobana','odungadan(h),vettilappara po','2020-09-24'),
(302,'divya','oppan(h),edavanna po','2021-03-29'),(303,'leela','alikkal(h),akampadam po','2010-01-22'),(304,'sheeja','kuniyil(h),kuttooli po','2019-09-24'),(305,'siddhi','thunchath(h),areekode po','2023-09-24');

select * from books;

create table issue_status(issue_id int primary key not null,issued_cust int,foreign key(issued_cust)references customer(customer_id),issued_book_name varchar(150),issue_date date);
insert into issue_status(issue_id,issued_cust,issued_book_name,issue_date)values(401,301,'once upon a time','2024-04-23'),
(402,302,'pathummayude aadu','2024-05-23'),(403,303,'oru dheshathinte kadha','2024-06-23'),(404,304,'manthram','2024-07-23'),(405,305,'neermadhalam poothakaalam','2024-10-23');
insert into books(ISBN,book_title,category,rental_price,author,status,publisher)values(211,'once upon a time in indian history','history',50,'Mathew','yes','Dc books');

create table returnstatus(return_id int primary key not null,return_cust varchar(50),return_book_name varchar(150),return_date date,isbn_book2 int,foreign key(isbn_book2)references books(ISBN));

insert into returnstatus(return_id,return_cust,return_book_name,return_date,isbn_book2)values
(601,'shobana','once upon atime','2024-12-01',201),(602,'divya','paathummayude aadu','2024-12-02',202),(603,'sheeja','mathram','2024-12-05',204);


select * from issue_status;

## 1
select book_title,category,rental_price from books where status='yes';

##2
select emp_name,salary from employee order by salary desc;

##3
select customer.customer_name,issued_book_name from customer,issue_status where customer.customer_id=issue_status.issued_cust;

##4
select category,count(book_title)from books group by category;

##5
select  emp_name,position from employee where salary>30000;

##6
select customer.customer_name from customer join issue_status on (customer.customer_id=issue_status.issued_cust)and reg_date< '2022-01-01';

##7
select branch_no,count(emp_name)from employee  group by branch_no;

##8
SELECT c.customer_name,i.issued_cust
FROM   customer c 
JOIN   issue_status i ON c.customer_id = i.issued_cust
WHERE  month(issue_date)=06 and year(issue_date)=2024;

##9
select book_title from books where book_title like '%history%';

##10
select branch_no,count(emp_name)from employee  group by branch_no having count(emp_name)>4;

##11
SELECT e.emp_name,b.branch_address
FROM   employee e 
JOIN   branch b ON e.branch_no = b.branch_no
WHERE position='manager';



##12
SELECT 
customer.customer_name

FROM 
    customer
INNER JOIN issue_status ON customer.customer_id = issue_status.issued_cust
INNER JOIN books ON books.book_title = issue_status.issued_book_name

WHERE 
   books.rental_price>25;
    
    