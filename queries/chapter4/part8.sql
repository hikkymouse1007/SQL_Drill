-- e.g1
SELECT
  e.EmployeeName AS 氏名,
  s.SaleDate AS 日付
FROM
  Sales AS s
JOIN
  Employees AS e
ON
  s.EmployeeID = e.EmployeeID;
INTERSECT
SELECT
  e.EmployeeName AS 氏名,
  s.SaleDate AS 日付
FROM
  Salary AS s
JOIN
  Employees AS e
ON
  s.EmployeeID = e.EmployeeID
;

-- practice1
SELECT
  CustomerID AS ID,
  CustomerName AS 名前
FROM
  Customers
INTERSECT
SELECT
  EmployeeID AS ID,
  EmployeeName AS 名前
FROM
  Employees
ORDER BY
  ID
;

-- practice2
SELECT
  EmployeeID AS ID,
  EmployeeName AS 氏名
FROM
  Employees
INTERSECT
SELECT
  EmployeeID AS ID,
  EmployeeName AS 氏名
FROM
  Employees
ORDER BY
ID;

-- practice3
SELECT
ProductID AS ID
FROM
Products
INTERSECT
SELECT
ProductID AS ID
FROM
Sales
ORDER BY
ID;

-- practice4
SELECT
CustomerID,
ProductID
FROM
Sales
WHERE
SaleDate BETWEEN '2006-12-31' AND '2007-03-31'
  AND Quantity >= 10
INTERSECT
SELECT
CustomerID,
ProductID
FROM
Sales
WHERE
SaleDate BETWEEN '2007-04-01' AND '2007-06-30'
  AND Quantity >= 10;

-- practice5
SELECT
ProductID
FROM
Sales AS s
JOIN
Customers AS c
ON
s.CustomerID = c.CustomerID
WHERE
c.CustomerClassID = 2
  AND s.Quantity >= 10
INTERSECT
SELECT
ProductID
FROM
Sales AS s
JOIN
Customers AS c
ON
s.CustomerID = c.CustomerID
WHERE
c.CustomerClassID = 1
  AND s.Quantity >= 100
ORDER BY
ProductID
;

