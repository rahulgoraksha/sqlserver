drop database revision

-------------------10/01/2025------------------------------------
select name as db from sys.databases
drop database revision

create database revision
use revision

create table rev(
id int primary key,
empname varchar(50),
city varchar(50),
salary int)

insert into rev values
(1,'Jack','ABC',1000),
(2,'Rack','DEF',5000),
(3,'Mack','ABC',6000),
(4,'Boss','BMN',8000),
(5,'Beast','OCR',9000),
(6,'Jim','DEF',3000);

select * from rev

select id, empname, city from rev

--declare the variable
declare @empid int = 1001
print @empid
--if condition
declare @salary int = 45000
if @salary > 30000
print 'High Salary';
else
print'Low salary';
--alter command use
-- add column
alter table rev add age int
alter table rev add gender int

--modify table datatype
alter table rev alter column gender varchar(10)

--drop column
alter table rev drop column age

--update query using where clause
update rev set gender = 'M' where id = 1
update rev set gender = 'F' where id = 2
update rev set gender = 'M' where id = 3
update rev set gender = 'N' where id = 4
update rev set gender = 'F' where id = 5
update rev set gender = 'F' where id = 6

--delete query 
delete from rev where id = 4

--select query 
select * from rev where salary >= 6000

--grant syntax
grant select,insert on rev to user1
--revove syntax
revoke select, insert on rev from user1

select * from rev
-- difference between drop , truncate, delete
-- drop: delete entire table along with its structure
-- truncate: remove all the information present in the structure
-- delete: same as truncate the major difference is it remove inofrmation of specific row and it can delete table just by keeping it structure intact
select * from rev

-- datatypes
--1.numeric data types
--2.character(string) data types

--3.date and time data types
create table Events(Eventid int primary key,
eventname varchar(100),
eventdate datetime,
createdAt datetimeoffset default sysdatetimeoffset());

insert into events values(101,'practical',2024-05-01,default)
select * from events
--4.Binary data type
--5.Uniqueidentifier
create table users(userid UNIQUEIDENTIFIER default newid(),
username varchar(50));

insert into users (username) values ('mother')
--6.XML datatype
create table orders(
orderid int primary key,
orderdetails xml)

select * from orders
insert into orders values(101,' <item> apple</item>
    <cost> 400</cost>');
--7.JSON (handled as Nvachar)
create table items(productid int primary key,
productinfo nvarchar(max))

insert into items values(1,'{products:
									name = "raj",
									age = 43}')

-------------------13/01/2025------------------------------------
--Types of Database
--1.Hierachial type: tree type
--2.Network type: graph type
--3.Object oreinted DBMS: object oreiented 
--4.relational based DBMS: table type
--5.nosql database: key value doument based
--6.newsql type: rdbms+ nosql(hybrid)

--operator
--1.Arithmetic operator
-- +, - , *, / , %
select 100+50 as addition
--2.Comparison operator
--= , <> !=,> ,<,>=,<=
select 
case when 10>5 then 'True' Else 'False' end as greaterthan
--3.logical operator
--&& , | , !
--True = 1 False = 0
--4.Bitwise operator 
--5.String concatenation '+'
--6. Assignment Operator
declare @empid int = 1001
print @empid
--7.Speical operator
--between (range condition),
--in (matches any value in a list), 
--like (pattern macthing), 
--is null (check for null values),
--exists (check if a subquerry return data)


--Assignment
create database CustomerDB
use CustomerDB
create table customer_info(
cust_id int primary key,
Name varchar(50),
Gender varchar(50),
);

INSERT INTO customer_info (Cust_id, Name, Gender) VALUES
(1, 'Oliver Brown', 'Male'),
(2, 'Emma Smith', 'Female'),
(3, 'Amelia Miller', 'Female')
(4, 'Eric Green', 'Male'),
(5, 'Robert Davis', 'Male'),
(6, 'Linda Anderson', 'Female'),
(7, 'Patricia Thomas', 'Female'),
(8, 'James Martin', 'Male'),
(9, 'Susan Thompson', 'Female'),
(10, 'Thyra Harris', 'Female');

select * from customer_info
alter table customer_info drop column customer_number 
alter table customer_info add customer_number varchar(50)

UPDATE customer_info SET Customer_Number = '(555)-103-004' WHERE cust_id = 1;
UPDATE customer_info SET Customer_Number = '(555)-685-324' WHERE cust_id = 2;
UPDATE customer_info SET Customer_Number = '(325)-023-324' WHERE cust_id = 3;
UPDATE customer_info SET Customer_Number = '(022)-685-324' WHERE cust_id = 4;
UPDATE customer_info SET Customer_Number = '(365)-123-304' WHERE cust_id = 5;
UPDATE customer_info SET Customer_Number = '(555)-685-354' WHERE cust_id = 6;
UPDATE customer_info SET Customer_Number = '(555)-003-384' WHERE cust_id = 7;
UPDATE customer_info SET Customer_Number = '(555)-685-324' WHERE cust_id = 8;
UPDATE customer_info SET Customer_Number = '(555)-123-354' WHERE cust_id = 9;
UPDATE customer_info SET Customer_Number = '(555)-685-324' WHERE cust_id = 10;

delete customer_info where cust_id = 5

update customer_info set customer_number = '(555) 827-6895' where cust_id = 3

delete customer_info
-------------------15/01/2025------------------------------------