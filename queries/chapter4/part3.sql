-- practice1
UPDATE
  Customers
SET
  CustomerCode = CustomerCode + 1000;

-- practice2
UPDATE
  Employees
SET
Email = Email || '.co.jp';

-- practice3
UPDATE
  Employees
SET
  Height = Height + 2,
  Weight = Weight - 5
;

-- practice4
UPDATE
  Departments
SET
  DepartmentName = DepartmentName || '部';


-- practice5
UPDATE
  Customers
SET
  CustomerName =
    CASE
      WHEN CustomerClassID = 1 THEN CustomerName || '御中'
      WHEN CustomerClassID = 2 THEN CustomerName || '様'
    END
;
