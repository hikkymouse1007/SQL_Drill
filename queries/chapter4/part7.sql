-- e.g1
SELECT
CustomerName AS 氏名
FROM
Customers
UNION ALL
SELECT
EmployeeName AS 氏名
FROM
Employees;

-- practice1
SELECT
DepartmentID AS ID,
DepartmentName AS 名前
FROM
Departments
UNION ALL
SELECT
CategoryID AS ID,
CategoryName AS 名前
FROM
Categories;


-- practice2
SELECT
'Departments' AS テーブル名, -- 各レコードに定数を表示する
DepartmentID AS ID,
DepartmentName AS 名前
FROM
Departments
UNION ALL
SELECT
'Categories' AS テーブル名,
CategoryID AS ID,
CategoryName AS 名前
FROM
Categories
ORDER BY
テーブル名,
ID;

-- practice3, practice4
SELECT
'Departments' AS テーブル名, -- 各レコードに定数を表示する
DepartmentID AS ID,
DepartmentName AS 名前
FROM
Departments
UNION ALL
SELECT
'CustomerClasses' AS テーブル名, -- 各レコードに定数を表示する
CustomerClassID AS ID,
CustomerClassName AS 名前
FROM
CustomerClasses
UNION ALL
SELECT
'Categories' AS テーブル名,
CategoryID AS ID,
CategoryName AS 名前
FROM
Categories
UNION ALL
SELECT
'Prefecturals' AS テーブル名,
PrefecturalID AS ID,
PrefecturalName AS 名前
FROM
Prefecturals
ORDER BY
テーブル名,
ID;

-- practice5
SELECT
A.SaleID,
A.ProductID,
A.Quantity,
B.CustomerClassID,
B.CustomerName
FROM
Sales AS A
JOIN
Customers AS B
ON
A.CustomerID = B.CustomerID
WHERE
A.Quantity >= 10
AND
B.CustomerClassID = 2
UNION ALL
SELECT
A.SaleID,
A.ProductID,
A.Quantity,
B.CustomerClassID,
B.CustomerName
FROM
Sales AS A
JOIN
Customers AS B
ON
A.CustomerID = B.CustomerID
WHERE
A.Quantity >= 100
AND
B.CustomerClassID = 1;

