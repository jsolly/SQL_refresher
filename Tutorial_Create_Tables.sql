-- Table 1 Query:
CREATE TABLE EmployeeDemographics (
    EmployeeID int,
    FirstName varchar(50),
    LastName varchar(50),
    Age int,
    Gender varchar(50)
) -- Table 2 Query:
CREATE TABLE EmployeeSalary (
    EmployeeID int,
    JobTitle varchar(50),
    Salary int
) -- Table 1 Insert:
INSERT INTO
    EmployeeDemographics
VALUES
    (1001, 'Jim', 'Halpert', 30, 'Male'),
    (1002, 'Pam', 'Beasley', 30, 'Female'),
    (1003, 'Dwight', 'Schrute', 29, 'Male'),
    (1004, 'Angela', 'Martin', 31, 'Female'),
    (1005, 'Toby', 'Flenderson', 32, 'Male'),
    (1006, 'Michael', 'Scott', 35, 'Male'),
    (1007, 'Meredith', 'Palmer', 32, 'Female'),
    (1008, 'Stanley', 'Hudson', 38, 'Male'),
    (1009, 'Kevin', 'Malone', 31, 'Male') -- Table 2 Insert:
INSERT INTO
    EmployeeSalary
VALUES
    (1001, 'Salesman', 45000),
    (1002, 'Receptionist', 36000),
    (1003, 'Salesman', 63000),
    (1004, 'Accountant', 47000),
    (1005, 'HR', 50000),
    (1006, 'Regional Manager', 65000),
    (1007, 'Supplier Relations', 41000),
    (1008, 'Salesman', 48000),
    (1009, 'Accountant', 42000) CREATE TABLE EmployeeErrors (
        EmployeeID varchar(50),
        FirstName varchar(50),
        LastName varchar(50)
    )
INSERT INTO
    EmployeeErrors
VALUES
    ('1001  ', 'Jimbo', 'Halbert'),
    ('  1002', 'Pamela', 'Beasely'),
    ('1005', 'TOby', 'Flenderson - Fired')
    /*
     From https://github.com/AlexTheAnalyst
     */
    DROP TABLE employee;

CREATE TABLE employee (
    emp_ID int,
    emp_NAME varchar(50),
    DEPT_NAME varchar(50),
    SALARY int
);

INSERT INTO
    employee
VALUES
    (101, 'Mohan', 'Admin', 4000);

INSERT INTO
    employee
VALUES
    (102, 'Rajkumar', 'HR', 3000);

INSERT INTO
    employee
VALUES
    (103, 'Akbar', 'IT', 4000);

INSERT INTO
    employee
VALUES
    (104, 'Dorvin', 'Finance', 6500);

INSERT INTO
    employee
VALUES
    (105, 'Rohit', 'HR', 3000);

INSERT INTO
    employee
VALUES
    (106, 'Rajesh', 'Finance', 5000);

INSERT INTO
    employee
VALUES
    (107, 'Preet', 'HR', 7000);

INSERT INTO
    employee
VALUES
    (108, 'Maryam', 'Admin', 4000);

INSERT INTO
    employee
VALUES
    (109, 'Sanjay', 'IT', 6500);

INSERT INTO
    employee
VALUES
    (110, 'Vasudha', 'IT', 7000);

INSERT INTO
    employee
VALUES
    (111, 'Melinda', 'IT', 8000);

INSERT INTO
    employee
VALUES
    (112, 'Komal', 'IT', 10000);

INSERT INTO
    employee
VALUES
    (113, 'Gautham', 'Admin', 2000);

INSERT INTO
    employee
VALUES
    (114, 'Manisha', 'HR', 3000);

INSERT INTO
    employee
VALUES
    (115, 'Chandni', 'IT', 4500);

INSERT INTO
    employee
VALUES
    (116, 'Satya', 'Finance', 6500);

INSERT INTO
    employee
VALUES
    (117, 'Adarsh', 'HR', 3500);

INSERT INTO
    employee
VALUES
    (118, 'Tejaswi', 'Finance', 5500);

INSERT INTO
    employee
VALUES
    (119, 'Cory', 'HR', 8000);

INSERT INTO
    employee
VALUES
    (120, 'Monica', 'Admin', 5000);

INSERT INTO
    employee
VALUES
    (121, 'Rosalin', 'IT', 6000);

INSERT INTO
    employee
VALUES
    (122, 'Ibrahim', 'IT', 8000);

INSERT INTO
    employee
VALUES
    (123, 'Vikram', 'IT', 8000);

INSERT INTO
    employee
VALUES
    (124, 'Dheeraj', 'IT', 11000);

COMMIT;