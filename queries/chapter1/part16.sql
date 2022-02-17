-- e.g1
SELECT DISTINCT
Address AS 住所
FROM
Customers
;

-- practice1
SELECT DISTINCT
HireFiscalYear
FROM
Employees
;


-- practice2
SELECT DISTINCT
CustomerID,
ProductID
FROM
Sales;

-- practice3
SELECT DISTINCT
CustomerClassID,
PrefecturalID
FROM
Customers;

-- practice4
SELECT DISTINCT
CustomerID,
ProductID,
EmployeeID
FROM
Sales;

-- practice5
SELECT
  CustomerID + CustomerClassID^3 AS 結果
FROM
  Customers;
