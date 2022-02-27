-- e.g1
INSERT
INTO Products
(
  ProductID,
  ProductName,
  Price,
  CategoryID
)
VALUES
(
  101,
  'サカナまっしぐら',
  270,
  5
)
;

-- practice1
INSERT
INTO Employees
(
 EmployeeID
, EmployeeName
, Height
, Weight
, Email
, HireFiscalYear
, Birthday
, BloodType
)
VALUES
(
 31
, 'モクモク'
, 170
, 60
, 'moku@nekoyasudo'
, 2007
, '1989-08-08'
, 'AB'
)
;

-- practice2
INSERT
INTO BelongTo
(
  BelongID,
  EmployeeID,
  DepartmentID,
  StartDate
)
VALUES
(
  35,
  31,
  1,
  '2007-09-01'
);

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
VALUES
(
  1006,
  10,
  1,
  40,
  31,
  '2007-09-01'
)
;

-- practice4
INSERT
INTO Salary
(
  SalaryID,
  EmployeeID,
  PayDate,
  Amount
)
VALUES
(
  354,
  31,
  '2007-09-05',
  100000
)

-- practice5
INSERT
INTO Customers
(
  CustomerID,
  CustomerName,
  Address,
  CustomerClassID,
  PrefecturalID
)
VALUES
(
  31,
  '有限会社狢商会',
  '和歌山県吉野郡',
  1,
  30
);
