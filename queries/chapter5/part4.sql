SELECT
  ProductID
  ,ProductName
  ,年月
  ,SUM(
  CASE
    WHEN 販売金額 IS NULL THEN 0
    ELSE 販売金額
  END
) AS 販売合計金額
FROM
(
  SELECT
    p.ProductID
    ,p.ProductName
    ,SUBSTR(CAST( SaleDate AS VARCHAR ), 1, 7) AS 年月
    ,s.Quantity * p.Price AS 販売金額
  FROM
    Sales as s
  JOIN
    Products as p
  ON
    s.productid = p.productid
  WHERE
    p.CategoryID IN (1, 3, 9)
) AS b
GROUP BY
ProductID,
ProductName,
年月
HAVING
SUM (販売金額) > 5000
ORDER BY
ProductID,
ProductName,
年月 desc
;
