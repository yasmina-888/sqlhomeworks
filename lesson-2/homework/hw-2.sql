Create table Employees (Id int, Name varchar (50), Salary decimal(10,2), Age int) 
Select*from Employees 
insert into Employees values 
(1, 'Nikita', 3000.22, 38),
(2, 'Dimutriy', 3000.00, 20),
(3, 'Daniil', 4000.21, 37)
UPDATE Employees
SET Salary = 7000.00
Where ID = 1
Delete from Employees
Where ID = 2

Alter table employees
Add Department varchar(50)

Alter table Employees
Alter column Salary FLOAT

Truncate table employees

CREATE TABLE Departments (DepartmentID INT,DepartmentName varchar(50))
select*from departments
insert into Departments values (1,'Finance'),(2,'HR'),(3,'Managment')

UPDATE Employees
SET Departments = 'Management'
WHERE Salary > 5000

TRUNCATE TABLE Employees

Alter table Employees
Drop column Department

EXEC sp_rename 'Employees', 'StaffMembers'

drop table Departments

Create table Products (ID Int,Name Varchar(50),Category Varchar(50),Price int, manufacture varchar(60))
select*from Products

Alter table Products
ADD StockQuantity INT DEFAULT 50

EXEC sp_rename 'Products.Category', 'ProductCategory','COLUMN'

insert into Products values (1,'Iphone','electronic',1500,'USA'), (2,'Laptop','Electronic',800,'USA'),
(3,'Fridge','Electronic',700,'China'),(4,'Vacuum cleaner','Electronic',600,'Russia')

SELECT * INTO Products_Backup
FROM Products

EXEC sp_rename 'Products', 'Inventory'


ALTER TABLE Inventory
ALTER COLUMN Price FLOAT
