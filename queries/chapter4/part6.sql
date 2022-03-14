-- e.g1
UPDATE
  Salary
SET
  Amount
= Amount +
(
  SELECT
    (2007 - e.HireFiscalYear)*1000
  FROM
    Employees AS e
  WHERE
    Salary.EmployeeID = e.EmployeeID
)
WHERE
  PayDate = '2008-02-14'
AND
EXISTS
(
  SELECT
  'X'
  FROM
  Employees AS e
  WHERE
  Salary.EmployeeID = e.EmployeeID
)
;

-- practice1
UPDATE
Customers
SET
Address =
(
  SELECT
  PrefecturalName
  FROM
  Prefecturals AS p
  WHERE
  Customers.PrefecturalId = p.PrefecturalId
)
|| Customers.Address
WHERE
  EXISTS
  (
    SELECT
    'X'
    FROM
      Prefecturals AS p
    WHERE
      Customers.PrefecturalId = p.PrefecturalId
  )
;

-- practice2
UPDATE
Salary
SET
Amount
= Amount
+ (
  SELECT
    SUM(
      s.Quantity * p.Price
    ) * 0.03
  FROM
    Sales AS s
  JOIN
    Products AS p
    ON s.ProductID = p.ProductID
  WHERE
    SaleDate < '2007-08-25'
  AND
    Salary.EmployeeID = s.EmployeeID
)
WHERE
  PayDate = '2007-08-25'
  AND
    EXISTS
(
  SELECT
    'X'
  FROM
    Sales AS s
  JOIN
    Products AS p
    ON s.ProductID = p.ProductID
  WHERE
    s.SaleDate < '2007-08-25'
  AND
    Salary.EmployeeID = s.EmployeeID
)
;

-- practice3
UPDATE
Products
SET
Price
  =
(
  SELECT
    AVG(Products.Price * Sales.Quantity)
  FROM
    Sales
  WHERE
    Sales.ProductID = Products.ProductID
)
WHERE
  EXISTS
(
  SELECT
    'X'
  FROM
    Sales
  WHERE
    Sales.ProductID = Products.ProductID
);

-- practice4
UPDATE
  Products
SET
  ProductName = Products.ProductName || '(' ||
  (
    SELECT Categories.CategoryName
    FROM
      Categories
    WHERE
      Products.ProductID = Categories.CategoryID
  )
  || ')'
WHERE
  EXISTS
  (
    SELECT
      'X'
    FROM
      Categories
    WHERE
      Products.ProductID = Categories.CategoryID
  )
;

-- practice5
UPDATE
Products
SET
ProductName =
  (
    SELECT
      SUM( Quantity )
    FROM
      Sales
    WHERE
      Products.ProductID = Sales.ProductID
  )
|| '個も売れてるヒット商品!' || ProductName
WHERE
(
  SELECT
      SUM( Quantity )
  FROM
    Sales
  WHERE
    Products.ProductID = Sales.ProductID
) >= 500
;
