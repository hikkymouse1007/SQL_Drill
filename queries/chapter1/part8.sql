-- e.g1
SELECT
EmployeeName AS 指名
FROM
Employees
WHERE
Height >= 180
;

-- practice1
SELECT
ProductName
FROM
Products
WHERE
Price >= 2500
;

-- practice2
SELECT
  EmployeeName
 ,Weight
FROM
  Employees
WHERE
  Weight >= 70
;

-- practice3
SELECT
EmployeeName,
Height
FROM
Employees
WHERE
Height BETWEEN 160 AND 180
;

-- practice4
SELECT
SaleID
FROM
Sales
WHERE
SaleDate >= '2007-06-01'
;

-- practice5
SELECT
EmployeeName,
Height,
Weight
FROM
Employees
WHERE
Height >= 170 AND Weight >= 60;
