-- e.g1
SELECT
p.ProductName,
AVG( p.Price *
  CASE 
    WHEN s.Quantity IS NULL THEN 0
    ELSE s.Quantity
  END
) AS 平均販売価格
FROM
Products AS p
LEFT OUTER JOIN
Sales AS s
ON s.ProductID = p.ProductID
GROUP BY 
p.ProductName;

-- practice1
SELECT
A.CustomerName,
SUM(
  CASE
   WHEN B.Quantity IS NULL THEN 0
   ELSE B.Quantity
  END
) AS 販売数量合計
FROM
Customers AS A
LEFT OUTER JOIN
Sales AS B
ON A.CustomerID = B.CustomerID
GROUP BY A.CustomerName;

-- practice2
SELECT
A.EmployeeID,
MAX( A.EmployeeName ) AS 社員名,
SUM(
  CASE
    WHEN B.EmployeeID IS NULL THEN 0
    ELSE 1
  END
) AS 販売件数
FROM
Employees AS A
LEFT OUTER JOIN
Sales AS B
ON A.EmployeeID = B.EmployeeID
GROUP BY
A.EmployeeID
ORDER BY
A.EmployeeName;

-- practice3
SELECT
A.PrefecturalID,
SUM(
  CASE
    WHEN B.CustomerID IS NULL THEN 0
    ELSE 1
  END
)
FROM
Prefecturals AS A
LEFT OUTER JOIN
Customers AS B
ON A.PrefecturalID = B.PrefecturalID
GROUP BY
B.PrefecturalID;

SELECT
A.PrefecturalID,
SUM(
  CASE
    WHEN B.CustomerID IS NULL THEN 0
    ELSE 1
  END
)
FROM
Prefecturals AS A
LEFT OUTER JOIN
Customers AS B
ON A.PrefecturalID = B.PrefecturalID
GROUP BY
A.PrefecturalID;


-- practice4
SELECT
  A.EmployeeID
, CASE
   WHEN B.CNT IS NULL THEN 0
   ELSE B.CNT
  END AS 販売件数
FROM
  Employees AS A
  LEFT OUTER JOIN
  (
    SELECT
      EmployeeID
    , COUNT(*) AS CNT
    FROM
      Sales
    GROUP BY
      EmployeeID
  ) AS B
  ON A.EmployeeID = B.EmployeeID;

---- 別解
-- GROUP BY　していないJOINしているテーブルのカラム名を表示するには
-- 集計関数を使って表示できる
-- でも結果が間違ってるっぽい
SELECT
A.EmployeeID,
MAX ( B.EmployeeName ), -- <<d--ここ
SUM(
  CASE
   WHEN A.EmployeeID IS NULL THEN 0
   ELSE 1
  END
) AS 販売件数
FROM
Sales AS A
LEFT OUTER JOIN
Employees AS B
ON A.EmployeeID = B.EmployeeID
GROUP BY
A.EmployeeID
ORDER BY
A.EmployeeID
;

-- Employees
---- columns
------  employeeid | employeename | height | email | weight | hirefiscalyear | birthday | bloodtype

-- Sales
---- columns
------  saleid | quantity | customerid | productid | employeeid | saledate

-- practice5
SELECT
A.EmployeeName AS 従業員名,
(
  CASE
    WHEN B.Amount IS NULL THEN 0
    ELSE B.Amount
  END
) AS 総支給額
FROM
Employees AS A
LEFT OUTER JOIN
(
  SELECT
    Employeeid,
    Amount
  FROM
    Salary
  WHERE
    PayDate = '2007-02-25'
) AS B
ON A.EmployeeID = B.EmployeeID
ORDER BY
A.EmployeeName
;

-- 支給総額を出す => そもそも支給日1日だけだった
SELECT
A.EmployeeName AS 従業員名,
(
  CASE
    WHEN B.TotalAmount IS NULL THEN 0
    ELSE B.TotalAmount
  END
) AS 総支給額
FROM
Employees AS A
LEFT OUTER JOIN
(
  SELECT
    Employeeid,
    SUM(
      CASE
        WHEN Amount IS NULL THEN 0
        ELSE Amount
      END
    ) AS TotalAmount
  FROM
    Salary
  WHERE
    PayDate = '2007-02-25'
  GROUP BY
    Employeeid
) AS B
ON A.EmployeeID = B.EmployeeID
;
