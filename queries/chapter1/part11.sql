-- e.g1
SELECT
  PrefecturalID,
  COUNT(*)
FROM
  Customers
GROUP BY
  PrefecturalID
;

-- practice1
SELECT
  CustomerID AS 顧客ID,
  COUNT(*) AS 件数
FROM
  Sales
GROUP BY
  CustomerID
;

-- practice2
SELECT
EmployeeID AS　社員ID,
SUM(Amount) AS 合計
FROM
Salary
GROUP BY
EmployeeID
;

-- practice3
SELECT
CustomerID AS 顧客ID,
ProductID AS 商品ID,
SUM(Quantity) AS 数量
FROM
Sales
GROUP BY
CustomerID,
ProductID
ORDER BY
CustomerID
;

-- practice4
SELECT
BloodType AS 血液型,
AVG(Height) AS 平均身長,
AVG(Weight) AS 平均体重
FROM
Employees
GROUP BY
BloodType
;

-- practice5
SELECT
  EmployeeID AS 社員ID,
  COUNT(*) AS 支給回数,
  AVG(Amount) AS 平均支給額
FROM
  Salary
GROUP BY
  EmployeeID
ORDER BY AVG(Amount) DESC
 ;
