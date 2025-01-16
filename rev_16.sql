create database data_new

use data_new


CREATE TABLE Salaries (
    Id INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(50) NOT NULL,
    BasePay FLOAT,
    OvertimePay FLOAT,
    OtherPay FLOAT,
    Benefits FLOAT,
    TotalPay FLOAT NOT NULL,
    TotalPayBenefits FLOAT NOT NULL,
    Year SMALLINT NOT NULL,
    Notes NVARCHAR(1),
    Agency NVARCHAR(50) NOT NULL,
    Status VARCHAR(50)
);


INSERT INTO Salaries (Id, EmployeeName, JobTitle, BasePay, OvertimePay, OtherPay, Benefits, TotalPay, TotalPayBenefits, Year, Notes, Agency, Status) VALUES
(1, 'Alice Johnson', 'Manager', 120000, 10000, 5000, 20000, 135000, 155000, 2023, NULL, 'City Agency', 'Active'),
(2, 'Bob Smith', 'Developer', 95000, 2000, 3000, 15000, 100000, 115000, 2023, NULL, 'City Agency', 'Active'),
(3, 'Charlie Brown', 'Senior Manager', 150000, 15000, 7000, 25000, 172000, 197000, 2023, NULL, 'City Agency', 'Active'),
(4, 'Daisy Ridley', 'HR Manager', 80000, 5000, 4000, 12000, 89000, 101000, 2023, NULL, 'City Agency', 'Active'),
(5, 'Ethan Hunt', 'Director', 175000, 20000, 10000, 30000, 205000, 235000, 2023, NULL, 'City Agency', 'Active'),
(6, 'Fiona Gallagher', 'Engineer', 75000, 1000, 2000, 8000, 78000, 86000, 2023, NULL, 'City Agency', 'Active'),
(7, 'George Lucas', 'Manager', 110000, 8000, 5000, 18000, 123000, 141000, 2023, NULL, 'City Agency', 'Active'),
(8, 'Hannah Montana', 'Technician', 60000, NULL, 2000, 5000, 62000, 67000, 2023, NULL, 'City Agency', 'Active'),
(9, 'Ian Wright', 'Assistant Manager', 95000, 12000, 4000, 10000, 111000, 121000, 2023, NULL, 'City Agency', 'Active'),
(10, 'Jane Austen', 'Director', 160000, 18000, 9000, 25000, 187000, 212000, 2023, NULL, 'City Agency', 'Active');

select * from salaries
-- use data_new
-- 1	Show all columns and rows in the table.
select * from salaries


-- 2	Show only the EmployeeName and JobTitle columns.
select employeename,jobtitle from salaries

-- 3	Show the number of employees in the table.
select count(*) from salaries

-- 4	Show the unique job titles in the table.
select distinct(jobtitle) from salaries

-- 5	Show the job title and overtime pay for all employees with 
-- overtime pay greater than 50000.
select jobtitle, overtimepay from salaries where overtimepay > 50000

-- 6	Show the average base pay for all employees.
select avg(basepay) as 'avgpay' from salaries

-- 7	Show the top 10 highest paid employees.
select EmployeeName, totalpay  from salaries order by totalpay desc limit 10  

-- 8	Show the average of BasePay, OvertimePay, and OtherPay for each employee:
select employeename,(basepay+overtimepay+otherpay)/3 from salaries 

-- 9	Show all employees who have the word "Manager" in their job title.
select * from salaries where jobtitle like '%Manager%'

-- 10	Show all employees with a job title not equal to "Manager".
select * from salaries where jobtitle <> 'Manager'

-- 11	Show all employees with a total pay between 50,000 and 75,000.
select * from salaries where totalpay between 50000 and 75000

-- 12	Show all employees with a base pay less than 50,000 
-- or a total pay greater than 100,000.
select * from salaries where basepay < 50000 or totalpay > 100000

-- 13	Show all employees with a total pay benefits value 
-- between 125,000 and 150,000 and a job title containing the word "Director".
select employeename, totalpaybenefits from salaries where jobtitle like '%Director%' and totalpaybenefits between 125000 and 150000
-- 14	Show all employees ordered by their total pay benefits in descending order.
select * from salaries order by TotalPayBenefits desc

-- 15	Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order.
select jobtitle, avg(basepay) from salaries 
group by jobtitle
having avg(basepay) >= 100000
order by basepay desc

select * from salaries
-- 16	Delete the column.
alter table salaries drop column notes 
select * from salaries

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.
update salaries set basepay = basepay * 1.1  where jobtitle like '%Manager%'

-- 18	Delete all employees who have no OvertimePay.
delete from salaries where overtimepay is null
select * from salaries
