-- e.g1
SELECT
PrefecturalID,
COUNT(*)
FROM
Customers
WHERE
CustomerClassID = 1
GROUP BY
PrefecturalID
HAVING
COUNT(*) >= 2
;

-- practice1
SELECT
PrefecturalID AS 県ID,
COUNT(*) AS 顧客数
FROM
Customers
WHERE
PrefecturalID >= 10
GROUP BY
PrefecturalID
HAVING
COUNT(*) > 1
;

-- practice2
SELECT
EmployeeID AS 社員ID,
COUNT(*) AS 支給回数
FROM
Salary
WHERE
EmployeeID >= 20
GROUP BY
EmployeeID
HAVING
COUNT(*) >= 12
;

-- practice3
SELECT
ProductID AS 商品ID,
COUNT(*)
FROM
Sales
WHERE
ProductID >= 20 AND ProductID <= 30
GROUP BY
ProductID
HAVING
COUNT(*) >= 30;

-- practice4
SELECT
BloodType AS 血液型,
COUNT(*) AS　データ数
FROM
Employees
WHERE
Height >= 165
GROUP BY
BloodType
HAVING
COUNT(*) >= 5;

-- practice5
SELECT
ProductID AS 商品ID,
SUM(Quantity) AS 数量合計
FROM
Sales
WHERE
SaleDate >= '2007-06-01'
GROUP BY
ProductID
HAVING
SUM(Quantity) >= 200;
