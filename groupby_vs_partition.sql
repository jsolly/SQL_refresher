-- Partitions
/*
 Use over( ) when you want to show non-aggregates (like EmployeeID) next to aggregates (like averages)
 next to each other in the result set.
 
 Over( ) is a way of exposing a 'window' to other statements. It's like a group by without doing a group by.
 
 Over ( ) where it is blank is going to expose the whole table to whatever is to the left of it.\
 
 Over ( ) will allow you to return aggregated data without reducing the number of rows returned
 
 Over ( ) + PARTITION BY does the same thing, but groups by a qualifier (but same # of rows)
 
 over (PARTITION BY COLUMN_NAME) will expose the rows associated with each unique value in COLUMN_NAME. 
 */
SELECT
    FirstName,
    LastName,
    Gender,
    Salary,
    COUNT(Gender) OVER (PARTITION by Gender) AS TotalGender
FROM
    EmployeeDemographics ed
    JOIN EmployeeSalary es ON (ed.EmployeeID = es.EmployeeID)
    /* vs */
SELECT
    FirstName,
    LastName,
    Gender,
    Salary,
    AVG(SALARY) OVER () AS GroupAvgSalary
FROM
    EmployeeDemographics ed
    JOIN EmployeeSalary es ON (ed.EmployeeID = es.EmployeeID)
    /* GROUP BY example is below*/
SELECT
    Gender,
    count(Gender) AS gender_count
FROM
    EmployeeDemographics ed
    JOIN EmployeeSalary es ON (ed.EmployeeID = es.EmployeeID)
GROUP BY
    Gender