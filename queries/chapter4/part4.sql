-- e.g1
UPDATE
  Customers
SET
  Address = '世田谷区たがやせ一丁目'
WHERE
  CustomerID = 5
;

-- practice1
UPDATE
  Employees
SET
  Height = Height + 5
WHERE
  EmployeeID = 10;

-- practice2
UPDATE
  Salary
SET
  Amount = Amount + 20000
WHERE
  EmployeeID = 5
  AND
    PayDate = '2007-03-25'
;

-- practice3
UPDATE
  Employees
SET
  Height = Height - 2,
  Weight = Weight + 3
WHERE
  BloodType = 'AB'
;

-- practice4
UPDATE
  Sales
SET
  Quantity = Quantity + 10
WHERE
  CustomerID = 10
    AND ProductID = 5
    AND SaleDate >= '2007-05-31'
;

-- practice5
UPDATE
  Products
SET
  Price =
    CASE
      WHEN Price >= 2000 THEN Price * 0.8
      ELSE Price * 0.9
    END
WHERE
  CategoryID = 7
  AND Price >= 1000
;
