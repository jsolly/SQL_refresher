/*
 Subqueries (Also known as 'inner queries', 'nested queries', 'query within a query'). can be used in 
 SELECT, WHERE, INSERT, UPDATE, DELETE and other places.
 
 In certain cases, you can use a Subquery instead of a JOIN.
 
 You can only return one column via a subquery if it is being used in a WHERE statment
 (as opposed to being able to select a whole table in a FROM statement)
 
 Subqueries tend to be a little slow. More prefered to use a CTE or a temp table
 */
SELECT
    *
FROM
    EmployeeSalary
    /* Subquery in SELECT (Show the cummulative average next to every individual average) */
SELECT
    *,
    (
        SELECT
            AVG(Salary)
        FROM
            EmployeeSalary
    ) AS Avg_Salary_of_team
FROM
    EmployeeSalary es
    /* With a Partition (Show the cummulative average next to every individual average) */
SELECT
    *,
    AVG(Salary) over() AS Avg_Salary_of_team
FROM
    EmployeeSalary es
    /*
     A GROUP BY doesn't work because once you include a non-aggregate, it no longer can run aggregate
     functions over chunks of data.
     */
SELECT
    EmployeeID,
    Salary,
    AVG(SALARY) AS Avg_Salary_of_team
FROM
    EmployeeSalary es
GROUP BY
    EmployeeID,
    Salary
ORDER BY
    EmployeeID,
    Salary
    /*
     The only way to kinda do this is to eliminate the non-aggregates, but then you can't see aggregates across the 
     WHOLE table
     */
SELECT
    JobTitle,
    AVG(SALARY) AS Avg_Salary_of_team
FROM
    EmployeeSalary es
GROUP BY
    JobTitle
    /*Subquery in FROM (Not really reccomended...use a cte or a temp table) */
SELECT
    EmployeeID,
    JobTitle
FROM
    (
        SELECT
            *
        FROM
            EmployeeSalary es
    ) AS table_name
    /*Subquery in WHERE */
SELECT
    *
FROM
    EmployeeDemographics
WHERE
    EmployeeID IN (
        SELECT
            EmployeeID
        FROM
            EmployeeDemographics
        WHERE
            Gender = 'Male'
    )