/* 
 Temp Tables. Useful for pulling samples into a table for testing.
 */
DROP TABLE IF EXISTS #drop_me
CREATE TABLE #drop_me
(
    EmployeeID int,
    FirstName varchar(50),
    LastName varchar(50),
    Age int,
    Gender varchar(50)
)
INSERT INTO
    #drop_me 
SELECT
    *
FROM
    EmployeeDemographics
SELECT
    *
FROM
    #drop_me