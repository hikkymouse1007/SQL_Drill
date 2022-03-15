-- e.g1
DELETE
FROM
  Employees
WHERE
  EmployeeID = 17
;

-- practice1
DELETE
FROM
Sales
WHERE
SaleID = 1006
;

-- practice2
DELETE
*
FROM
  Salary
WHERE
  EmployeeID = 10
  AND
  PayDate = '2007-10-01'
;
-- practice3
DELETE
FROM
  Customers
WHERE
  CustomerID >= 10000
;

-- practice4
DELETE
FROM
Products
WHERE
CategoryID = 1;

-- practice5
DELETE
FROM
Customers
WHERE
CustomerClassID = 2
AND
PrefecturalId
IN (3, 5, 7, 13)
;
