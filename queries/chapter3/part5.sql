-- e.g1
SELECT
  p.ProductName,
  s1.SaleDate
FROM
  Sales AS s1
JOIN
  Products AS p
  ON s1.ProductID = p.ProductID
WHERE
  s1.Quantity > (
    SELECT
      AVG(Quantity)
    FROM
      Sales AS s2
    WHERE
      s1.ProductID = s2.ProductID
  )
ORDER BY p.ProductID, s1.SaleDate
Desc
;



-- practice1
SELECT
p1.ProductName AS 商品名1,
p2.ProductName AS 商品名2
FROM
Products AS p1
JOIN
Products AS p2
ON p1.ProductID < p2.ProductID
AND p1.CategoryID = p2.CategoryID
;


-- practice2
SELECT
c1.CustomerName AS 顧客名1,
c2.CustomerName AS 顧客名2
FROM
Customers AS c1
JOIN
Customers AS c2
ON c1.CustomerID < c2.CustomerID
AND c1.PrefecturalID = c2.PrefecturalID
AND c1.CustomerClassID = c2.CustomerClassID;

-- practice3
SELECT
e1.EmployeeName AS　従業員名1,
e2.EmployeeName AS　従業員名2
FROM
Employees AS e1
JOIN
Employees AS e2
ON e1.Birthday > e2.Birthday;

-- practice4
SELECT
c1.CategoryName AS カテゴリー1,
c2.CategoryName AS カテゴリー2
FROM
Categories AS c1
JOIN
Categories AS c2
ON
c1.CategoryID < c2.CategoryID;

-- practice5
SELECT
c1.CustomerName AS 顧客名1,
c2.CustomerName AS 顧客名2
FROM
Customers AS c1
JOIN
Customers AS c2
ON c1.CustomerID < c2.CustomerID
AND c1.PrefecturalID = c2.PrefecturalID
AND c1.CustomerClassID = c2.CustomerClassID
WHERE
c1.PrefecturalID <> 13;
