-- practice1
SELECT
C.CategoryID,
C.CategoryName,
SUM(A.Quantity)
FROM
Sales AS A
JOIN
Products AS B
ON A.ProductID = B.ProductID
JOIN
Categories AS C
ON B.CategoryID = C.CategoryID
GROUP BY
C.CategoryID;

-- practice2
SELECT
SUM(A.Quantity) AS 合計数量,
C.PrefecturalID,
C.PrefecturalName AS 県名
FROM
Sales AS A
JOIN
Customers AS B
ON A.CustomerID = B.CustomerID
JOIN
Prefecturals AS C
ON B.PrefecturalID = C.PrefecturalID
GROUP BY C.PrefecturalID;

-- practice3
SELECT
MAX(A.Quantity),
C.CustomerClassID,
C.CustomerClassName
FROM
Sales AS A
JOIN
Customers AS B
ON A.CustomerID = B.CustomerID
JOIN
CustomerClasses AS C
ON B.CustomerClassID = C.CustomerClassID
GROUP BY
C.CustomerClassID
;

-- practice4
SELECT
SUM(A.Quantity) AS 合計数量,
B.PrefecturalID,
MAX( C.PrefecturalName )
FROM
Sales AS A,
Customers AS B,
Prefecturals AS C
WHERE
A.CustomerID = B.CustomerID
AND
B.PrefecturalID = C.PrefecturalID
GROUP BY
B.PrefecturalID;



-- practice5
SELECT
MAX(A.Quantity),
C.CustomerClassID,
C.CustomerClassName
FROM
Sales AS A,
Customers AS B,
CustomerClasses AS C
WHERE
A.CustomerID = B.CustomerID
AND
B.CustomerClassID = C.CustomerClassID
GROUP BY
C.CustomerClassID;
