/*
 If you use over() without partitions, then the RANGE argument works across the
 whole dataset. 
 
 */
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
    /* The above query is implicitly passing the following value into RANGE */
SELECT
    *,
    AVG(salary) over(
        ORDER BY
            Salary RANGE BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
    ) AS avg_sal
FROM
    EmployeeSalary
    /* If you want to order the result and AVG() across whole dataset, do this */
SELECT
    *,
    AVG(salary) over(
        ORDER BY
            Salary RANGE BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED following
    ) AS avg_sal
FROM
    EmployeeSalary