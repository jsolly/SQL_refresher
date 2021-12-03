/*
 If you want to use reserved keywords, use brackets, [count], [sum]
 */
SELECT
    count(JobTitle) AS [count],
    sum(Salary) AS [sum]
FROM
    EmployeeSalary