create database sales;
use sales;
create table sales(
order_id int not null primary key,
Customer_name varchar(50),
product_category varchar(50),
ordered_item varchar(50),
contact_number int(10));
alter table sales add order_quantity int;
alter table sales_orders drop column contact_number;
alter table sales_orders add contact_number int(50);

alter table sales rename sales_orders;
use sales;
insert into sales_orders(order_id,Customer_name,product_category,ordered_item,contact_number,order_quantity)values(1,'Banu','cosmetics','facewash',556627352,2),
(2,'shimna','cosmetics','shampoo',234152645,1),
(3,'semeer','fashion','kurta',264783945,3),
(4,'shyam','fashion','pants',266383945,6),
(5,'shemeera','food','lays',264783600,5),
(6,'semeersha','food','oreo',264559645,8),
(7,'manju','detergent','detol',264009645,4),
(8,'neethu','detergent','surfexcel',267039645,3),
(9,'athira','grocerry','jaggery',261039645,6),
(10,'sisira','grocerry','sugar',264780645,3);
select * from sales_orders;
select customer_name,ordered_item from sales_orders;
select * from sales_orders;
drop table sales_orders;