/*
 
 String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
 
 */
SELECT
    *
FROM
    EmployeeErrors;

SELECT
    LTRIM(EmployeeID),
    FirstName,
    LastName --Removes spaces from the left
FROM
    EmployeeErrors ee
SELECT
    RTRIM(EmployeeID),
    FirstName,
    LastName --Removes spaces from the right
FROM
    EmployeeErrors ee
SELECT
    TRIM(EmployeeID),
    FirstName,
    LastName --Removes spaces from left and right
FROM
    EmployeeErrors ee
SELECT
    FirstName AS 'Original first name',
    REPLACE(FirstName, 'TOby', 'Toby') AS 'Replaced first name'
FROM
    EmployeeErrors;

/* 
 SUBSTRING starts at index 1 instead of 0. The second argument is the starting index, the second argument
 is how far you should go relatively from the first index.
 */
SELECT
    FirstName AS 'Original first name',
    SUBSTRING(FirstName, 1, 3) AS 'First 3 letters'
FROM
    EmployeeErrors;

SELECT
    FirstName AS 'Original first name',
    UPPER(FirstName) AS 'Capitalized'
FROM
    EmployeeErrors;