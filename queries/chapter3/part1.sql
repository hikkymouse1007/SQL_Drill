-- e.g1
SELECT
*
FROM
Products
WHERE
ProductID NOT IN
(
  SELECT
    ProductID
  FROM
    Sales
)
;

-- practice1
SELECT
EmployeeID,
EmployeeName
FROM
Employees
WHERE
EmployeeID IN
(
  SELECT
  EmployeeID
  FROM
  Salary
  GROUP BY
  EmployeeID
  HAVING
  SUM(Amount) >= 300000
);

-- practice2
SELECT
SaleID,
Quantity,
CustomerID,
(
  SELECT
  CustomerName
  FROM
  Customers
  WHERE
  CustomerID = Sales.CustomerID
)
FROM
Sales
WHERE
Quantity > 100;

-- practice3
SELECT
ProductID,
ProductName
FROM
Products
WHERE
ProductID IN
(
  SELECT
  ProductID
  FROM
  Sales
  GROUP BY
  ProductID
  HAVING
  SUM(Quantity) >= 100
);

-- practice4
SELECT
EmployeeID,
EmployeeName,
(
  SELECT
  MAX (Amount) AS 最高給与額
  FROM
  Salary
  WHERE
  EmployeeID = Employees.EmployeeID
)
FROM
Employees
WHERE
EmployeeID IN
(
  SELECT
  EmployeeID
  FROM
  Salary
  GROUP BY
  EmployeeID
  HAVING
  SUM(Amount) >= 300000
);

-- practice5
SELECT
SaleID,
Quantity,
CustomerID,
(
  SELECT
  CustomerName
  FROM
  Customers
  WHERE
  CustomerID = Sales.CustomerID
),
(
  SELECT
  ProductName
  FROM
  Products
  WHERE
  ProductID = Sales.ProductID
)
FROM
Sales
WHERE
Quantity > 100;
