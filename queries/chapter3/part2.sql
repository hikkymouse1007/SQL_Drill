-- e.g1
SELECT
Customers.PrefecturalID,
Prefecturals.PrefecturalName AS 都道府県名,
COUNT(*) AS 顧客数
FROM
Customers
JOIN
Prefecturals
ON Customers.PrefecturalID = Prefecturals.PrefecturalID
GROUP BY
Customers.PrefecturalID,
Prefecturals.PrefecturalName
;

-- practice1
SELECT
EmployeeName,
PayDate,
Amount
FROM
Salary AS A
JOIN
Employees AS B
ON A.EmployeeID = B.EmployeeID
ORDER BY
A.EmployeeID;

-- practice2
SELECT
Quantity,
CustomerName,
ProductName,
EmployeeName
FROM
Sales AS A
JOIN
Customers AS B
ON A.CustomerID =B.CustomerID
JOIN
Products AS C
ON A.ProductID =C.ProductID
JOIN
Employees AS D
ON A.EmployeeID = D.EmployeeID
WHERE
A.Quantity >= 200;

-- practice3
SELECT
B.ProductID,
B.ProductName,
SUM(A.Quantity) AS 数量合計
FROM
Sales AS A
JOIN
Products AS B
ON A.ProductID = B.ProductID
GROUP BY
B.ProductID,
B.ProductName
HAVING
SUM(A.Quantity) > 300;
  
  
-- practice4
SELECT
Quantity,
(
  SELECT
  CustomerName
  FROM
  Customers AS B
  WHERE
  A.CustomerID = B.CustomerID
),
(
  SELECT
  ProductName
  FROM
  Products AS C
  WHERE
  A.ProductID =C.ProductID
),
(
  SELECT
  EmployeeName
  FROM
  Employees AS D
  WHERE
  A.EmployeeID = D.EmployeeID
)
FROM
Sales AS A
WHERE
A.Quantity >= 200;

-- practice5
SELECT
CustomerName,
(
  SELECT
  PrefecturalName
  FROM 
  Prefecturals AS B
  WHERE
  A.PrefecturalID = B.PrefecturalID
),
(
  SELECT
  CustomerClassName
  FROM
  CustomerClasses AS C
  WHERE
  A.CustomerClassID = C.CustomerClassID
)
FROM
Customers AS A
ORDER BY
A.PrefecturalID;
