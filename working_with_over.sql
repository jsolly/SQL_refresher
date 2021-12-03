/* Over() Row ranges */
SELECT
    *,
    AVG(salary) over() AS avg_sal
FROM
    EmployeeSalary
SELECT
    *,
    AVG(salary) over(
        ORDER BY
            Salary
    ) AS avg_sal
FROM
    EmployeeSalary