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
--(Self - Assignment 01)
select name as db from sys.databases 
drop database CustomerDB
create database LibraryDB
use LibraryDb
select table_name as table_name from INFORMATION_SCHEMA.TABLES

create table Books(BookID int primary key,
Title varchar(100),
Author varchar(100),
Price decimal(10,2),
PublishedYear int,
Category varchar(50));

INSERT INTO Books (BookID, Title, Author, Price, PublishedYear, Category) VALUES
(1, 'The Alchemist', 'Paulo Coelho', 599.99, 1988, 'Fiction'),
(2, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 899.50, 2011, 'History'),
(3, 'A Brief History of Time', 'Stephen Hawking', 499.00, 1988, 'Science'),
(4, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 650.00, 1997, 'Finance'),
(5, 'To Kill a Mockingbird', 'Harper Lee', 750.75, 1960, 'Fiction');

--Write queries to:
--Select all books priced above 500.
select * from Books where price > 500.00
--Update the price of a book with BookID = 3 to 450.
update books set price = 450 where BookID = 3
--Delete books published before the year 2000.
delete from books where PublishedYear < 2000
--Add a new column AvailableCopies (int) to the table and update it for all records.
alter table books add AvailableCopies int 
update books 
set AvailableCopies = 
case 
	when bookid = 1 then 10
	when bookid = 2 then 5
	when bookid = 3 then 15
	when bookid = 4 then 8
	when bookid = 5 then 12
	else 0
end
--Write a query to select books where the category is either "Fiction" or "Science."
select * from Books where Category = 'Fiction'or Category = 'Science';
select *  from Books

----Assignment Session:------------------------------------------------------------------
select name as table_name from sys.databases
drop database LibraryDB
create database LibraryDB
use LibraryDB
select table_name as table_name from INFORMATION_SCHEMA.tables

create table Books(
BookID int primary key IDENTITY(1,1),
Title varchar(100),
Author varchar(100),
Genre varchar(100),
PublishedYear int,
Price decimal(10,2));
-------------------------------------------------
select * from books
alter table books add ISBN varchar(20)
alter table books alter column price decimal(12,2)
drop table books
-------------------------------------------------

INSERT INTO Books (Title, Author, Genre, PublishedYear, Price) VALUES
( 'The Alchemist', 'Paulo Coelho','Fiction', 1988,599.99 ),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari','History', 2011, 899.50),
('A Brief History of Time', 'Stephen Hawking','Science', 1988, 499.00 ),
('Rich Dad Poor Dad', 'Robert Kiyosaki','Finance', 1997, 650.00),
('To Kill a Mockingbird', 'Harper Lee','Fiction', 1960, 750.75);

update books set price = 19.99 where bookid = 3
delete from books where bookid = 5
select title,author,price from books where publishedyear > 2000
select count(bookid) from books
select * from books where price between 10 and 30
-------------------17/01/2025------------------------------------
create database rev13
use rev13

create table department(
d_id int primary key,
d_name varchar(50),
contact int)

insert into department values
(101,'IT',987),
(102,'BE',757),
(103,'CS',465),
(104,'CA',123);

create table employee(
id int primary key,
name varchar(50),
salary money,
d_id int,
p_id int,
foreign key (d_id) references department(d_id));

create table payment(
payment_id int primary key,
name varchar(50),
d_id int,
id int,
foreign key (d_id) references department(d_id))


alter table employee
add constraint FK_payment_id foreign key (p_id) references payment(payment_id)

alter table payment
add constraint fk_employee_id foreign key (id) references employee(id)


insert into employee (id, name, salary,d_id,p_id) values
(1,'A',5000,101,null),
(2,'B',5000,101,null),
(3,'D',5000,103,null),
(4,'C',5000,104,null);

insert into payment values
(123,'A',101,1),
(3434,'C',104,4),
(5765,'D',103,3),
(756,'B',101,2)

update employee set p_id = 123 where id = 1
update employee set p_id = 3434 where id = 4
update employee set p_id = 5765 where id = 3 
update employee set p_id = 756 where id = 2

select * from department
select * from employee
select * from payment

select table_name as tablename from INFORMATION_SCHEMA.TABLES
---------------------------------------------------------------------------
create database school
use school

create table department(
departmentId int primary key,
departmentname varchar(50))

insert into department values
(1,'Computer Science'),
(2,'Mathematics')

create table student(
studentid int primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
departmentid int,
foreign key (departmentid) references department(departmentid))

insert into student values
(101,'John','Doe','John.doe@example.com',1),
(102,'Alice','Smith','alice.smith@example.com',2)

create table course(
courseid int primary key,
coursename varchar(50),
credits int)

insert into course values
(201,'Database Managemnt',3),
(202,'Algorithms',4)

create table enrollments(
studentid int,
courseid int,
EnrollmentDate Date,
foreign key (studentid) references student(studentid),
foreign key (courseid) references course(courseid))

insert into enrollments values
(101,201,'2025-01-15'),
(102,202,'2025-01-16');

select * from department
select * from student
select * from course
select * from enrollments

