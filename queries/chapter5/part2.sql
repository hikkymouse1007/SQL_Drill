SELECT
  年月,
  SUM( 販売金額 ) AS 販売合計金額
FROM
(
  SELECT
    SUBSTR(CAST( SaleDate AS VARCHAR ), 1, 7) AS 年月
    ,s.Quantity * p.Price AS 販売金額
  FROM
    Sales as s
  JOIN
    Products as p
  ON
    s.productid = p.productid
) AS b
GROUP BY 年月
ORDER BY 年月
;
