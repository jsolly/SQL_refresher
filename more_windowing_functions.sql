/*
 Aggregate functions -AVG, SUM, COUNT, MIN, MAX, etc
 Ranking Functions - RANK, DENSE_RANK, ROW_NUMBER, etc
 Analytic functions - LEAD, LAD, FIRST_VALUE, LAST_VALUE
 
 When Over() is used with the above, it controls the partitioning and ordering of rows that are
 passed into the functions
 
 Over() accepts 3 arguments...
 ORDER BY - This orders rows within the partition
 PARTITION BY - Groups rows based on a qualifier
 ROWS (you can also use RANGE) - further limits rows within the partition by specifying start and end
 within the partition.
 
 When using a subquery in a FROM clause, make sure to alias it, or SQL can complain.
 
 When using Over() with an argument like ORDER BY, the default ROWS is
 'RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW'
 
 */
/*
 Get the first 2 employees from each department to join the company.
 What is happening here is that the inner query is assigning row numbers to each employee.
 The result set is ordered by empolyee id (assuming lower employee ids mean they joined the company earlier).
 Because it is partitioned by department, the first row of every partition should have the lowest employee
 id for any employee in that department.
 */
SELECT
    *
FROM
    (
        SELECT
            *,
            ROW_NUMBER() over(
                PARTITION by dept_name
                ORDER BY
                    emp_id
            ) AS rn
        FROM
            employee
    ) x
WHERE
    x.rn <= 2
    /*
     Get the top 3 employees in each department based on salary. We are using RANK instead of the row_number
     method because RANK() will give employees with the same salary the same rank, but jump ranks for the next number.
     
     If you don't want to skip values, use DENSE_RANK()
     */
SELECT
    *
FROM
    (
        SELECT
            *,
            rank() over(
                PARTITION by dept_name
                ORDER BY
                    salary DESC
            ) AS rnk
        FROM
            employee
    ) ranked
WHERE
    ranked.rnk < 4
    /*
     Find out if the previously hired employee (one less emp_id earned more or less than the next hired employee. Similarly,
     find out if the next hired employee (one emp_ID higher) is making more or less money.
     
     We can do think with lag() and lead() which access the previous record. Useful if you're passing a 'window' of 
     data to the function.
     */
SELECT
    salary,
    CASE
        WHEN previous_salary < salary THEN 'Higher'
        WHEN previous_salary > salary THEN 'Lower'
        WHEN previous_salary = salary THEN 'Same'
        ELSE 'Unknown'
    END AS STATUS
FROM
    (
        SELECT
            *,
            lag(salary) over (
                PARTITION by DEPT_NAME
                ORDER BY
                    emp_ID
            ) AS previous_salary
        FROM
            employee
    ) AS x
    /* 
     This can actually be simplified to put the case statements right into the windowing function
     */
SELECT
    salary,
    CASE
        WHEN salary < lag(salary) over (
            PARTITION by DEPT_NAME
            ORDER BY
                emp_ID
        ) THEN 'Lower'
        WHEN salary > lag(salary) over (
            PARTITION by DEPT_NAME
            ORDER BY
                emp_ID
        ) THEN 'Higher'
        WHEN salary = lag(salary) over (
            PARTITION by DEPT_NAME
            ORDER BY
                emp_ID
        ) THEN 'Same'
        ELSE 'Unknown'
    END AS STATUS
FROM
    employee