-- e.g1
INSERT
INTO Salary
(
  SalaryID,
  EmployeeID,
  PayDate,
  Amount
)
SELECT
s.EmployeeID + 100000,
s.EmployeeID,
'2008-02-14',
SUM( s.Quantity * p.Price * 0.001)
FROM
  Sales AS s
JOIN
  Products AS p
  ON s.ProductID = p.ProductID
GROUP BY
  s.EmployeeID + 100000,
  s.EmployeeID
;

-- practice1
INSERT
INTO Salary
(
  SalaryID,
  EmployeeID,
  PayDate,
  Amount
)
SELECT
EmployeeID + 20000,
EmployeeID,
'2007-10-01',
20000
FROM
Employees
WHERE
HireFiscalYear <= 1993;


-- practice2
INSERT
INTO Customers
(
  CustomerID,
  CustomerCode,
  CustomerName,
  Address,
  CustomerClassID,
  PrefecturalID
)
SELECT
  EmployeeID + 10000,
  EmployeeID + 10000,
  EmployeeName,
  '江戸川区西小岩',
  2,
  13
FROM
  Employees
WHERE
  HireFiscalYear <= 1988
;

-- practice3
INSERT
INTO Sales
(
  SaleID,
  Quantity,
  CustomerID,
  ProductID,
  EmployeeID,
  SaleDate
)
SELECT
  EmployeeID + 30000,
  10,
  10,
  20,
  EmployeeID,
  '2007-09-01'
FROM
Employees
WHERE
BloodType = 'O'
;

-- practice4
SELECT
Quantity,
(
  SELECT
  CustomerName
  FROM
  Customers AS B
  WHERE
  A.CustomerID = B.CustomerID
),
(
  SELECT
  ProductName
  FROM
  Products AS C
  WHERE
  A.ProductID =C.ProductID
),
(
  SELECT
  EmployeeName
  FROM
  Employees AS D
  WHERE
  A.EmployeeID = D.EmployeeID
)
FROM
Sales AS A
WHERE
A.Quantity >= 200;

-- practice5
SELECT
CustomerName,
(
  SELECT
  PrefecturalName
  FROM 
  Prefecturals AS B
  WHERE
  A.PrefecturalID = B.PrefecturalID
),
(
  SELECT
  CustomerClassName
  FROM
  CustomerClasses AS C
  WHERE
  A.CustomerClassID = C.CustomerClassID
)
FROM
Customers AS A
ORDER BY
A.PrefecturalID;
