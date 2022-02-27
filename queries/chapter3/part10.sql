-- e.g1
SELECT
EmployeeName
FROM
Employees
EXCEPT
SELECT
e.EmployeeName
FROM
Sales AS s
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
EXCEPT
SELECT
EmployeeID AS ID,
EmployeeName AS 名前
FROM
Employees
ORDER BY ID;

-- practice2
SELECT
EmployeeID AS ID,
EmployeeName AS 名前
FROM
Employees
EXCEPT
SELECT
EmployeeID AS ID,
EmployeeName AS 名前
FROM
Employees
ORDER BY
ID
;

-- practice3
SELECT
ProductID AS ID
FROM
Products
EXCEPT
SELECT
ProductID AS ID
FROM
Sales
ORDER BY
ID
;

-- practice4
SELECT
s.ProductID
FROM
Sales AS s
JOIN
Customers as c
ON
s.CustomerID = c.CustomerID
WHERE
c.CustomerClassID = 1
  AND s.Quantity >= 100
EXCEPT
SELECT
s.ProductID
FROM
Sales AS s
JOIN
Customers as c
ON
s.CustomerID = c.CustomerID
WHERE
c.CustomerClassID = 2
  AND s.Quantity >= 10
ORDER BY ProductID;

-- practice5
SELECT
s.ProductID
FROM
Sales AS s
JOIN
Customers as c
ON
s.CustomerID = c.CustomerID
WHERE
c.CustomerClassID = 2
  AND s.Quantity >= 10
EXCEPT
SELECT
s.ProductID
FROM
Sales AS s
JOIN
Customers as c
ON
s.CustomerID = c.CustomerID
WHERE
c.CustomerClassID = 1
  AND s.Quantity >= 100
ORDER BY ProductID;


-- practice5
SELECT
CASE
  WHEN Height < 160 THEN 'A'
  WHEN Height < 170 THEN 'B'
  WHEN Height < 180 THEN 'C'
  ELSE 'D'
END AS ランク
FROM
Employees;
