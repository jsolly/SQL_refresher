/*
 CTEs are not saved anywhere. The whole query is executed when ran. The work a bit like subqueries.
 Useful for showing aggregates alongside individual records
 */
WITH CTE_Employee AS (
    SELECT
        FirstName,
        LastName,
        Gender,
        Salary,
        COUNT(dem.gender) OVER (PARTITION by Gender) AS TotalGender,
        AVG(sal.salary) OVER (PARTITION by Gender) AS AvgSalary
    FROM
        EmployeeDemographics dem
        JOIN EmployeeSalary sal ON sal.EmployeeID = dem.EmployeeID
    WHERE
        Salary > 45000
)
SELECT
    FirstName,
    AvgSalary -- SELECT statement needs to be RIGHT next to the CTE
FROM
    CTE_Employee