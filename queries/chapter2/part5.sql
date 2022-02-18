-- e.g1
SELECT
  Weight / ((Height/100)^2) AS BMI
FROM
  Employees;

-- practice1
SELECT
  Height * 3 - Weight * 2.5 AS 結果
FROM
  Employees;

-- practice2
SELECT
  (HireFiscalYear / Weight) + Height AS 結果
FROM
  Employees;

-- practice3
SELECT
  Quantity + (CustomerID * ProductID * EmployeeID ) AS 結果
FROM
  Sales;

-- practice4
SELECT
  Price - (ProductCode * CategoryID) AS 結果
FROM
  Products;

-- practice5
SELECT
  CustomerID + CustomerClassID^3 AS 結果
FROM
  Customers;
