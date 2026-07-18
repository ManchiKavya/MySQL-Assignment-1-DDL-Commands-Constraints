# To create Database 
create database employee;
USE employee;

# To create employees table
create table employees(
employee_id int,
employee_name varchar(50),
gender ENUM("M","F"),
age int,
hire_date Date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);

Select * from employees;

# To create departments table
create table departments(
department_id int,
department_name varchar(100)
);

# to create location table
create table location(
location_id int,
location varchar(30)
);

# Adding one more new column to the employees table
Alter table employees add email varchar(100);

# this will modify designation column to support a wider range of values.
Alter table employees modify designation varchar(255);

# this will permenently delete the age column
Alter table employees drop age;

# To show the employees table structure
describe employees;

# to change the column name from hire_date to date_of_joining in employees table
Alter table employees rename column hire_date To date_of_joining;

# To rename the departments table
Rename table departments To Departments_Info;

# To rename the Location table
Rename table location To Locations;

# To delete employees data permanently
Truncate table employees;

# To delete employees table permanently
Drop table employees;

#To delete employee database permanently
Drop database employee;

##### Recreating the database again 

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

# Ensure that the "department_id" uniquely identifies each department.
# Set up constraints on the "department_name" to avoid duplicate and null entries

create table departments(
department_id int primary key,
department_name varchar(100) Not null unique
);

# Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
# Implement constraints to prevent the insertion of null and duplicate locations.

create table location(
location_id int primary key auto_increment,
location varchar(30) unique not null
);

# Guarantee that each employee has a distinct identifier.
# Create a restriction to ensure that the employee's name is always provided.
# Limit the acceptable values for the "gender" field to only 'M' or 'F'.
# Enforce a condition to ensure that the employee's age is 18 or above.
# Automatically assign the current date to the "hire_date" field if not specified.

create table employees(
employee_id int primary key auto_increment,
employee_name varchar(50) not null,
gender ENUM("M","F"),
age int check(age>=18),
hire_date Date default(current_date),
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2),

# Establish links between the "department_id" and "location_id" fields in the "employees" table and their respective tables.

foreign key (department_id) references departments(department_id),
foreign key (location_id) references location(location_id)
);

describe employees;
select * from employees;

describe departments;

describe location;