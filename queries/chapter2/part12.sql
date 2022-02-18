-- e.g1
SELECT
PrefecturalID AS 都道府県,
COUNT(*) AS 顧客数
FROM
Customers
GROUP BY
PrefecturalID
HAVING
COUNT(*) >= 3
;

-- practice1
SELECT
EmployeeID AS 社員ID,
COUNT(*) AS 支給回数
FROM
Salary
GROUP BY
EmployeeID
HAVING
COUNT(*) < 12;

-- practice2
SELECT
PrefecturalID AS 県ID,
COUNT(*) AS 顧客数
FROM
Customers
GROUP BY
PrefecturalID
HAVING
COUNT(*) > 1
;

-- practice3
SELECT
ProductID AS 商品ID,
COUNT(*) AS レコード数
FROM
Sales
GROUP BY
ProductID
HAVING
COUNT(*) >= 10 AND COUNT(*) <= 50;

-- practice4
SELECT
BloodType AS 血液型,
COUNT(*) AS データ件数
FROM
Employees
GROUP BY
BloodType
HAVING
COUNT(*) > 10;

-- practice5
SELECT
ProductID AS 商品ID,
SUM(Quantity) AS 数量合計
FROM
Sales
GROUP BY
ProductID
HAVING
SUM(Quantity) >= 100 AND SUM(Quantity) <= 200;
