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
s1.Quantity >
(
  SELECT
  AVG(Quantity)
  FROM
  Sales AS s2
  WHERE
  s1.ProductID = s2.ProductID
)
ORDER BY p.ProductID, s1.SaleDate
DESC;

-- practice1
SELECT DISTINCT
A.ProductID,
B.ProductName,
A.Quantity
FROM
Sales AS A
JOIN
Products AS B
ON
A.ProductID = B.ProductID
WHERE
A.Quantity =
(
  SELECT
  MAX(Quantity)
  FROM
  Sales AS C
  WHERE
  A.ProductID = C.ProductID
)
ORDER BY
A.ProductID;

-- practice2
SELECT
ProductID,
ProductName
FROM
Products AS A
WHERE
 EXISTS
 (
   SELECT
   'X'
   FROM
   Sales AS B
   WHERE
   A.ProductID = B.ProductID
 )
ORDER BY ProductID
;

-- practice3
SELECT
ProductID,
ProductName
FROM
Products AS A
WHERE
  NOT EXISTS
  (
    SELECT
    'X'
    FROM
    Sales AS B
    WHERE
    A.ProductID = B.ProductID
  )
;

-- practice4
SELECT
A.ProductID,
A.ProductName,
B.Quantity
FROM
Products AS A
JOIN
(
  SELECT
    ProductID,
    MAX( Quantity ) AS Quantity
  FROM
    Sales
  GROUP BY
    ProductID
) AS B
ON A.ProductID = B.ProductID;

-- practice5
SELECT
*
FROM
Sales AS A
JOIN
(
  SELECT
ProductID,
AVG( Quantity ),
MAX( Quantity )
FROM
Sales
GROUP BY
ProductID
) AS B;

SELECT
ProductID,
ProductName
FROM
Products AS A
WHERE
ProductID IN
(
  SELECT
  ProductID
  FROM
  Sales AS B
  WHERE
  A.ProductID = B.ProductID
  GROUP BY
  ProductID --解答はこの行が抜けているので注意
  HAVING
  AVG( Quantity )
  <= MAX( Quantity ) / 10
);
