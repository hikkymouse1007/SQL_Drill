-- e.g1
SELECT
COUNT(*) AS 子のつく社員の人数
FROM
Employees
WHERE
EmployeeName LIKE '%子'
;

-- practice1
SELECT
CustomerName AS 会社名
FROM
Customers
WHERE
CustomerName LIKE '%株式会社%';

-- practice2
SELECT
AVG(Height) AS 平均身長
FROM
Employees
WHERE EmployeeName LIKE '%ー%';

-- practice3
SELECT
COUNT(*)
FROM
Customers
WHERE
CustomerName NOT LIKE '%株式会社%';

-- practice4
SELECT
EmployeeName,
Height
FROM
Employees
WHERE 
EmployeeName LIKE '%リ%' AND Height <= 160;

-- practice5
SELECT
*
FROM
Customers
WHERE
CustomerName NOT LIKE '%株式会社%' AND Address LIKE '%江戸川区%';
