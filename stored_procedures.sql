CREATE PROCEDURE SELECT_PROCEDURE AS
SELECT
    *
FROM
    EmployeeDemographics EXEC SELECT_PROCEDURE
    /* Example with temp tables */
    CREATE PROCEDURE TEMP_TABLE_SELECT @JobTitle nvarchar(100) AS DROP TABLE IF EXISTS #temp_employee
    CREATE TABLE #temp_employee
    (
        JobTitle varchar(100),
        EmployeesPerJob int,
        AvgAge int,
        AvgSalary int,
    )
INSERT INTO
    #temp_employee
SELECT
    JobTitle,
    COUNT(JobTitle),
    AVG(age),
    AVG(Salary)
FROM
    EmployeeDemographics dem
    JOIN EmployeeSalary sal ON (dem.EmployeeID = sal.EmployeeID)
WHERE
    JobTitle = @JobTitle
GROUP BY
    JobTitle
SELECT
    *
FROM
    #temp_employee
    EXEC TEMP_TABLE_SELECT @JobTitle = 'Salesman'